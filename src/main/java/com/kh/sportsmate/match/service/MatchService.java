package com.kh.sportsmate.match.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.sportsmate.match.model.dto.ApproveResponseDto;
import com.kh.sportsmate.match.model.dto.MyMatch;
import com.kh.sportsmate.match.model.dto.ReadyResponseDto;
import com.kh.sportsmate.match.model.vo.Match;

public interface MatchService {
	ReadyResponseDto payReady(String name, int totalPrice);
	ApproveResponseDto payApprove(String tid, String pgToken);
	
	String mainRegionMatch(String activityArea);
	
	ArrayList<MyMatch> mainMatchList(Map<String, String> map);
}
