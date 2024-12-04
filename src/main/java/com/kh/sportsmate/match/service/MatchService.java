package com.kh.sportsmate.match.service;

import com.kh.sportsmate.match.model.dto.ApproveResponseDto;
import com.kh.sportsmate.match.model.dto.ReadyResponseDto;
import com.kh.sportsmate.match.model.dto.StadiumSubscription;
import com.kh.sportsmate.match.model.vo.Match;

public interface MatchService {
	
	//카카오페이 관련
	ReadyResponseDto payReady(String name, int totalPrice);
	ApproveResponseDto payApprove(String tid, String pgToken);
	
	//결제정보 불러오기
	StadiumSubscription selectMatch(Match mc, int price);
	
	//결제정보 저장하기
	int insertMatch(Match mc);
}
