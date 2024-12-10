package com.kh.sportsmate.stadium.controller;

import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.kh.sportsmate.admin.model.dto.StadiumPenaltyDTO;
import com.kh.sportsmate.stadium.model.dto.*;
import com.kh.sportsmate.team.model.dto.MatchResultTeamInfoDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.kh.sportsmate.board.model.vo.Board;

import com.kh.sportsmate.board.model.vo.Board;
import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;
import com.kh.sportsmate.stadium.service.StadiumService;

@CrossOrigin
@Slf4j
@Controller
public class StadiumController {
	
	private final StadiumService stadiumService;

	@Autowired
    public StadiumController(StadiumService stadiumService) {
		this.stadiumService = stadiumService;
	}
	
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
	
	@RequestMapping(value = "stadiuminfo.me")
    public String stadiuminfo() {
        return "stadium_manager/stadium_info";
    }
	
	/**
     * 문의 페이지
     *
     * @param model
     * @param session
     * @return
     */
	@RequestMapping(value = "inquiry.me")
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
	
	@RequestMapping(value = "managermypage.me")
    public String managermypage() {
        return "stadium_manager/stadium_manager";
    }
	
	@RequestMapping(value = "gameresult.me")
    public String gameresult() {
        return "stadium_manager/game_result";
    }

    @RequestMapping("/detail.st")
    public String getStadiumDetail(
    		@RequestParam("stadiumNo") int stadiumNo,
    		@RequestParam(value = "selectedDate", required = false) String selectedDate,
    		@RequestParam(value = "currentPage", defaultValue = "1") int currentPage,
    		HttpSession session,
    		Model model) {

        // 로그인된 사용자 정보 가져오기
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            // 로그인되지 않은 경우 처리
            return "redirect:/loginForm.me";
        }

        int memNo = loginMember.getMemNo();

        // 팀 번호 조회
        int teamNo = stadiumService.getTeamNoByMemNo(memNo);

        // 구단 멤버 정보 가져오기
        List<StadiumDetailmodal> stadiumReservation = new ArrayList<>();
        if (teamNo > 0) {
            stadiumReservation = stadiumService.getStadiumReservation(teamNo);
        }

        // 게시글 개수 조회
        int listCount = stadiumService.getReviewCount(stadiumNo);

        // PageInfo 생성
        int pageLimit = 10; // 페이징바 최대 개수
        int boardLimit = 3; // 한 페이지에 보여질 리뷰 개수
        PageInfo pi = Template.getPageInfo(listCount, currentPage, pageLimit, boardLimit);

        // 리뷰 리스트 조회
        List<StadiumReviewDto> reviews = stadiumService.getPagedReviewsByStadiumNo(stadiumNo, currentPage, boardLimit);

        // 경기장 상세 정보 가져오기
        StadiumDetail stadiumDetail = stadiumService.getStadiumDetail(stadiumNo);
        stadiumDetail.setReviews(reviews);

        // 돈 계산
        int discountedPrice = stadiumDetail.getStadiumPrice() / 2;

        // 구단장 번호 추출
        Integer teamLeaderId = null;
        if (!stadiumReservation.isEmpty()) {
            teamLeaderId = stadiumReservation.get(0).getTmemNo();
        }

        // 모델에 데이터 추가
        model.addAttribute("stadiumDetail", stadiumDetail);
        model.addAttribute("selectedDate", selectedDate);
        model.addAttribute("stadiumNo", stadiumNo);
        model.addAttribute("reviews", reviews);
        model.addAttribute("pi", pi);
        model.addAttribute("stadiumReservation", stadiumReservation); // 모달용 데이터 추가
        model.addAttribute("discountedPrice", discountedPrice);
        model.addAttribute("teamLeaderId", teamLeaderId);
        model.addAttribute("teamNo", teamNo);

