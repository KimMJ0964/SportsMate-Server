package com.kh.sportsmate.stadium.service;

import java.sql.Time;
import java.util.List;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dto.StadiumSearch;
import com.kh.sportsmate.stadium.model.dto.WeatherResponse;



public interface StadiumService {
	
	int getSearchResultCount(String stadiumName, String stadiumAddress, String stadiumCategory,
			String stadiumStartTime, String stadiumEndTime, String selectedDate);

	List<StadiumSearch> getPaginatedStadiums(PageInfo pi, String stadiumName, String stadiumAddress,
	                            String stadiumCategory, String stadiumStartTime, String stadiumEndTime,
	                            String selectedDate);

	// 구장 ID로 상세 정보 조회
	StadiumSearch getStadiumById(int stadiumId);
	
	// 위치 기반 날씨 정보 조회
	WeatherResponse getWeather(String location);
}
