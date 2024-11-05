package com.kh.sportsmate.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * packageName    : com.kh.sportsmate.member.controller
 * fileName       : MemberController
 * author         : jun
 * date           : 2024. 11. 5.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 5.        jun       최초 생성
 */
@CrossOrigin
@Controller
public class MemberController {

    /***
     * 관리자, 일반 사용자 회원가입 선택 폼으로 포워딩
     * @return
     */
    @GetMapping(value = "enrollSelect.me")
    public String enrollSelectForm(String select){
        return "member/enrollSelectForm";
    }
    @RequestMapping(value = "memberEnrollForm.me")
    public String memberEnrollForm(){
        return "member/memberEnrollForm";
    }
    @RequestMapping(value = "managerEnrollForm.me")
    public String managerEnrollForm(){
        return "member/managerEnrollForm";
    }
}
