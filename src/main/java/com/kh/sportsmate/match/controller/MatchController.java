package com.kh.sportsmate.match.controller;

import java.util.*;
import java.sql.Time;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.kh.sportsmate.match.model.dto.*;
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
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.match.model.vo.MatchBest;
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

	@PostMapping(value = "payMatch.st", produces = "application/json; charset-UTF-8")
	@ResponseBody
	public ReadyResponseDto payReady(@RequestBody OrderCreateFormDto orderCreateFormDto) {
		String name = orderCreateFormDto.getName();
		int totalPrice = orderCreateFormDto.getTotalPrice();

		log.info("대관 구장명" + name);
		log.info("결제금액" + totalPrice);

		// 카카오 결제 준비
		ReadyResponseDto readyResponseDto = matchService.payReady(name, totalPrice);
		// 세션에 결제 고유번호(tid) 저장
		Template.addAttribute("tid", readyResponseDto.getTid());
		log.info("결제 고유번호: " + readyResponseDto.getTid());

		return readyResponseDto;

	}
	
	@GetMapping(value = "payCompleted.st", produces="application/json; charset-UTF-8")
    public String payCompleted(@RequestParam("pg_token") String pgToken, Model model, HttpServletRequest request) {
    
        String tid = Template.getStringAttributeValue("tid");
        log.info("결제승인 요청을 인증하는 토큰: " + pgToken);
        log.info("결제 고유번호: " + tid);

        // 카카오 결제 요청하기
        ApproveResponseDto approveResponse = matchService.payApprove(tid, pgToken);
        model.addAttribute("ar", approveResponse);
        log.info("총 금액: " + approveResponse.getAmount().getTotal());
        
        //db에 매칭정보 등록
        HttpSession session = request.getSession();
        
        Match mc = (Match) session.getAttribute("mc");
        ArrayList<MatchBest> mb = (ArrayList<MatchBest>) session.getAttribute("mb");
        
        int result = matchService.insertMatch(mc, mb);
        
        return "matching/matchingSuccess";
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
			String districtName = "중구".equals(district) ? district : district.replace("구", "");

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
	
	/**
	 * 메인페이지 진행중인 매치
	 * 
	 * @return
	 */
	@RequestMapping("mainMatching.mn")
	@ResponseBody
	public ArrayList<MyMatch> mainMatching(String category, String region, String starttime, String endtime, String date) {
	    System.out.println("메인페이지 매치중 // 종류 : " + category + " 지역 : " + region + " 시작 시간 : " +
	    		starttime + " 끝 시간 : " + endtime + " 선택 날짜 : " + date);

	    ArrayList<MyMatch> response = null;

	    // starttime과 endtime을 Time으로 변환
	    try {
	        SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss"); // 시간 형식
	        Date startDate = sdf.parse(starttime); // String을 Date로 변환
	        Date endDate = sdf.parse(endtime); // String을 Date로 변환

	        Time startTime = new Time(startDate.getTime()); // Date를 Time으로 변환
	        Time endTime = new Time(endDate.getTime()); // Date를 Time으로 변환

	        System.out.println("startTime: " + startTime);
	        System.out.println("endTime: " + endTime);

	        if (region != null) {
	            String area = matchService.mainRegionMatch(region);

	            String[] parts = area.split(" ");

	            if (parts.length == 2) {
	                String city = parts[0];
	                String district = parts[1];

	                String cityName = city.replace("시", "");
	                String districtName = "중구".equals(district) ? district : district.replace("구", "");

	                System.out.println("시: " + cityName);
	                System.out.println("구: " + districtName);

	                Map<String, Object> map = new HashMap<>();
	                map.put("cityName", cityName);
	                map.put("districtName", districtName);
	                map.put("category", category);
	                map.put("starttime", startTime);
	                map.put("endtime", endTime);
	                map.put("date", date);
	                
	                response = matchService.mainMatching(map);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return response;
	}


	@RequestMapping(value = "orderInfo.st")
	public String orderInfo(Match mc, @RequestParam(defaultValue = "0") int price, Model model, HttpServletRequest request, @RequestParam Map<String, String> paramMap) {
		log.info("파라미터 맵 : {}",paramMap);
		List<PlayerInfo> mbLists = new ArrayList<>();
		paramMap.forEach((key, value) -> {
			if(key.startsWith("mb[")){
				String[] keyParts = key.replace("mb[", "").replace("]", "").split("\\.");
				int index = Integer.parseInt(keyParts[0]); // 배열 인덱스 추출
				String fieldName = keyParts[1]; // 필드명 추출

				// 리스트 크기 확장
				while (mbLists.size() <= index) {
					mbLists.add(new PlayerInfo());
				}

				// 해당 객체에 값 설정
				PlayerInfo mb = mbLists.get(index);
				if ("teamNo".equals(fieldName) && value != null && value.matches("\\d+")) {
					mb.setTeamNo(Integer.parseInt(value));
				} else if ("memNo".equals(fieldName) && value != null && value.matches("\\d+")) {
					mb.setMemNo(Integer.parseInt(value));
				}

			}
		});
		log.info("mbList : {}",mbLists);

		StadiumSubscription ss = matchService.selectMatch(mc, price);
		log.info("ss : {}", ss);
		model.addAttribute("ss", ss);
		
		// MatchBest 리스트 생성
	    ArrayList<MatchBest> mbList = new ArrayList<>();
//	    int index = 0;
//
//	    while (true) {
//	        String teamNo = request.getParameter("mb[" + index + "].teamNo");
//	        String memNo = request.getParameter("mb[" + index + "].memNo");
//			log.info(" teamNO: " + teamNo + " memNo: " + memNo);
//	        if (memNo == null ||teamNo == null) {
//	            break; // 더 이상의 데이터가 없으면 종료
//	        }
//
//	        MatchBest mb = new MatchBest();
//	        mb.setTeamNo(Integer.parseInt(teamNo));
//	        mb.setMemNo(Integer.parseInt(memNo));
//	        mbList.add(mb);
//	        index++;
//	    }
		for(PlayerInfo playerInfo : mbLists) {
			if(playerInfo.getMemNo() != 0){
				MatchBest mb = new MatchBest();
				mb.setTeamNo(playerInfo.getTeamNo());
				mb.setMemNo(playerInfo.getMemNo());
				mbList.add(mb);
			}
		}
		//세션객체에 mc보내기
		HttpSession session = request.getSession();
		
		mc.setReservStart(mc.getReservStart() + ":00");
		mc.setReservEnd(mc.getReservEnd() + ":00");
		
		System.out.println("mb: " + mbList);
		
		session.setAttribute("mc", mc);
		session.setAttribute("mb", mbList);
		session.setAttribute("st", ss);
		
		return "matching/matchingReq";
	}
}
