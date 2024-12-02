package com.kh.sportsmate.stadium.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.stadium.model.dto.StadiumDto;
import com.kh.sportsmate.stadium.model.dto.StadiumRefundDto;
import com.kh.sportsmate.stadium.service.StadiumService;

@CrossOrigin
@Controller
public class StadiumController {

    @Autowired
    private StadiumService stadiumService; // 서비스 주입

 // 구장 관리자의 마이페이지로 이동
    @GetMapping(value = "managermypage.me")
    public String managermypage(String select) {
        return "stadium_manager/stadium_manager";
    }

    // 경기 일정 관리 페이지로 이동
    @RequestMapping(value = "gameschedule.me")
    public String gameschedule() {
        return "stadium_manager/game_schedule";
    }

    // 경기 종료 관리 페이지로 이동
    @RequestMapping(value = "gamefinish.me")
    public String gamefinish() {
        return "stadium_manager/game_finish";
    }

    // 문의사항 확인 페이지로 이동
    @RequestMapping(value = "inquiry.me")
    public String inquiry() {
        return "stadium_manager/inquiry";
    }

    // 경기 결과 관리 페이지로 이동
    @RequestMapping(value = "gameresult.me")
    public String gameresult() {
        return "stadium_manager/game_result";
    }

    // 구장 리스트 페이지로 이동
    @RequestMapping("/list.st")
    public String showStadiumList() {
        return "stadium/listPage";
    }

    // 구장 상세 페이지로 이동
    @RequestMapping("/detail.st")
    public String showStadiumdetail() {
        return "stadium/detail";
    }
    
 // 구장 관리자의 마이페이지로 이동 (중복된 메서드, 삭제가 필요할 수 있음)
    @RequestMapping(value = "managermypage.me")
    public String managermypage() {
        return "stadium_manager/stadium_manager";
    }
    
 // 환불 관리 페이지로 이동
    @RequestMapping(value = "stadiumrefund.me")
    public String stadiumrefund(HttpSession session, Model model) {
        
        // 세션에서 로그인한 회원 정보 가져오기
        Member loginMember = (Member) session.getAttribute("loginMember");

        // 로그인 상태 확인
        if (loginMember == null) {
            return "redirect:/login.me"; // 로그인 페이지로 리다이렉트
        }

        // 로그인한 회원의 회원 번호 가져오기
        int memNo = loginMember.getMemNo();
        
        // 구매 확정된 매치 정보 가져오기
        List<StadiumRefundDto> refundPageData = stadiumService.getRefundPageData(memNo);
        System.out.println("Refund Data: " + refundPageData);

        // 모델에 환불 정보 추가
        model.addAttribute("refundPageData", refundPageData);

        // 환불 관리 페이지로 이동
        return "stadium_manager/stadium_refund";
    }
    
    // 환불성공 요청
    @PostMapping(value = "/refundProcess.me")
    public String processRefund(int reservationNo, String refundReason, String reasonType, HttpSession session) {
        // 세션에서 로그인한 회원 정보 가져오기
        Member loginMember = (Member) session.getAttribute("loginMember");

        // 로그인 상태 확인
        if (loginMember == null) {
            return "redirect:/login.me"; // 로그인 페이지로 리다이렉트
        }

        // 환불 처리 로직
        boolean isProcessed = stadiumService.processRefund(reservationNo, refundReason, reasonType);

        if (isProcessed) {
            // 성공 시 환불 관리 페이지로 리다이렉트
            return "redirect:/stadiumrefund.me";
        } else {
            // 실패 시 에러 페이지로 이동
            return "redirect:/errorPage.me";
        }
    }




    /**
     * 관리자가 소유한 단일 구장 조회
     * @param session - 로그인한 관리자의 세션 정보
     * @param model - JSP에 전달할 구장 정보
     * @return stadium_manager/stadium_info.jsp
     */
    @RequestMapping(value = "stadiuminfo.me")
    public String stadiumInfo(HttpSession session, Model model) {
        // 세션에서 로그인한 회원 정보 가져오기
        Member loginMember = (Member) session.getAttribute("loginMember");

        // 로그인 정보가 없으면 로그인 페이지로 리다이렉트
        if (loginMember == null) {
            return "redirect:/loginForm.me";
        }

        // 관리자의 MEM_NO로 구장 정보 가져오기
        StadiumDto stadium = stadiumService.getStadiumByManager(loginMember.getMemNo());
        List<StadiumDto> stadiumImages = stadiumService.getStadiumImagesByManager(loginMember.getMemNo());

        model.addAttribute("stadium", stadium);
        model.addAttribute("stadiumImages", stadiumImages);

        // stadium_info.jsp로 이동
        return "stadium_manager/stadium_info";
    }

    /**
     * 구장 정보 수정 처리
     * @param session - 로그인 세션
     * @param stadiumDto - 폼에서 전달받은 수정된 구장 정보
     * @return redirect:/stadiuminfo.me
     */
    @PostMapping(value = "/updateStadium.me")
    public String updateStadium(HttpSession session, StadiumDto stadiumDto, Model model) {
        // 세션에서 로그인한 회원 정보 가져오기
        Member loginMember = (Member) session.getAttribute("loginMember");

        // 로그인 정보가 없으면 로그인 페이지로 리다이렉트
        if (loginMember == null) {
            return "redirect:/loginForm.me";
        }

        // 업데이트 처리
        int result = stadiumService.updateStadium(stadiumDto);

        if (result > 0) {
        	// 성공 시 다시 정보를 가져와서 현재 페이지로 이동
        	StadiumDto updatedStadium = stadiumService.getStadiumByManager(loginMember.getMemNo());
            List<StadiumDto> stadiumImages = stadiumService.getStadiumImagesByManager(loginMember.getMemNo());
            model.addAttribute("stadium", updatedStadium);
            model.addAttribute("stadiumImages", stadiumImages);
        	
            // 성공 시 정보 페이지로 리다이렉트
            return "redirect:/stadiuminfo.me";
        } else {
            // 실패 시 에러 페이지 또는 재수정 요청
            return "redirect:/errorPage.me";
        }
    }
}
