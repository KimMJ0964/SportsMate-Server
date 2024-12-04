package com.kh.sportsmate.stadium.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dto.GameResultDTO;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;

public interface StadiumService {
	
	// 문의 리스트 갯수
	int selectInquiryCount(int memNo);
	
	// 문의 리스트
	ArrayList<StadiumQna> inquiryList(int memNo, PageInfo pi);
	
	// 문의 답변
	int inquiryUpdate(StadiumQna sq);

	int insertGameResult(GameResultDTO gameResultDTO);
}
