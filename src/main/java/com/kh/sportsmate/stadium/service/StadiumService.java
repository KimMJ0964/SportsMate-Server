package com.kh.sportsmate.stadium.service;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import com.kh.sportsmate.admin.model.dto.StadiumPenaltyDTO;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dto.*;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;
import com.kh.sportsmate.team.model.dto.MatchResultTeamInfoDTO;

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

	int insertGameResult(GameResultDTO gameResultDTO);

	int insertPenalty(StadiumPenaltyDTO penaltyInfo);

	// 경기 결과 디테일에 필요한 팀 정보
	MatchResultTeamInfoDTO selectTeamInfo(int matchNo);

	// 구장 번호 조회
	int getStadiumNo(int memNo);

	// 매치 참여 선수 리스트 조회
	ArrayList<MatchResultMemberInfoDTO> selectMatchMemberInfo(Map<String, Object> map);

}