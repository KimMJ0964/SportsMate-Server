package com.kh.sportsmate.stadium.service;

import java.sql.Time;
import java.util.List;

import com.kh.sportsmate.stadium.model.dto.StadiumSearch;



public interface StadiumService {
	
	List<StadiumSearch> findStadiums(StadiumSearch sd);
}
