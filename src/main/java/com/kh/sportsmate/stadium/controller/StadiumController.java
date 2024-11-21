package com.kh.sportsmate.stadium.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.stadium.model.vo.Stadium;
import com.kh.sportsmate.stadium.service.StadiumService;

@CrossOrigin
@Controller
public class StadiumController {

    @Autowired
    private StadiumService stadiumService; // 서비스 주입

    @GetMapping(value = "managermypage.me")
    public String managermypage(String select) {
        return "stadium_manager/stadium_manager";
    }

    @RequestMapping(value = "gameschedule.me")
    public String gameschedule() {
        return "stadium_manager/game_schedule";
    }

    @RequestMapping(value = "gamefinish.me")
    public String gamefinish() {
        return "stadium_manager/game_finish";
    }

    @RequestMapping(value = "rentalapproval.me")
    public String rentalapproval() {
        return "stadium_manager/rental_approval";
    }


    @RequestMapping(value = "inquiry.me")
    public String inquiry() {
        return "stadium_manager/inquiry";
    }

    @RequestMapping(value = "managermypage.me")
    public String managermypage() {
        return "stadium_manager/stadium_manager";
    }

    @RequestMapping(value = "gameresult.me")
    public String gameresult() {
        return "stadium_manager/game_result";
    }

    @RequestMapping("/list.st")
    public String showStadiumList() {
        return "stadium/listPage";
    }

    @RequestMapping("/detail.st")
    public String showStadiumdatil() {
        return "stadium/detail";
    }

    /**
     * 구장 수정/삭제 페이지 로드
     * @param session - 로그인한 관리자의 세션 정보
     * @param model - JSP에 전달할 구장 정보를 담는 객체
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
        Stadium stadium = stadiumService.getStadiumByManager(loginMember.getMemNo());
        if (stadium != null) {
            model.addAttribute("stadium", stadium);
        } else {
            // 기본 값이나 에러 처리
        }

        // 구장 정보가 없어도 JSP로 이동 (stadium이 null일 수 있음)
        model.addAttribute("stadium", stadium);
        System.out.println(stadium);

        // stadium_info.jsp로 이동
        return "stadium_manager/stadium_info";
    }
}
