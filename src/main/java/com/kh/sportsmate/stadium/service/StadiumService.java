package com.kh.sportsmate.stadium.service;

import java.util.List;

import com.kh.sportsmate.stadium.model.dto.StadiumDto;
import com.kh.sportsmate.stadium.model.dto.StadiumImgDto;
import com.kh.sportsmate.stadium.model.vo.Amenities;
import com.kh.sportsmate.stadium.model.vo.Rental;
import com.kh.sportsmate.stadium.model.vo.Stadium;

public interface StadiumService {
	List<Stadium> getStadiumsByManager(int memNo);
	StadiumDto getStadiumByManager(int memNo);
	List<StadiumDto> getStadiumImagesByManager(int memNo); // 상세 이미지 리스트 가져오기
	int updateStadium(StadiumDto stadiumDto);

    int updateAmenities(Amenities amenities);

    int updateRental(Rental rental);
    
 // 구장 정보 업데이트 메서드
    boolean updateStadium(StadiumDto stadiumDto, Amenities amenities, Rental rental);
}
