package com.kh.sportsmate.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.match.model.vo.MatchBest;
import com.kh.sportsmate.match.model.vo.MatchQna;
import com.kh.sportsmate.member.model.dto.MemberEnrollDto;
import com.kh.sportsmate.member.model.dto.MemberModifyDto;
import com.kh.sportsmate.member.model.dto.MemberPosition;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.member.model.vo.ProfileFile;
import com.kh.sportsmate.member.service.MemberService;
import com.kh.sportsmate.stadium.model.vo.StadiumReview;
import com.kh.sportsmate.mypage.service.MyPageService;
import com.kh.sportsmate.team.model.vo.Recruit;
import com.kh.sportsmate.team.model.vo.Team;

@CrossOrigin
@Controller
public class MyPageController {
	
    private final MyPageService myPageService;
    private final MemberService memberService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    
    @Autowired
    public MyPageController( BCryptPasswordEncoder bCryptPasswordEncoder, MyPageService myPageService, MemberService memberService){
		this.myPageService = myPageService;
		this.memberService = memberService;
		this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }
	
	/* 마이페이지 */
    @RequestMapping("myPageInfo.mp")
    public String myPageSelect(Model model, HttpSession session) {
    	Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();
    	
    	// 내 정보
    	MemberPosition myInfo = myPageService.selectMyInfo(memNo);
    	
    	// 내 프로필 사진
    	Profile myProfile = myPageService.selectMyProfile(memNo);
    	
    	if(myProfile != null) {
    		String filePath = myProfile.getFilePath() + myProfile.getChangeName();
    		model.addAttribute("filePath", filePath);
    	}
    	
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
    	
    	// 내 문의
    	ArrayList<MatchQna> myQna = myPageService.selectMyQna(memNo);
    	
    	for(MatchQna myQna2 : myQna) {
    		System.out.println(myQna2);
    	}
    	
    	model.addAttribute("myQna", myQna);
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
    public String myPageVote(HttpSession session, Model model, String reviewContent, double reviewStar, int stadiumNo, int matchNo, int bestMNo) {
    	Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();
		Map<String, Integer> checkMap = new HashMap<>();
		checkMap .put("memNo", memNo);
		checkMap .put("matchNo", matchNo);
        
        MatchBest check = myPageService.checkReview(checkMap);
        System.out.println(check);
        
        if(check == null) {
        	StadiumReview pr = new StadiumReview(reviewContent, reviewStar, stadiumNo, memNo);
        	int reviewResult = myPageService.insertPReview(pr);
            
            MatchBest mb = new MatchBest(memNo, matchNo);
            Map<String, Integer> map = new HashMap<>();
            map.put("matchNo", matchNo);
            map.put("bestMNo", bestMNo);
            map.put("memNo", memNo);
            int bpChoice = myPageService.bestPlayerChoice(map);
            int bpVote = myPageService.bestPlayerVote(map);
            
            if(reviewResult > 0 && (bpChoice > 0 && bpVote > 0)){
                session.setAttribute("alertMsg", "리뷰 작성이 완료되었습니다.");
                return "redirect:/myPageInfo.mp";
            }else{
                session.setAttribute("alertMsg", "리뷰 작성에 실패했습니다.");
                return "redirect:/myPageInfo.mp";
            }
        } else {
        	session.setAttribute("alertMsg", "이미 작성한 리뷰입니다.");
            return "redirect:/myPageInfo.mp";
        }
    }
    
    /* 베스트 플레이어 매치 플레이어 출력 */
    @RequestMapping("getTeamInfo.mp")
    @ResponseBody
    public Map<String, Object> getTeamInfo(@RequestParam int teamANo, @RequestParam int teamBNo) {
        ArrayList<MemberPosition> aTeamInfo = myPageService.selectATeamInfo(teamANo);
        ArrayList<MemberPosition> bTeamInfo = myPageService.selectBTeamInfo(teamBNo);
        
        // 데이터를 Map에 담아 JSON 형식으로 반환
        Map<String, Object> result = new HashMap<>();
        result.put("aTeamInfo", aTeamInfo);
        result.put("bTeamInfo", bTeamInfo);
        
        return result;
    }
    
    // 내 정보 수정 페이지 이동
    @RequestMapping("modifyMyInfoMove.mp")
    public String modifyMyInfo(Model m, HttpSession session) {
    	Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();
		
		MemberModifyDto member = myPageService.myInfoList(memNo);
		
		m.addAttribute("member", member);
		
		return "myPage/myPageModify";
    }
    
    // 내 정보 수정 로직
    @PostMapping(value = "modifyMyInfo.mp")
    public String memberEnroll(MemberEnrollDto m, MultipartFile userProfile, HttpSession session) {
        Profile profile = null;
        Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();
        System.out.println("profile : " + userProfile);
        m.setMemNo(memNo);
        System.out.println(m);
        String path = "resources/images/userProFile/";
        String savePath = session.getServletContext().getRealPath(path);
        if (!userProfile.getOriginalFilename().equals("")) {
            String changeName = Template.saveFile(userProfile, session, path);
            profile = new Profile(userProfile.getOriginalFilename(), changeName, savePath);
        }
        int result = myPageService.modifyMember(m, profile, session);

        if (result > 0) {
            session.setAttribute("alertMsg", "성공적으로 회원가입이 완료되었습니다.");
            return "redirect:/";
        } else {
            session.setAttribute("alertMsg", "회원가입에 실패했습니다.");
            return "redirect:/";
        }
    }
    
    // 비밀번호 수정
    @RequestMapping("modifyPwd.mp")
    public String modifyPassword(String memPwd, String pwdCheck, String pwdModify, HttpSession session) {
    	Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();

		System.out.println(memNo + " / " + memPwd + " / " + pwdCheck + " / " + pwdModify);
		// 비밀번호 확인: 입력한 기존 비밀번호와 재입력된 비밀번호 비교
	    if (!pwdCheck.equals(memPwd)) {
	        session.setAttribute("alertMsg", "기존 비밀번호와 재입력한 비밀번호가 다릅니다.");
	        return "myPage/myPageModify";
	    }

	    // 1. 기존 비밀번호와 저장된 암호화된 비밀번호 비교
	    String storedPassword = loginMember.getMemPwd(); // 저장된 암호화된 비밀번호
	    if (!bCryptPasswordEncoder.matches(memPwd, storedPassword)) {
	        session.setAttribute("alertMsg", "기존 비밀번호가 일치하지 않습니다.");
	        return "myPage/myPageModify";
	    }
	    
	    String passwordPattern = "^[A-Za-z0-9]{6,16}$"; // 6~16자리 영문자와 숫자만 허용
	    if (!pwdModify.matches(passwordPattern)) {
	        session.setAttribute("alertMsg", "새 비밀번호는 6~16자리의 영문자와 숫자 조합이어야 합니다.");
	        return "myPage/myPageModify";
	    }
	    
	    // 2. 새 비밀번호 암호화
	    String encodedNewPassword = bCryptPasswordEncoder.encode(pwdModify);
	    System.out.println("memPwd : " + memPwd);
	    System.out.println("encodedNewPassword : " + encodedNewPassword);
	    
	    Map<String, String> map = new HashMap<>();
		map.put("memNo", String.valueOf(memNo));
		map.put("encodedNewPassword", encodedNewPassword);

	    // 3. 새 비밀번호 변경
	    int isUpdated = myPageService.updatePassword(map);
	    if (isUpdated > 0) {
	        session.setAttribute("alertMsg", "비밀번호 변경에 성공했습니다.");
	        return "myPage/myPageModify";
	    } else {
	        session.setAttribute("alertMsg", "비밀번호 변경에 실패했습니다.");
	        return "myPage/myPageModify";
	    }
    }
    
    // 로그아웃
    @RequestMapping("logout.mp")
    public String logOut(HttpSession session) {
    	session.removeAttribute("loginMember");
		
		return "redirect:/";
    }
    
    // 계정 탈퇴
    @RequestMapping("accountCancel.mp")
    public String accountCancel(HttpSession session) {
    	Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();
		
		int result = myPageService.accountCancel(memNo);
		
		if (result > 0) {
			session.setAttribute("alertMsg", "회원 탈퇴에 성공했습니다.");
			session.removeAttribute("loginMember");
	    	return "redirect:/";
        } else {
        	session.setAttribute("alertMsg", "회원 탈퇴에 실패했습니다.");
        	return "redirect:/";
        }
    }
}