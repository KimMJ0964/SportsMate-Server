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
	StadiumSubscription selectMatch(Match mc);
}
