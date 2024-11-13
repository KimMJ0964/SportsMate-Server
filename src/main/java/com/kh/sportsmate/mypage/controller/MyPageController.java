package com.kh.sportsmate.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.match.model.vo.MatchBest;
import com.kh.sportsmate.member.model.dto.MemberPosition;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.place.model.vo.PlaceReview;
import com.kh.sportsmate.service.MemberService;
import com.kh.sportsmate.service.MyPageService;
import com.kh.sportsmate.team.model.vo.Recruit;
import com.kh.sportsmate.team.model.vo.Team;

@CrossOrigin
@Controller
public class MyPageController {
	
	private final MemberService memberService;
    private final MyPageService myPageService;
    
    @Autowired
    public MemberController(MemberService memberService, BCryptPasswordEncoder bCryptPasswordEncoder, MyPageService myPageService){
        this.memberService = memberService;
		this.myPageService = myPageService;
    }
	
	/* 마이페이지 */
    @RequestMapping("myPageInfo.mp")
    public String myPageSelect(Model model) {
    	int memNo = 1;
    	
    	// 내 정보
    	MemberPosition myInfo = myPageService.selectMyInfo(memNo);
    	
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
        ArrayList<MemberPosition> aTeamInfo = myPageService.selectATeamInfo(teamANo);
        ArrayList<MemberPosition> bTeamInfo = myPageService.selectBTeamInfo(teamBNo);
        
        // 데이터를 Map에 담아 JSON 형식으로 반환
        Map<String, Object> result = new HashMap<>();
        result.put("aTeamInfo", aTeamInfo);
        result.put("bTeamInfo", bTeamInfo);
        
        return result;
    }
}
