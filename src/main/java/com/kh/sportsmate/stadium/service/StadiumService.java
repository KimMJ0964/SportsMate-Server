package com.kh.sportsmate.stadium.service;

import java.util.List;

import com.kh.sportsmate.stadium.model.dto.StadiumDto;
import com.kh.sportsmate.stadium.model.vo.Stadium;

public interface StadiumService {
	List<Stadium> getStadiumsByManager(int memNo);
	StadiumDto getStadiumByManager(int memNo);
}
