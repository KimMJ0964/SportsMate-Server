package com.kh.sportsmate.stadium.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.stadium.model.dto.StadiumDto;
import com.kh.sportsmate.stadium.model.dto.StadiumRefundDto;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;
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
    @RequestMapping(value = "gameschedule.gp")
    public String gameschedule() {
        return "stadium_manager/game_schedule";
    }

    // 경기 종료 관리 페이지로 이동
    @RequestMapping(value = "gamefinish.gp")
    public String gamefinish() {
        return "stadium_manager/game_finish";
    }

    /**
     * 문의 페이지
     *
     * @param model
     * @param session
     * @return
     */
	@RequestMapping(value = "inquiry.gp")
    public String inquiry(@RequestParam(value = "cpage", defaultValue = "1") int currentPage,Model m, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();
		
		int inquiryCount = stadiumService.selectInquiryCount(memNo);
		
		PageInfo pi = Template.getPageInfo(inquiryCount, currentPage, 10, 10);
		
		ArrayList<StadiumQna> myInquiry = stadiumService.inquiryList(memNo, pi);
		
		m.addAttribute("pi", pi);
		m.addAttribute("myInquiry", myInquiry);
		
        return "stadium_manager/inquiry";
    }
	
	/**
     * 문의 답장
     *
     * @param model
     * @param session
     * @return
     */
	@RequestMapping(value = "inquiryUpdate.me")
    public String inquiryUpdate(StadiumQna sq, HttpSession session) {
		int result = stadiumService.inquiryUpdate(sq);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "문의 답장 성공");
		} else {
			session.setAttribute("alertMsg", "문의 답장 실패");
		}
		
        return "redirect:inquiry.me?cpage=1";
    }

    // 경기 결과 관리 페이지로 이동
    @RequestMapping(value = "gameresult.gp")
    public String gameresult() {
        return "stadium_manager/game_result";
    }

    // 구장 리스트 페이지로 이동
    @RequestMapping("/list.gp")
    public String showStadiumList() {
        return "stadium/listPage";
    }

    // 구장 상세 페이지로 이동
    @RequestMapping("/detail.gp")
    public String showStadiumdetail() {
        return "stadium/detail";
    }
    
 // 환불 관리 페이지로 이동
    @RequestMapping(value = "stadiumrefund.gp")
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
    
    // 환불 요청
    @PostMapping(value = "/refundProcess.me", produces = "application/json; charset=utf-8")
    @ResponseBody
    public Map<String, Object> processRefund(HttpSession session,
        @RequestParam int refundNo, 
        @RequestParam String refundContent
    ) {
        Map<String, Object> response = new HashMap<>();
        boolean isProcessed = stadiumService.processRefund(refundNo, refundContent);
        response.put("success", isProcessed);
        return response;
    }





    /**
     * 관리자가 소유한 단일 구장 조회
     * @param session - 로그인한 관리자의 세션 정보
     * @param model - JSP에 전달할 구장 정보
     * @return stadium_manager/stadium_info.jsp
     */
    @RequestMapping(value = "stadiuminfo.gp")
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
            return "redirect:/stadiuminfo.gp";
        } else {
            // 실패 시 에러 페이지 또는 재수정 요청
            return "redirect:/errorPage.me";
        }
    }
}