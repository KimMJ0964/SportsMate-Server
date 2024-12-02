package com.kh.sportsmate.member.controller;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.Attachment.model.vo.StadiumAttachment;
import com.kh.sportsmate.common.kakaoAPI.kakaoAPI;
import com.kh.sportsmate.common.mail.service.MailService;
import com.kh.sportsmate.common.naverAPI.naverAPI;
import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.member.model.dto.ManagerEnrollDto;
import com.kh.sportsmate.member.model.dto.MemberEnrollDto;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.member.service.MemberService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.kh.sportsmate.common.template.Template.createTmpPwd;
import static com.kh.sportsmate.common.template.Template.get;

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
@Slf4j
@Controller
@RequiredArgsConstructor
public class MemberController {
    private static final Logger log = LoggerFactory.getLogger(MemberController.class);
    @Autowired
    private final MemberService memberService;
    @Autowired
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    @Autowired
    private final MailService mailService;
    @Autowired
    private final kakaoAPI kakaoAPI;
    @Autowired
    private final naverAPI naverAPI;
    @Value("${sns.naver.clientId}")
    private String naverClientID;
    @Value("${sns.naver.redirectURI}")
    private String naverRedirectURI;
    @Value("${sns.naver.clientSecret}")
    private String naverClientSecret;
    @Value("${sns.kakao.clientId}")
    private String kakaoClientId;
    @Value("${sns.kakao.redirectURI}")
    private String kakaoRedirectURI;


    /***
     * 관리자, 일반 사용자 회원가입 선택 폼으로 포워딩
     * @return
     */
    @GetMapping(value = "enrollSelect.me")
    public String enrollSelectForm(String select) {
        return "member/enrollSelectForm";
    }

    /**
     * 사용자 회원가입 폼 이동
     *
     * @return
     */
    @RequestMapping(value = "memberEnrollForm.me")
    public String memberEnrollForm() {
        return "member/memberEnrollForm";
    }

    /**
     * 관리자 회원가입 폼 이동
     *
     * @return
     */
    @RequestMapping(value = "managerEnrollForm.me")
    public String managerEnrollForm() {
        return "member/managerEnrollForm";
    }

    /**
     * 로그인 폼 이동
     *
     * @return
     */
    @RequestMapping(value = "loginForm.me")
    public String loginForm(Model model) {
        model.addAttribute("naverClientId", naverClientID);
        model.addAttribute("naverRedirectURI", naverRedirectURI);
        model.addAttribute("kakaoClientId", kakaoClientId);
        model.addAttribute("kakaoRedirectURI", kakaoRedirectURI);

        return "member/loginForm";
    }

    /**
     * 사용자 회원가입
     *
     * @param m           기본 정보(memEmail, memPwd, memName, memGender, year, month, day, phone1~3, memberZipcode, memberBaseAdd,
     *                    memberDetailAdd, category, soccerPosition, soccerSkill, futsalPosition, futsalSkill, basketballPosition,
     *                    basketballSkill, baseballPosition, baseballSkill)
     * @param userProfile 프로필 이미지
     * @param session     Path를 얻기 위해 필요한 세션 객체
     * @return 메인페이지로 리다이렉트
     */
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

