package com.kh.sportsmate.stadium.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.kh.sportsmate.admin.model.dto.StadiumPenaltyDTO;
import com.kh.sportsmate.stadium.model.dto.GameFinishDto;
import com.kh.sportsmate.stadium.model.dto.GameResultDTO;

import com.kh.sportsmate.team.model.dto.MatchResultTeamInfoDTO;
import lombok.RequiredArgsConstructor;
import com.kh.sportsmate.stadium.model.dto.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sportsmate.stadium.model.dto.StadiumDetail;
import com.kh.sportsmate.stadium.model.dto.StadiumDetailmodal;
import com.kh.sportsmate.stadium.model.dto.StadiumQnaDto;
import com.kh.sportsmate.stadium.model.dto.StadiumReviewDto;
import com.kh.sportsmate.stadium.model.dto.StadiumSearch;

import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.stadium.model.dto.GameScheduleDto;
import com.kh.sportsmate.stadium.model.dto.StadiumDto;
import com.kh.sportsmate.stadium.model.dto.StadiumRefundDto;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;
import com.kh.sportsmate.stadium.service.StadiumService;

@CrossOrigin
@Slf4j
@Controller
@RequiredArgsConstructor
public class StadiumController {
	
	private final StadiumService stadiumService;

	
	@GetMapping(value = "managermypage.me")
    public String managermypage(String select) {
        return "stadium_manager/stadium_manager";
    }

    // 경기 일정 관리 페이지로 이동
    @RequestMapping(value = "gameschedule.gp")
    public String gameschedule(HttpSession session, Model model) {
    	Member loginMember = (Member) session.getAttribute("loginMember");

        if (loginMember == null) {
            return "redirect:/loginForm.me"; // 로그인 페이지로 리다이렉트
        }

        int memNo = loginMember.getMemNo();
        List<GameScheduleDto> gameScheduleList = stadiumService.getGameScheduleData(memNo);

        System.out.println("Controller 결과: " + gameScheduleList);
        model.addAttribute("gameScheduleList", gameScheduleList);
    	
        return "stadium_manager/game_schedule";
    }

    // 경기 종료 관리 페이지로 이동
    @RequestMapping(value = "gamefinish.gp")
    public String gamefinish(HttpSession session, Model model) {
    	Member loginMember = (Member) session.getAttribute("loginMember");

        if (loginMember == null) {
            return "redirect:/loginForm.me"; // 로그인 페이지로 리다이렉트
        }


        // 구장 번호 가져오기
        int stadiumNo = stadiumService.getStadiumByManager(loginMember.getMemNo()).getStadiumNo();

        // 진행 완료 매치 리스트 가져오기
        List<GameFinishDto> completedMatches = stadiumService.getCompleteMatches(stadiumNo);
        log.info("dddd: {}",completedMatches);

        // match_no 리스트를 모델에 추가
        List<Integer> matchNoList = completedMatches.stream()
                                                    .map(GameFinishDto::getMatchNo)
                                                    .collect(Collectors.toList());
        model.addAttribute("completedMatches", completedMatches); // 매치 리스트
        model.addAttribute("matchNoList", matchNoList); // match_no 리스트
        return "stadium_manager/game_finish";
    }

    /**
     * 문의 페이지
     *
     * @param model
     * @param session
     * @return
     */
	@RequestMapping(value = "inquiry.gp")
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
		
