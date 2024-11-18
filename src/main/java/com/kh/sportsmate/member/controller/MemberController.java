package com.kh.sportsmate.member.controller;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.Attachment.model.vo.StadiumAttachment;
import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.member.model.dto.ManagerEnrollDto;
import com.kh.sportsmate.member.model.dto.MemberEnrollDto;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.member.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

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
    private static final Logger log = LoggerFactory.getLogger(MemberController.class);
    private final MemberService memberService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public MemberController(MemberService memberService, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.memberService = memberService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    /***
     * 관리자, 일반 사용자 회원가입 선택 폼으로 포워딩
     * @return
     */
    @GetMapping(value = "enrollSelect.me")
    public String enrollSelectForm(String select) {
        return "member/enrollSelectForm";
    }

    @RequestMapping(value = "memberEnrollForm.me")
    public String memberEnrollForm() {
        return "member/memberEnrollForm";
    }

    @RequestMapping(value = "managerEnrollForm.me")
    public String managerEnrollForm() {
        return "member/managerEnrollForm";
    }

    @RequestMapping(value = "loginForm.me")
    public String loginForm() {
        return "member/loginForm";
    }

    @PostMapping(value = "member_enroll.me")
    public String memberEnroll(MemberEnrollDto m, MultipartFile userProfile, HttpSession session) {
        Profile profile = null;
        System.out.println("profile : " + userProfile);
        System.out.println(m);
        String path = "resources/images/userProFile/";
        String savePath = session.getServletContext().getRealPath(path);
        if (!userProfile.getOriginalFilename().equals("")) {
            String changeName = Template.saveFile(userProfile, session, path);
            profile = new Profile(userProfile.getOriginalFilename(), changeName, savePath);
        }
        String encPwd = bCryptPasswordEncoder.encode(m.getMemPwd()); // 비밀번호 암호화
        m.setMemPwd(encPwd);
        int result = memberService.insertMember(m, profile);

        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다.");
            return "redirect:/";
        } else {
            session.setAttribute("alertMsg", "회원가입에 실패했습니다.");
            return "redirect:/";
        }
    }

    @PostMapping("login.me")
    public String loginMember(Member m, HttpSession session, String saveId, HttpServletResponse response) {
        Member loginMember = memberService.loginMember(m);
        log.info("로그인 멤버 정보 : {}",loginMember);
        if (loginMember == null) {
            session.setAttribute("alertMsg", "일치하는 아이디를 찾을 수 없습니다.");
            return "redirect:/loginForm.me";
        } else if (!bCryptPasswordEncoder.matches(m.getMemPwd(), loginMember.getMemPwd())) {
            session.setAttribute("alertMsg", "비밀번호가 틀렸습니다.");
            return "redirect:/loginForm.me";
        } else {
            Cookie ck = new Cookie("saveId", loginMember.getMemEmail());
            if (saveId == null) {
                ck.setMaxAge(0); // 쿠키 삭제
            }
            response.addCookie(ck);
            session.setAttribute("loginMember", loginMember);
            session.setAttribute("alertMsg", "로그인에 성공하셨습니다.");
            System.out.println(loginMember);
            return "redirect:/";
        }

    }
    
    @PostMapping("/logout.me")
    public String logout(HttpSession session) {
        // 세션 초기화
        session.invalidate();
        
        // 로그아웃 후 메인 페이지로 리다이렉트
        return "redirect:/";
    }

    @PostMapping(value = "manager_enroll.me")
    public String managerEnroll(ManagerEnrollDto m, MultipartFile thumbnailImg, List<MultipartFile> detailImg, HttpSession session) {
        System.out.println(m);
        System.out.println("thumbnailImg" + thumbnailImg);
        System.out.println("detailImg" + detailImg);
        System.out.println(m.getStartTime().getClass().getName());
        ArrayList<StadiumAttachment> stadiumAttachmentImgs = new ArrayList<>();
        String path = "resources/images/stadiumFile/";
        String savePath = session.getServletContext().getRealPath(path);
        if (!thumbnailImg.getOriginalFilename().equals("") && !detailImg.isEmpty()) {
            String changeName = Template.saveFile(thumbnailImg, session, path);
            stadiumAttachmentImgs.add(new StadiumAttachment(thumbnailImg.getOriginalFilename(), changeName, savePath, 0));
            for (MultipartFile detailFile : detailImg) {
                changeName = Template.saveFile(detailFile, session, path);
                stadiumAttachmentImgs.add(new StadiumAttachment(detailFile.getOriginalFilename(), changeName, savePath, 1));
            }
        }
        String encPwd = bCryptPasswordEncoder.encode(m.getMemPwd()); // 비밀번호 암호화
        m.setMemPwd(encPwd);
        int result = memberService.insertManagerMember(m, stadiumAttachmentImgs);

        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다.");
            return "redirect:/";
        } else {
            session.setAttribute("alertMsg", "회원가입에 실패했습니다.");
            return "redirect:/";
        }
    }

    @ResponseBody
    @GetMapping(value = "emailCheck.me")
    public String emailCheck(String email, HttpServletResponse response) {
        int result = memberService.emailCheck(email);
        if (result > 0) {
            return "NNNNN";
        } else {
            return "NNNNY";
        }
    }
}