    /**
     * 로그인
     *
     * @param m        이메일, 비밀번호
     * @param session  세션ID 저장을 위한 객체
     * @param saveId   이메일 저장(쿠키)
     * @param response 쿠키에 저장하기 위한 객체
     * @return
     */
    @PostMapping("login.me")
    public String loginMember(Member m, HttpSession session, String saveId, HttpServletResponse response) {
        Member loginMember = memberService.loginMember(m);
        log.info("로그인 멤버 정보 : {}", loginMember);
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

    /**
     * 세션ID 만료
     *
     * @param session
     * @return
     */
    @RequestMapping("/logout.me")
    public String logout(HttpSession session) {
        // 세션 초기화
        session.invalidate();

        // 로그아웃 후 메인 페이지로 리다이렉트
        return "redirect:/";
    }

    /**
     * 구장 관리자 회원가입
     *
     * @param m
     * @param thumbnailImg
     * @param detailImg
     * @param session
     * @return
     */
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

    /**
     * 이메일 중복 확인 AJAX
     *
     * @param email 입력된 이메일
     * @return
     */
    @ResponseBody
    @GetMapping(value = "emailCheck.me")
    public String emailCheck(String email) {
        int result = memberService.emailCheck(email);
        if (result > 0) {
            return "NNNNN";
        } else {
            return "NNNNY";
        }
    }

    /**
     * 네이버 로그인(Oauth2.0)
     *
     * @param code    kakao 인가 코드
     * @param state   네이버 로그인 과정 중 동일한 값을 유지하는 임의의 문자열(CSRF 공격 보호)
     * @param request request 객체
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "naver-login")
    public String naverLoginCallback(String code, String state, HttpServletRequest request, HttpSession session) throws Exception {
        String redirectURL = URLEncoder.encode(request.getContextPath(), "UTF-8");
        String accessToken = naverAPI.getAccessToken(code, state, redirectURL);
        Member naverMemInfo = naverAPI.getUserInfo(accessToken);
        Map<Integer, Member> confirmResult = memberService.confirmMember(naverMemInfo);
        int key = 0;
        if (confirmResult.size() == 1) {
            key = confirmResult.keySet().iterator().next();
        }
        switch (key) {
            case 1: // 기존 회원이 아닌경우
                session.setAttribute("alertMsg", "회원가입이 필요합니다.");
                session.setAttribute("authMemInfo", naverMemInfo);
                return "redirect:/memberEnrollForm.me";
            case 2: // 도메인이 동일한 회원이 있는 경우
                session.setAttribute("loginMember", confirmResult.get(2));
                session.setAttribute("alertMsg", "로그인에 성공하셨습니다.");
                return "redirect:/";
            case 3: // 도메인이 다른 회원이 있는 경우
                Member confirmMember = memberService.loginMember(naverMemInfo);
                String maskedEmail = Template.maskingEmail(confirmResult.get(3).getMemEmail());
                request.setAttribute("resultHeader", "기존 회원 존재");
                request.setAttribute("description", "기존에 다른 이메일로 가입하신 정보가 있습니다.");
                request.setAttribute("body", maskedEmail);
                return "member/searchResult";
            default:

                session.setAttribute("alertMsg", "네이버 로그인에 실패하였습니다.");
                return "redirect:/";
        }
    }

    /**
     * 카카오 로그인
     *
     * @param code              인가 코드
     * @param state             네이버 로그인 과정 중 동일한 값을 유지하는 임의의 문자열(CSRF 공격 보호)
     * @param error             인가 코드 요청에 대한 에러 코드
     * @param error_description 인가 코드 요청에 대한 에러 설명
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "kakao-login")
    public String kakaoLogin(String code, String state, String error, String error_description, HttpServletRequest request, HttpSession session) {
        log.info("인증 코드 : {}", code);
        log.info("응답 코드 : {}", state);
        log.info("에러 코드 : {}", error);
        log.info("에러 설명 : {}", error_description);
        String accessToken = kakaoAPI.getAccessToken(code);
        log.info("accessToken : {}", accessToken);
        Member kakaoMemberInfo = kakaoAPI.getUserInfo(accessToken);

        Map<Integer, Member> confirmResult = memberService.confirmMember(kakaoMemberInfo);
        int key = 0;
        if (confirmResult.size() == 1) {
            key = confirmResult.keySet().iterator().next();
        }
        switch (key) {
            case 1: // 기존 회원이 아닌경우
                session.setAttribute("alertMsg", "회원가입이 필요합니다.");
                session.setAttribute("authMemInfo", kakaoMemberInfo);
                return "redirect:/memberEnrollForm.me";
            case 2: // 도메인이 동일한 회원이 있는 경우
                session.setAttribute("loginMember", confirmResult.get(2));
                session.setAttribute("alertMsg", "로그인에 성공하셨습니다.");
                return "redirect:/";
            case 3: // 도메인이 다른 회원이 있는 경우
                Member confirmMember = memberService.loginMember(kakaoMemberInfo);
                String maskedEmail = Template.maskingEmail(confirmResult.get(3).getMemEmail());
                request.setAttribute("resultHeader", "기존 회원 존재");
                request.setAttribute("description", "기존에 다른 이메일로 가입하신 정보가 있습니다.");
                request.setAttribute("body", maskedEmail);
                return "member/searchResult";
            default:    
                session.setAttribute("alertMsg", "네이버 로그인에 실패하였습니다.");
                return "redirect:/";
        }
    }

    /**
     * 아이디 | 비밀번호 찾기 뷰 이동
     *
     * @return
     */
    @GetMapping(value = "searchInfo.me")
    public String moveSearchInfo() {
        return "member/searchInfoForm";
    }

    /**
     * Email 찾기
     *
     * @param memInfo 기본 정보(memName, memBirth)
     * @param session
     * @param request
     * @return
     */
    @PostMapping(value = "searchId.me")
    public String searchId(MemberEnrollDto memInfo, HttpSession session, HttpServletRequest request) {
        String email = memberService.searchEmail(memInfo);
        if (email != null) {
            request.setAttribute("resultHeader", "이메일 찾기");
            request.setAttribute("description", "조회하신 이메일");
            request.setAttribute("body", email);
            return "member/searchResult";
        } else {
            session.setAttribute("alertMsg", "가입된 회원이 존재하지 않습니다.");
            return "redirect:/searchInfo.me";
        }
    }

    /**
     * 임시 비밀번호 발급
     *
     * @param memInfo 기본 정보(memEmail, memName)
     * @param session
     * @param request
     * @return
     */
    @PostMapping(value = "searchPwd.me")
    public String searchPwd(MemberEnrollDto memInfo, HttpSession session, HttpServletRequest request) {
        String tempPwd = createTmpPwd();
        String encPwd = bCryptPasswordEncoder.encode(tempPwd); // 비밀번호 암호화
        memInfo.setMemPwd(encPwd);
        int result = memberService.updatePwd(memInfo);
        if (result > 0) {
            boolean success = mailService.tmpPwdIssue(tempPwd, memInfo.getMemEmail());
        } else {
            session.setAttribute("alertMsg", "임시 비밀번호 발급에 실패했습니다. 다시 시도해주세요.");
            return "redirect:/searchInfo.me";
        }
        request.setAttribute("resultHeader", "임시 비밀번호 발급 되었습니다.");
        request.setAttribute("description", "이메일을 확인해주세요.");
        request.setAttribute("body", "발급된 임시 비밀번호는 꼭 수정해주세요.");
        return "member/searchResult";
    }
}