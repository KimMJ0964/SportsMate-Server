package com.kh.sportsmate.match.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.sportsmate.match.model.dto.ApproveResponseDto;
import com.kh.sportsmate.match.model.dto.MyMatch;
import com.kh.sportsmate.match.model.dto.ReadyResponseDto;
import com.kh.sportsmate.match.model.dto.StadiumSubscription;
import com.kh.sportsmate.match.model.vo.Match;

public interface MatchService {
	
	//카카오페이 관련
	ReadyResponseDto payReady(String name, int totalPrice);
	ApproveResponseDto payApprove(String tid, String pgToken);
	
	ArrayList<MyMatch> mainMatchList(Map<String, String> map);
	
	//결제정보 불러오기
	StadiumSubscription selectMatch(Match mc, int price, String date);
	
	// 메인 페이지 지역 전적
	String mainRegionMatch(String activityArea);
	
	// 메인 페이지 매치중
	ArrayList<MyMatch> mainMatching(Map<String, Object> map);
}
