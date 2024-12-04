package com.kh.sportsmate.match.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestTemplate;

import com.kh.sportsmate.board.model.dao.BoardDao;
import com.kh.sportsmate.match.dao.MatchDao;
import com.kh.sportsmate.match.model.dto.ApproveResponseDto;
import com.kh.sportsmate.match.model.dto.MyMatch;
import com.kh.sportsmate.match.model.dto.ReadyResponseDto;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.member.model.dao.MemberDao;
import com.kh.sportsmate.match.model.dto.StadiumSubscription;
import com.kh.sportsmate.match.model.vo.Match;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MatchServiceImpl implements MatchService {
	
	private final SqlSessionTemplate sqlSession;
	private final MatchDao matchDao;
	
	
	@Value("${kakaopay.secretKey}")
	private String secretKey;
	
	@Value("${kakaopay.cid}")
	private String cid;
	
	@Value("${kakaopay.readyUrl}")
	private String readyUrl;
	
	@Value("${kakaopay.completedUrl}")
	private String completedUrl;
	
	@Value("${kakaopay.approvalUrl}")
	private String approvalUrl;
	
	// 카카오페이 측에 요청 시 헤더부에 필요한 값
    private HttpHeaders getHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", secretKey);
        headers.set("Content-type", "application/json");

        return headers;
    }

	@Override
	public ReadyResponseDto payReady(String name, int totalPrice) {
		Map<String, String> parameters = new HashMap<>();
        parameters.put("cid", cid);                                    // 가맹점 코드(테스트용)
        parameters.put("partner_order_id", "1");                       // 주문번호
        parameters.put("partner_user_id", "SportsMate");                          // 회원 아이디
        parameters.put("item_name", name);                                      // 상품명
        parameters.put("quantity", "1");                                        // 상품 수량
        parameters.put("total_amount", String.valueOf(totalPrice));             // 상품 총액
        parameters.put("tax_free_amount", "0");                                 // 상품 비과세 금액
        parameters.put("approval_url", approvalUrl); // 결제 성공 시 URL
        parameters.put("cancel_url", approvalUrl);      // 결제 취소 시 URL
        parameters.put("fail_url", approvalUrl);          // 결제 실패 시 URL

        // HttpEntity : HTTP 요청 또는 응답에 해당하는 Http Header와 Http Body를 포함하는 클래스
        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

        // RestTemplate
        // : Rest 방식 API를 호출할 수 있는 Spring 내장 클래스
        //   REST API 호출 이후 응답을 받을 때까지 기다리는 동기 방식 (json, xml 응답)
        RestTemplate template = new RestTemplate();
        String url = readyUrl;
        // RestTemplate의 postForEntity : POST 요청을 보내고 ResponseEntity로 결과를 반환받는 메소드
        ResponseEntity<ReadyResponseDto> responseEntity = template.postForEntity(url, requestEntity, ReadyResponseDto.class);
        log.info("결제준비 응답객체: " + responseEntity.getBody());

        return responseEntity.getBody();
	}

	@Override
	public ApproveResponseDto payApprove(String tid, String pgToken) {
		Map<String, String> parameters = new HashMap<>();
        parameters.put("cid",   cid);              // 가맹점 코드(테스트용)
        parameters.put("tid", tid);                       // 결제 고유번호
        parameters.put("partner_order_id", "1"); 			// 주문번호
        parameters.put("partner_user_id", "SportsMate");    // 회원 아이디
        parameters.put("pg_token", pgToken);              // 결제승인 요청을 인증하는 토큰

        HttpEntity<Map<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

        RestTemplate template = new RestTemplate();
        String url = completedUrl;
        ApproveResponseDto approveResponseDto = template.postForObject(url, requestEntity, ApproveResponseDto.class);
        log.info("결제승인 응답객체: " + approveResponseDto);

        return approveResponseDto;
	}

	@Override
	@Transactional(readOnly = true)
	public String mainRegionMatch(String activityArea) {
		return matchDao.mainRegionMatch(sqlSession, activityArea);
	}

	@Override
	@Transactional(readOnly = true)
	public ArrayList<MyMatch> mainMatchList(Map<String, String> map) {
		return matchDao.mainMatchList(sqlSession, map);
	}
	
	public StadiumSubscription selectMatch(Match mc, int price, String date) {
		
		StadiumSubscription ss = matchDao.selectMatch(sqlSession, mc);
		StadiumSubscription s1 = matchDao.selectMatchA(sqlSession, mc);
		ss.setTeamName(s1.getTeamName());
		
		ss.setPrice(price);
		 
		if(mc.getTeamBNo() > 0) {
			StadiumSubscription s2 = matchDao.selectMatchB(sqlSession, mc);
			ss.setResult(s2.getResult());
			ss.setOpponent(s2.getOpponent());
			ss.setTeamName(s2.getTeamName());
		}

		return ss;
	}

	@Override
	public ArrayList<MyMatch> mainMatching() {
		return matchDao.mainMatching(sqlSession);
	}

}
