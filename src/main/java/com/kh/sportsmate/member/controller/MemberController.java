package com.kh.sportsmate.member.controller;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.match.model.vo.MatchBest;
import com.kh.sportsmate.member.model.dto.MemberEnrollDto;
import com.kh.sportsmate.member.model.vo.Category;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.place.model.vo.PlaceReview;
import com.kh.sportsmate.service.MemberService;
import com.kh.sportsmate.service.MyPageService;
import com.kh.sportsmate.team.model.vo.Recruit;
import com.kh.sportsmate.team.model.vo.Team;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
    private final MemberService memberService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final MyPageService myPageService;
    
    @Autowired
    public MemberController(MemberService memberService, BCryptPasswordEncoder bCryptPasswordEncoder, MyPageService myPageService){
        this.memberService = memberService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
		this.myPageService = myPageService;
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
    public String memberEnroll(MemberEnrollDto m, MultipartFile userProfile, HttpSession session){
        Profile profile = null;
        System.out.println("profile : "+userProfile);
        System.out.println(m);
        String path = "resources/images/userProFile/";
        String savePath = session.getServletContext().getRealPath(path);
        if (!userProfile.getOriginalFilename().equals("")){
            String changeName = Template.saveFile(userProfile,session, path);
            profile = new Profile(userProfile.getOriginalFilename(), changeName, savePath);
        }
        String encPwd = bCryptPasswordEncoder.encode(m.getMemPwd()); // 비밀번호 암호화
        m.setMemPwd(encPwd);
        int result = memberService.insertMember(m, profile);

        if(result > 0){
            session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다.");
            return "redirect:/";
        }else{
            session.setAttribute("alertMsg", "회원가입에 실패했습니다.");
            return "redirect:/";
        }
    }
    @PostMapping("login.me")
    public String loginMember(Member m, HttpSession session, String saveId, HttpServletResponse response){
        Member loginMember = memberService.loginMember(m);
        if(loginMember == null){
            session.setAttribute("alertMsg", "일치하는 아이디를 찾을 수 없습니다.");
            return "redirect:/loginForm.me";
        }else if(!bCryptPasswordEncoder.matches(m.getMemPwd(), loginMember.getMemPwd())){
            session.setAttribute("alertMsg", "비밀번호가 틀렸습니다.");
            return "redirect:/loginForm.me";
        }else{
            Cookie ck = new Cookie("saveId", loginMember.getMemEmail());
            if(saveId == null){
                ck.setMaxAge(0); // 쿠키 삭제
            }
            response.addCookie(ck);
            session.setAttribute("loginMember",loginMember);
            session.setAttribute("alertMsg", "로그인에 성공하셨습니다.");
            System.out.println(loginMember);
            return "redirect:/";
        }

    }
    
    /* 마이페이지 */
    @RequestMapping("myPageInfo.mp")
    public String myPageSelect(Model model) {
    	int memNo = 1;
    	
    	// 내 정보
    	Member myInfo = myPageService.selectMyInfo(memNo);
    	
    	// 내 전적
    	ArrayList<Match> myMatch = myPageService.selectMyMatch(memNo); 
    	
    	// 내 전적 판 수
    	int myMatchCount = myPageService.selectMyMatchCount(memNo);
    	
    	// 내 전적 이긴 판 수
    	int myMatchWinCount = myPageService.selectMyMatchWinCount(memNo);
    	
    	// 내 구단
    	ArrayList<Team> myTeam = myPageService.selectMyTeam(memNo);
    	
    	// 내 구단 입단 명단
    	ArrayList<Recruit> myRecruit = myPageService.selectMyRecruit(memNo);
    	
    	model.addAttribute("myMatchWinCount", myMatchWinCount);
    	model.addAttribute("myMatchCount", myMatchCount);
    	model.addAttribute("myMatch", myMatch);
    	model.addAttribute("myInfo", myInfo);
		model.addAttribute("myTeam", myTeam);
		model.addAttribute("myRecruit", myRecruit);
		
    	return "myPage/myPage";
    }
    
    /* 베스트 플레이어 및 구장 별점 */
    @RequestMapping("myPageVote.mp")
    public String myPageVote(HttpSession session, Model model, String reviewContent, double reviewStar, int placeNo, int matchNo, int bestMNo) {
        int memNo = 1;
        
        System.out.println("리뷰 내용 : " + reviewContent);
        System.out.println("리뷰 별점 : " + reviewStar);
        System.out.println("구장 번호 : " + placeNo);
        System.out.println("매치 번호 : " + matchNo);
        System.out.println("최고의 플레이어 번호 : " + bestMNo);
        
        PlaceReview pr = new PlaceReview(reviewContent, reviewStar, placeNo, memNo);
        int reviewResult = myPageService.insertPReview(pr);
        
        MatchBest mb = new MatchBest(memNo, matchNo);
        Map<String, Object> map = new HashMap<>();
        map.put("mb", mb);
        map.put("bestMNo", bestMNo);
        int bpChoice = myPageService.bestPlayerChoice(map);
        
        if(reviewResult > 0 && bpChoice > 0){
            session.setAttribute("alertMsg", "리뷰 작성이 완료되었습니다.");
            return "redirect:/myPageInfo.mp";
        }else{
            session.setAttribute("alertMsg", "리뷰 작성에 실패했습니다.");
            return "redirect:/myPageInfo.mp";
        }
    }
    
    /* 베스트 플레이어 매치 플레이어 출력 */
    @RequestMapping("getTeamInfo.mp")
    @ResponseBody
    public Map<String, Object> getTeamInfo(@RequestParam int teamANo, @RequestParam int teamBNo) {
        ArrayList<Member> aTeamInfo = myPageService.selectATeamInfo(teamANo);
        ArrayList<Member> bTeamInfo = myPageService.selectBTeamInfo(teamBNo);
        
        // 데이터를 Map에 담아 JSON 형식으로 반환
        Map<String, Object> result = new HashMap<>();
        result.put("aTeamInfo", aTeamInfo);
        result.put("bTeamInfo", bTeamInfo);
        
        return result;
    }
}
