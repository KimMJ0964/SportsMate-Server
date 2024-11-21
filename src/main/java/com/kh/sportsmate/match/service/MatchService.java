package com.kh.sportsmate.match.service;

import com.kh.sportsmate.match.model.dto.ApproveResponseDto;
import com.kh.sportsmate.match.model.dto.ReadyResponseDto;

public interface MatchService {
	ReadyResponseDto payReady(String name, int totalPrice);
	ApproveResponseDto payApprove(String tid, String pgToken);
}
