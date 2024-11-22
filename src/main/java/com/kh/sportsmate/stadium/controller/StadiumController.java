package com.kh.sportsmate.stadium.controller;

import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.stadium.model.dto.StadiumDto;
import com.kh.sportsmate.stadium.model.vo.Amenities;
import com.kh.sportsmate.stadium.model.vo.Rental;
import com.kh.sportsmate.stadium.service.StadiumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@CrossOrigin
@Controller
public class StadiumController {

    @Autowired
    private StadiumService stadiumService;

    @GetMapping(value = "managermypage.me")
    public String managermypage() {
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

    @RequestMapping(value = "gameresult.me")
    public String gameresult() {
        return "stadium_manager/game_result";
    }

    @RequestMapping("/list.st")
    public String showStadiumList() {
        return "stadium/listPage";
    }

    @RequestMapping("/detail.st")
    public String showStadiumDetail() {
        return "stadium/detail";
    }

    /**
     * 관리자가 소유한 단일 구장 조회
     * @param session - 로그인한 관리자의 세션 정보
     * @param model - JSP에 전달할 구장 정보
     * @return stadium_manager/stadium_info.jsp
     */
    @RequestMapping(value = "stadiuminfo.me")
    public String stadiumInfo(HttpSession session, Model model) {
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/loginForm.me";
        }

        // 관리자의 구장 정보 가져오기
        StadiumDto stadium = stadiumService.getStadiumByManager(loginMember.getMemNo());
        List<StadiumDto> stadiumImages = stadiumService.getStadiumImagesByManager(loginMember.getMemNo());

        model.addAttribute("stadium", stadium);
        model.addAttribute("stadiumImages", stadiumImages);

        return "stadium_manager/stadium_info";
    }

    /**
     * 구장 정보 수정 처리
     * @param session - 로그인 세션
     * @param stadiumDto - 폼에서 전달받은 수정된 구장 정보
     * @param amenities - 폼에서 전달받은 편의시설 정보
     * @param rental - 폼에서 전달받은 대여 정보
     * @return redirect:/stadiuminfo.me
     */
    @PostMapping(value = "/updateStadium.me")
    public String updateStadium(HttpSession session, 
                                 @ModelAttribute StadiumDto stadiumDto, 
                                 @ModelAttribute Amenities amenities, 
                                 @ModelAttribute Rental rental) {
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            return "redirect:/loginForm.me";
        }

        // 업데이트를 위해 필요한 정보 설정
        stadiumDto.setMemNo(loginMember.getMemNo());
        amenities.setStadiumNo(stadiumDto.getStadiumNo());
        rental.setStadiumNo(stadiumDto.getStadiumNo());

        boolean isUpdated = stadiumService.updateStadium(stadiumDto, amenities, rental);

        if (isUpdated) {
            return "redirect:/stadiuminfo.me";
        } else {
            return "redirect:/errorPage.me";
        }
    }
}
