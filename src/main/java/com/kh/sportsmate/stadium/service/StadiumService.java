package com.kh.sportsmate.stadium.service;

import java.util.ArrayList;

import com.kh.sportsmate.stadium.model.vo.StadiumQna;

public interface StadiumService {
	// 문의 리스트
	ArrayList<StadiumQna> inquiryList(int memNo);
	
	// 문의 답변
	int inquiryUpdate(StadiumQna sq);
}
