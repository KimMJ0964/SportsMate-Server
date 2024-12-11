package com.kh.sportsmate.stadium.service;

import java.util.List;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


import com.kh.sportsmate.admin.model.dto.StadiumPenaltyDTO;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dto.GameScheduleDto;
import com.kh.sportsmate.stadium.model.dto.StadiumDto;
import com.kh.sportsmate.stadium.model.dto.StadiumImgDto;
import com.kh.sportsmate.stadium.model.dto.StadiumRefundDto;
import com.kh.sportsmate.stadium.model.vo.Amenities;
import com.kh.sportsmate.stadium.model.vo.Rental;
import com.kh.sportsmate.stadium.model.vo.Stadium;
import com.kh.sportsmate.stadium.model.dto.GameFinishDto;
import com.kh.sportsmate.stadium.model.dto.GameResultDTO;
import com.kh.sportsmate.stadium.model.dto.QnaRequestDto;
import com.kh.sportsmate.stadium.model.dto.StadiumDetail;
import com.kh.sportsmate.stadium.model.dto.StadiumDetailmodal;
import com.kh.sportsmate.stadium.model.dto.StadiumQnaDto;
import com.kh.sportsmate.stadium.model.dto.StadiumReviewDto;
import com.kh.sportsmate.stadium.model.dto.StadiumSearch;
import com.kh.sportsmate.stadium.model.dto.WeatherResponse;
import java.util.Map;

import com.kh.sportsmate.admin.model.dto.StadiumPenaltyDTO;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dto.*;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;
import com.kh.sportsmate.team.model.dto.MatchResultTeamInfoDTO;

public interface StadiumService {
	// **조회 메서드**
    List<Stadium> getStadiumsByManager(int memNo);                  // 관리자의 구장 리스트 조회
    StadiumDto getStadiumByManager(int memNo);                      // 관리자의 단일 구장 조회
    List<StadiumDto> getStadiumImagesByManager(int memNo);          // 구장 이미지 리스트 조회
    List<StadiumRefundDto> getRefundPageData(int memNo);            // 환불 데이터 조회
    List<GameScheduleDto> getGameScheduleData(int memNo);           // 경기 예정 리스트 조회
    List<GameFinishDto> getCompleteMatches(int matchNo);

    // **업데이트 메서드**
    int updateStadium(StadiumDto stadiumDto);                       // 구장 정보 업데이트
    int updateAmenities(Amenities amenities);                       // 편의시설 정보 업데이트
    int updateRental(Rental rental);                                // 대여 정보 업데이트
    boolean updateStadium(StadiumDto stadiumDto, Amenities amenities, Rental rental); // 복합 업데이트

    // **처리 메서드**
    boolean processRefund(int matNo); // 환불 처리
    boolean deleteMatchAndBest(int matchNo);

	
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

	
	// 대기 중인 매치 정보 가져오기
    List<StadiumDetailmodal> getPendingMatches(int teamNo);
	
	int getTeamNoByMemNo(int memNo);
	
	// 문의 등록
	boolean insertQna(StadiumQnaDto stadiumQnaDto);

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