        // 뷰로 이동
        return "stadium/detail";
    }

    /**
     * 경기 결과 입력 AJAX
     * @param gameResultDTO 경기 결과 파싱 객체(List<Rating> ratings, TeamScore teamScore,  String matchNo)
     * @return
     */
    @ResponseBody
    @PostMapping(value = "game_result.gp")
    public String gameResult(@RequestBody GameResultDTO gameResultDTO){
        log.info("전달받은 rating : {}", gameResultDTO);
        int result = stadiumService.insertGameResult(gameResultDTO);
        if(result > 0){
            return "XXXXY";
        }else{
            return "XXXXX";
        }

    }

    @RequestMapping("searchStadium.st")
    public String searchResults(
    		@RequestParam(value = "cpage", defaultValue = "1") int currentPage, // 현재 페이지
    		@RequestParam(value = "stadiumName", required = false) String stadiumName,
    		@RequestParam(value = "stadiumAddress", required = false) String stadiumAddress,
    		@RequestParam(value = "stadiumCategory", required = false) String stadiumCategory,
    		@RequestParam(value = "stadiumStartTime", required = false) String stadiumStartTime,
    		@RequestParam(value = "stadiumEndTime", required = false) String stadiumEndTime,
    		@RequestParam(value = "selectedDate", required = false) String selectedDate,
    		@RequestParam(value = "activityArea", required = false) String activityArea,
    		Model model) {

    	if (currentPage < 1) {
    		currentPage = 1;
    	}

        if ("전체".equals(stadiumCategory)) {
            stadiumCategory = null; // "전체"를 null로 설정
        }

        if ("전체".equals(activityArea)) {
            activityArea = null; // "전체"를 null로 설정
        }

    	// 검색 조건 설정
    	StadiumSearch sd = new StadiumSearch(stadiumName, stadiumAddress, stadiumCategory, stadiumStartTime, stadiumEndTime, selectedDate, activityArea);

        // 검색 결과 개수 조회
        int listCount = stadiumService.getSearchResultCount(stadiumName, stadiumAddress, stadiumCategory, stadiumStartTime, stadiumEndTime, selectedDate, activityArea);

        // 페이지네이션 정보 생성
        PageInfo pi = Template.getPageInfo(listCount, currentPage, 12, 12);

        // 페이징된 검색 결과 조회
        List<StadiumSearch> results = stadiumService.getPaginatedStadiums(pi, stadiumName, stadiumAddress, stadiumCategory, stadiumStartTime, stadiumEndTime, selectedDate, activityArea);

        // Model에 데이터 전달
		model.addAttribute("stadiumName", stadiumName); // 구장 이름
		model.addAttribute("stadiumAddress", stadiumAddress); // 구장 주소
		model.addAttribute("stadiumCategory", stadiumCategory); // 종목 선택
		model.addAttribute("stadiumStartTime", stadiumStartTime); // 시작 시간
		model.addAttribute("stadiumEndTime", stadiumEndTime); // 끝 시간
		model.addAttribute("selectedDate", selectedDate); // 선택한 날짜
		model.addAttribute("activityArea", activityArea); // 선택한 지역 코드
		model.addAttribute("results", results); // 검색 결과 리스트
		model.addAttribute("pi", pi);
		return "stadium/listPage"; // 검색 결과 페이지
    }

    @ResponseBody
    @PostMapping(value = "warning_reason.gp")
    public String insertPenalty(StadiumPenaltyDTO penaltyInfo, HttpServletRequest request) {
        log.info("패널티 정보 : {}",penaltyInfo);
        int result = stadiumService.insertPenalty(penaltyInfo);
        if(result > 0){
            return "XXXXY";
        }else {
            return "XXXXX";
        }
//        return "redirect:/";
    }
    @GetMapping(value = "game_detail.gp")
    public String moveGameResultView(int matchNo, HttpServletRequest request, HttpSession session){
        /*
         * gameResult View 에서 필요한 객체
         * matchNo V
         * teamAInfo(teamNo, changeName,teamName) V
         * teamBInfo(teamNo, changeName,teamName) V
         * teamAMemberList(memNo, memName)
         * teamBMemberList(memNo, memName)
         * stadiumNo
         * */
        // 팀 정보 조회
        MatchResultTeamInfoDTO teamInfo = stadiumService.selectTeamInfo(matchNo);
        log.info("경기 결과 디테일 관련 팀 정보 : {}",teamInfo);

        // 구장 정보 조회
        Member m = (Member) session.getAttribute("loginMember");
        int stadiumNo = stadiumService.getStadiumNo(m.getMemNo());
        log.info("구장 번호 조회 : {}",stadiumNo);

        // 경기 참가 A팀 팀원 리스트 조회
        Map<String, Object> map = new HashMap<>();
        map.put("matchNo", matchNo);
        map.put("teamNo", teamInfo.getTeamANo());
        ArrayList<MatchResultMemberInfoDTO> teamAMemberList = stadiumService.selectMatchMemberInfo(map);
        log.info("A 팀 참가 선수 리스트 조회 결과 : {}",teamAMemberList);
        map.clear();
        map.put("matchNo", matchNo);
        map.put("teamNo", teamInfo.getTeamBNo());
        ArrayList<MatchResultMemberInfoDTO> teamBMemberList = stadiumService.selectMatchMemberInfo(map);
        log.info("B 팀 참가 선수 리스트 조회 결과 : {}",teamBMemberList);

        request.setAttribute("matchNo", matchNo);
        request.setAttribute("teamInfo", teamInfo);
        request.setAttribute("stadiumNo",stadiumNo);
        request.setAttribute("teamAMemberList",teamAMemberList);
        request.setAttribute("teamBMemberList",teamBMemberList);
        return "stadium_manager/game_result";
    }

}
