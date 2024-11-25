package com.kh.sportsmate.stadium.service;

import java.sql.Time;
import java.util.List;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dto.StadiumSearch;



public interface StadiumService {
	
	int getSearchResultCount(String stadiumName, String stadiumAddress, String stadiumCategory,
			String stadiumStartTime, String stadiumEndTime, String selectedDate);

	List<StadiumSearch> getPaginatedStadiums(PageInfo pi, String stadiumName, String stadiumAddress,
	                            String stadiumCategory, String stadiumStartTime, String stadiumEndTime,
	                            String selectedDate);

}
