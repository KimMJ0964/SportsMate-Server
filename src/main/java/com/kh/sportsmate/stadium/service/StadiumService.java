package com.kh.sportsmate.stadium.service;

import java.util.List;
import java.util.Map;
import java.sql.Time;
import java.util.ArrayList;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dto.MatchInfoDto;
import com.kh.sportsmate.stadium.model.dto.QnaRequestDto;
import com.kh.sportsmate.stadium.model.dto.StadiumApplicationDto;
import com.kh.sportsmate.stadium.model.dto.StadiumDetail;
import com.kh.sportsmate.stadium.model.dto.StadiumQnaDto;
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
		
	// 경기장 상세 정보 가져오기
	StadiumDetail getStadiumDetail(int stadiumNo);
	
	// 페이징된 리뷰 조회
	List<StadiumReviewDto> getPagedReviewsByStadiumNo(int stadiumNo, int currentPage, int boardLimit);
	
	// 전체 리뷰 개수 조회
	int getReviewCount(int stadiumNo);
	
	/* 구장 신청하기 모달  */
	// 팀장 번호 가져오기
    int getTeamLeaderNo(int teamNo);

    // 활성화된 팀 멤버 가져오기
    List<StadiumApplicationDto> getTeamMembers(int teamNo);

    // 로그인한 사용자의 팀 번호 가져오기
    Integer getTeamNoByMember(int memNo);
		
	// 문의 등록
	boolean insertQna(StadiumQnaDto stadiumQnaDto);

	// 문의 리스트 갯수
	int selectInquiryCount(int memNo);
	
	// 문의 리스트
	ArrayList<StadiumQna> inquiryList(int memNo, PageInfo pi);
	
	// 문의 답변
	int inquiryUpdate(StadiumQna sq);
	
	// 지역별 날씨 정보 가져오기
	List<WeatherResponse> getWeatherByAddress(String address);
}