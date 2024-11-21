package com.kh.sportsmate.member.controller;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.Attachment.model.vo.StadiumAttachment;
import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.member.model.dto.ManagerEnrollDto;
import com.kh.sportsmate.member.model.dto.MemberEnrollDto;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.member.service.MemberService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import jdk.nashorn.internal.parser.JSONParser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class MemberController {
    private static final Logger log = LoggerFactory.getLogger(MemberController.class);
    private final MemberService memberService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Value("${sns.naver.clientId}")
    private String clientID;
    @Value("${sns.naver.clientSecret}")
    private String clientSecret;

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

    /**
     * 사용자 회원가입 폼 이동
     * @return
     */
    @RequestMapping(value = "memberEnrollForm.me")
    public String memberEnrollForm() {
        return "member/memberEnrollForm";
    }

    /**
     * 관리자 회원가입 폼 이동
     * @return
     */
    @RequestMapping(value = "managerEnrollForm.me")
    public String managerEnrollForm() {
        return "member/managerEnrollForm";
    }

    /**
     * 로그인 폼 이동
     * @return
     */
    @RequestMapping(value = "loginForm.me")
    public String loginForm() {
        return "member/loginForm";
    }

    /**
     * 사용자 회원가입
     * @param m 기본 정보(memEmail, memPwd, memName, memGender, year, month, day, phone1~3, memberZipcode, memberBaseAdd,
     *          memberDetailAdd, category, soccerPosition, soccerSkill, futsalPosition, futsalSkill, basketballPosition,
     *          basketballSkill, baseballPosition, baseballSkill)
     * @param userProfile 프로필 이미지
     * @param session Path를 얻기 위해 필요한 세션 객체
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
     * @param m 이메일, 비밀번호
     * @param session 세션ID 저장을 위한 객체
     * @param saveId 이메일 저장(쿠키)
     * @param response 쿠키에 저장하기 위한 객체
     * @return
     */
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

    /**
     * 세션ID 만료
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
     * @param code
     * @param state
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "naver-login")
    public String naverLoginCallback(String code, String state, HttpServletRequest request) throws Exception {
        String redirectURL = URLEncoder.encode(request.getContextPath(), "UTF-8");
        String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
        apiURL += "client_id=" + this.clientID;
        apiURL += "&client_secret=" + clientSecret;
        apiURL += "&redirect_uri=" + redirectURL;
        apiURL += "&code=" + code;
        apiURL += "&state=" + state;
        log.info("URL : {}",apiURL); // @Slf4j 어노테이션 추가시 이런식으로 로그 찍기 가능

//        URL url = new URL(apiURL);
//        HttpURLConnection con = (HttpURLConnection) url.openConnection(); // 요청 연결
        HttpURLConnection con = Template.connect(apiURL); // 요청 연결
        int responseCode = con.getResponseCode();
        log.info("responseCode : {}",responseCode); // 응답 코드 로그 출력
        BufferedReader br;
        if(responseCode == 200){
            br = new BufferedReader(new InputStreamReader(con.getInputStream())); // 한 줄씩 꺼낼 수 있다.
        }else{ // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }

        // 응답데이터 읽어오기

        String inputLine;
        StringBuffer res = new StringBuffer(); // String 보다 처리 방식이 빠름
        while ((inputLine = br.readLine()) != null){
            res.append(inputLine);
        }
        br.close();
        if(responseCode == 200){
            // 정상적으로 정보가 받아왔다면 출력
            String result = res.toString();
            log.info("result : {}", result);

            // access_token 값 추출
            // JSON Object로 가져온다.
            JsonObject totalObj = JsonParser.parseString(result).getAsJsonObject();
            String accessToken = totalObj.get("access_token").getAsString(); // 정보접근을 위한 토큰

            String header = "Bearer " + accessToken;

            String infoApiURL = "https://openapi.naver.com/v1/nid/me";
            Map<String, String> requestHeaders = new HashMap<>();
            requestHeaders.put("Authorization", header);
            String responseBody = get(infoApiURL, requestHeaders);
            JsonObject memberInfo = JsonParser.parseString(responseBody).getAsJsonObject();
            log.info("memberInfo : {}",memberInfo);
            memberInfo = memberInfo.getAsJsonObject("response");
            log.info("result : {}", memberInfo);
            // 받아온 email과 데이터베이스의 email을 비교하여 가입유무 판단한 후
            // 가입되어있다면 로그인, 가입되어있지 않다면 회원가입창으로 해당정보를 담아서 보내주면 된다.
            String birthYear = memberInfo.get("birthyear").getAsString();
            String birthDay = memberInfo.get("birthday").getAsString().replace("-", ".");
            String birth = birthYear.concat(".").concat(birthDay);
            Member m = new Member();
            m.setMemName(memberInfo.get("name").toString());
            m.setMemEmail(memberInfo.get("email").toString());
            m.setMemGender(memberInfo.get("gender").toString());
            m.setMemPhone(memberInfo.get("mobile").toString());
            m.setMemBirth(birth);

            log.info("네이버 회원 정보 : {}", m);
        }
        return "redirect:/";
    }

}