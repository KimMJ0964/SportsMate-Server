package com.kh.sportsmate.stadium.service;

import java.util.List;
import java.util.ArrayList;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dto.StadiumDetail;
import com.kh.sportsmate.stadium.model.dto.StadiumDetailmodal;
import com.kh.sportsmate.stadium.model.dto.StadiumReviewDto;
import com.kh.sportsmate.stadium.model.dto.StadiumSearch;
import com.kh.sportsmate.stadium.model.dto.WeatherResponse;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;

public interface StadiumService {
	
	int getSearchResultCount(String stadiumName, String stadiumAddress, String stadiumCategory,
			String stadiumStartTime, String stadiumEndTime, String selectedDate, String activityArea);

	List<StadiumSearch> getPaginatedStadiums(PageInfo pi, String stadiumName, String stadiumAddress,
	                            String stadiumCategory, String stadiumStartTime, String stadiumEndTime,
	                            String selectedDate, String activityArea);

	// 구장 ID로 상세 정보 조회
	StadiumSearch getStadiumById(int stadiumNo);
	
	// 위치 기반 날씨 정보 조회
	WeatherResponse getWeather(String location);
	
	// 경기장 상세 정보 가져오기
	StadiumDetail getStadiumDetail(int stadiumNo);
	
	// 페이징된 리뷰 조회
	List<StadiumReviewDto> getPagedReviewsByStadiumNo(int stadiumNo, int currentPage, int boardLimit);
	
	// 전체 리뷰 개수 조회
	int getReviewCount(int stadiumNo);
	
	// 신청 모달
	List<StadiumDetailmodal> getStadiumReservation(int teamNo);
	
	int getTeamNoByMemNo(int memNo);

	// 문의 리스트 갯수
	int selectInquiryCount(int memNo);
	
	// 문의 리스트
	ArrayList<StadiumQna> inquiryList(int memNo, PageInfo pi);
	
	// 문의 답변
	int inquiryUpdate(StadiumQna sq);
}