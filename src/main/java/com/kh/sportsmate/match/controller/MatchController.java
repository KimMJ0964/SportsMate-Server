package com.kh.sportsmate.match.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.match.model.dto.ApproveResponseDto;
import com.kh.sportsmate.match.model.dto.MyMatch;
import com.kh.sportsmate.match.model.dto.OrderCreateFormDto;
import com.kh.sportsmate.match.model.dto.ReadyResponseDto;
import com.kh.sportsmate.match.model.dto.StadiumSubscription;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.match.service.MatchService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@CrossOrigin
@Controller
public class MatchController {
	private final MatchService matchService;

	@Autowired
	public MatchController(MatchService matchService) {
		super();
		this.matchService = matchService;
	}
	
	@PostMapping(value = "payMatch.st", produces="application/json; charset-UTF-8")
	@ResponseBody
	public ReadyResponseDto payReady(@RequestBody OrderCreateFormDto orderCreateFormDto) {
		String name = orderCreateFormDto.getName();
		int totalPrice = orderCreateFormDto.getTotalPrice();
		
		log.info("대관 구장명" + name);
		log.info("결제금액" + totalPrice);
		
		//카카오 결제 준비
		ReadyResponseDto readyResponseDto = matchService.payReady(name, totalPrice);
		// 세션에 결제 고유번호(tid) 저장
        Template.addAttribute("tid", readyResponseDto.getTid());
        log.info("결제 고유번호: " + readyResponseDto.getTid());

        return readyResponseDto;
		
	}
	
	@GetMapping(value = "payCompleted.st", produces="application/json; charset-UTF-8")
    public String payCompleted(@RequestParam("pg_token") String pgToken, Model model) {
    
        String tid = Template.getStringAttributeValue("tid");
        log.info("결제승인 요청을 인증하는 토큰: " + pgToken);
        log.info("결제 고유번호: " + tid);

        // 카카오 결제 요청하기
        ApproveResponseDto approveResponse = matchService.payApprove(tid, pgToken);
        model.addAttribute("ar", approveResponse);
        log.info("총 금액: " + approveResponse.getAmount().getTotal());
        
        //db에 매칭정보 등록
        return "kakaoPaySuccess";
    }
	
	@RequestMapping("mainRegionMatch.mn")
	@ResponseBody
	public Map<String, Object> mainRegionMatch(String activityArea, String category) {
	    System.out.println("메인페이지 전적 지역 코드 : " + activityArea + " / 종목 : " + category);
	    
	    String region = matchService.mainRegionMatch(activityArea);
	    
	    System.out.println("지역 이름 : " + region);
	    
	    String[] parts = region.split(" ");
	    Map<String, Object> response = new HashMap<>();
	    
	    if (parts.length == 2) {
	        String city = parts[0];
	        String district = parts[1];
	        
	        String cityName = city.replace("시", "");
	        String districtName = district.replace("구", "");
	        
	        System.out.println("시: " + cityName);
	        System.out.println("구: " + districtName);
	        
	        Map<String, String> map = new HashMap<>();
	        map.put("cityName", cityName);
	        map.put("districtName", districtName);
	        map.put("category", category);
	        
	        ArrayList<MyMatch> result = matchService.mainMatchList(map);
	        
	        response.put("status", "success");
	        response.put("matches", result);
	    } else {
	        response.put("status", "error");
	        response.put("message", "지역 이름 형식이 예상과 다릅니다.");
	    }
	    
	    return response; // Returning the response as JSON
}
	@RequestMapping(value = "orderInfo.st")
	public String orderInfo(Match mc, @RequestParam(defaultValue = "0") int price, String date, Model model) {
		
		StadiumSubscription ss = matchService.selectMatch(mc, price, date);
		
		model.addAttribute("ss", ss);
		
		return "matching/matchingReq";
	}
}
