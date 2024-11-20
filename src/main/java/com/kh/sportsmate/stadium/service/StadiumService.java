package com.kh.sportsmate.stadium.service;

import java.sql.Time;
import java.util.List;

import com.kh.sportsmate.stadium.model.vo.Stadium;

public interface StadiumService {
	
	List<Stadium> findStadiums(Stadium sd);
}