        return "redirect:inquiry.gp?cpage=1";
    }

 // 환불 관리 페이지로 이동
    @RequestMapping(value = "stadiumrefund.gp")
    public String stadiumrefund(HttpSession session, Model model) {
        
        // 세션에서 로그인한 회원 정보 가져오기
        Member loginMember = (Member) session.getAttribute("loginMember");

        // 로그인 상태 확인
        if (loginMember == null) {
            return "redirect:/login.me"; // 로그인 페이지로 리다이렉트
        }

        // 로그인한 회원의 회원 번호 가져오기
        int memNo = loginMember.getMemNo();
        
        // 구매 확정된 매치 정보 가져오기
        List<StadiumRefundDto> refundPageData = stadiumService.getRefundPageData(memNo);
        System.out.println("Refund Data: " + refundPageData);

        // 모델에 환불 정보 추가
        model.addAttribute("refundPageData", refundPageData);

        // 환불 관리 페이지로 이동
        return "stadium_manager/stadium_refund";
    }
    
    // 환불 요청
    @PostMapping(value = "/refundProcess.me", produces = "application/json; charset=utf-8")
    @ResponseBody
    public Map<String, Object> processRefund(HttpSession session,
        @RequestParam("matchNo") int matchNo
    ) {
        Map<String, Object> response = new HashMap<>();
        boolean isProcessed = stadiumService.deleteMatchAndBest(matchNo);
        response.put("success", isProcessed);
        return response;
    }





    /**
     * 관리자가 소유한 단일 구장 조회
     * @param session - 로그인한 관리자의 세션 정보
     * @param model - JSP에 전달할 구장 정보
     * @return stadium_manager/stadium_info.jsp
     */
    @RequestMapping(value = "stadiuminfo.gp")
    public String stadiumInfo(HttpSession session, Model model) {
        // 세션에서 로그인한 회원 정보 가져오기
        Member loginMember = (Member) session.getAttribute("loginMember");

        // 로그인 정보가 없으면 로그인 페이지로 리다이렉트
        if (loginMember == null) {
            return "redirect:/loginForm.me";
        }

        // 관리자의 MEM_NO로 구장 정보 가져오기
        StadiumDto stadium = stadiumService.getStadiumByManager(loginMember.getMemNo());
        List<StadiumDto> stadiumImages = stadiumService.getStadiumImagesByManager(loginMember.getMemNo());

        model.addAttribute("stadium", stadium);
        model.addAttribute("stadiumImages", stadiumImages);

        // stadium_info.jsp로 이동
        return "stadium_manager/stadium_info";
    }

    /**
     * 구장 정보 수정 처리
     * @param session - 로그인 세션
     * @param stadiumDto - 폼에서 전달받은 수정된 구장 정보
     * @return redirect:/stadiuminfo.me
     */
    @PostMapping(value = "/updateStadium.me")
    public String updateStadium(HttpSession session, StadiumDto stadiumDto, Model model) {
        // 세션에서 로그인한 회원 정보 가져오기
        Member loginMember = (Member) session.getAttribute("loginMember");

        // 로그인 정보가 없으면 로그인 페이지로 리다이렉트
        if (loginMember == null) {
            return "redirect:/loginForm.me";
        }

        // 업데이트 처리
        int result = stadiumService.updateStadium(stadiumDto);

        if (result > 0) {
        	// 성공 시 다시 정보를 가져와서 현재 페이지로 이동
        	StadiumDto updatedStadium = stadiumService.getStadiumByManager(loginMember.getMemNo());
            List<StadiumDto> stadiumImages = stadiumService.getStadiumImagesByManager(loginMember.getMemNo());
            model.addAttribute("stadium", updatedStadium);
            model.addAttribute("stadiumImages", stadiumImages);
        	
            // 성공 시 정보 페이지로 리다이렉트
            return "redirect:/stadiuminfo.gp";
        } else {
            // 실패 시 에러 페이지 또는 재수정 요청
            return "redirect:/errorPage.me";
        }
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
        Integer teamNo = null;
        teamNo = stadiumService.getTeamNoByMemNo(memNo,stadiumNo);
        log.info("teamNo: {}",teamNo);
        // 구단 멤버 정보 가져오기
        List<StadiumDetailmodal> stadiumReservation = new ArrayList<>();
        if (teamNo != null) {
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

        // 구단장 번호 추출
        Integer teamLeaderId = null;
        if (stadiumReservation!=null &&!stadiumReservation.isEmpty()) {
            teamLeaderId = stadiumReservation.get(0).getTmemNo();
        }

        // 모델에 데이터 추가
        model.addAttribute("stadiumDetail", stadiumDetail);
        model.addAttribute("selectedDate", selectedDate);
        model.addAttribute("stadiumNo", stadiumNo);
        model.addAttribute("reviews", reviews);
        model.addAttribute("pi", pi);
        model.addAttribute("stadiumReservation", stadiumReservation); // 모달용 데이터 추가
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
    
    /**
     * 선택된 날짜와 시간에 따라 팀 정보 조회 AJAX
     * @param request 요청 데이터 객체 (accessDate, startTime, endTime, stadiumNo)
     * @return 팀 정보 리스트
     */
    @ResponseBody
    @PostMapping("/stadium/teams")
    public List<TeamDto> getTeamsByDateAndTime(@RequestBody MatchRequestDto request) {
        log.info("전달받은 요청 데이터: {}", request);

        // 서비스 호출
        List<TeamDto> teamList = stadiumService.findTeamsByDateAndTime(request);

        // 결과 확인 후 반환
        if (teamList != null && !teamList.isEmpty()) {
            log.info("조회된 팀 목록: {}", teamList);
            return teamList;
        } else {
            log.info("조회된 팀이 없습니다.");
            return Collections.emptyList(); // 빈 리스트 반환
        }
    }
   
    /**
     * 문의 등록
     *
     * @param qnaRequestDto
     * @param session
     * @return
     */
    @RequestMapping(value = "inquiryInsert.me", method = RequestMethod.POST)
    public String inquiryInsert(StadiumQnaDto stadiumQnaDto, HttpSession session, Model model) {
        // 세션에서 로그인된 사용자 정보 확인
        Member loginMember = (Member) session.getAttribute("loginMember");
        if (loginMember == null) {
            model.addAttribute("errorMsg", "로그인이 필요합니다.");
            return "common/errorPage"; // 에러 페이지로 리다이렉트
        }

        // 사용자 번호 설정
        stadiumQnaDto.setQMemNo(loginMember.getMemNo());

        // 서비스 호출
        boolean result = stadiumService.insertQna(stadiumQnaDto);

        // 성공 여부에 따라 리다이렉트
        if (result) {
            session.setAttribute("alertMsg", "문의가 성공적으로 등록되었습니다.");
            return "redirect:inquiry.me"; // 문의 목록 페이지로 리다이렉트
        } else {
            model.addAttribute("errorMsg", "문의 등록에 실패했습니다.");
            return "common/errorPage";
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

    /**
     * 경고 사유 등록 AJAX
     * @param penaltyInfo
     * @param request
     * @return
     */
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
