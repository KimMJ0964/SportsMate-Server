package com.kh.sportsmate.stadium.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dto.StadiumSearch;
import com.kh.sportsmate.stadium.model.dto.StadiumDetail;
import com.kh.sportsmate.stadium.model.dto.WeatherResponse;
import com.kh.sportsmate.stadium.service.StadiumService;

@CrossOrigin
@Controller
public class stadiumController {
	
	private final StadiumService stadiumService;
    
    @Autowired
    public stadiumController( StadiumService stadiumService){
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
	
	@RequestMapping(value = "inquiry.me")
    public String inquiry() {
        return "stadium_manager/inquiry";
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
    		Model model) {
    	
    	// Service 호출하여 경기장 상세 정보 가져오기
    	StadiumDetail stadiumDetail = stadiumService.getStadiumDetail(stadiumNo);
    	
    	// 모델에 데이터 추가
    	model.addAttribute("stadiumDetail", stadiumDetail);
    	model.addAttribute("selectedDate", selectedDate);
    	model.addAttribute("stadiumNo", stadiumNo);
    	
    	// 뷰로 이동
    	return "stadium/detail";
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
    		Model model) {
    	
    	if (currentPage < 1) {
    		currentPage = 1;
    	}
    	
    	if ("전체".equals(stadiumAddress)) {
    	     stadiumAddress = null; // "전체"를 null로 설정
        }
        if ("전체".equals(stadiumCategory)) {
            stadiumCategory = null; // "전체"를 null로 설정
        }
    	
    	// 검색 조건 설정
    	StadiumSearch sd = new StadiumSearch(stadiumName, stadiumAddress, stadiumCategory, stadiumStartTime, stadiumEndTime, selectedDate);

        // 검색 결과 개수 조회
        int listCount = stadiumService.getSearchResultCount(stadiumName, stadiumAddress, stadiumCategory, stadiumStartTime, stadiumEndTime, selectedDate);

        // 페이지네이션 정보 생성
        PageInfo pi = Template.getPageInfo(listCount, currentPage, 12, 12);

        // 페이징된 검색 결과 조회
        List<StadiumSearch> results = stadiumService.getPaginatedStadiums(pi, stadiumName, stadiumAddress, stadiumCategory, stadiumStartTime, stadiumEndTime, selectedDate);
        
        // Model에 데이터 전달
		model.addAttribute("stadiumName", stadiumName); // 구장 이름
		model.addAttribute("stadiumAddress", stadiumAddress); // 구장 주소
		model.addAttribute("stadiumCategory", stadiumCategory); // 종목 선택
		model.addAttribute("stadiumStartTime", stadiumStartTime); // 시작 시간
		model.addAttribute("stadiumEndTime", stadiumEndTime); // 끝 시간
		model.addAttribute("selectedDate", selectedDate); // 선택한 날짜
		model.addAttribute("results", results); // 검색 결과 리스트
		model.addAttribute("pi", pi);
		return "stadium/listPage"; // 검색 결과 페이지
    }
}
