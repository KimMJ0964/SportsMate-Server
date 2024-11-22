package com.kh.sportsmate.stadium.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.stadium.model.dao.StadiumDao;
import com.kh.sportsmate.stadium.model.dto.StadiumDto;
import com.kh.sportsmate.stadium.model.dto.StadiumImgDto;
import com.kh.sportsmate.stadium.model.vo.Amenities;
import com.kh.sportsmate.stadium.model.vo.Rental;
import com.kh.sportsmate.stadium.model.vo.Stadium;

@Service
public class StadiumServiceImpl implements StadiumService{

	@Autowired
    private StadiumDao stadiumDao;

    @Override
    public List<Stadium> getStadiumsByManager(int memNo) {
        return stadiumDao.selectStadiumByManager(memNo); // 여러 구장 가져오기
    }

	@Override
	public StadiumDto getStadiumByManager(int memNo) {
		return stadiumDao.selectOneStadiumByManager(memNo);
	}

	@Override
	public List<StadiumDto> getStadiumImagesByManager(int memNo) {
		return stadiumDao.selectStadiumImages(memNo);
	}

	@Override
	public int updateStadium(StadiumDto stadiumDto) {
		return stadiumDao.updateStadium(stadiumDto);
	}

	@Override
	public int updateAmenities(Amenities amenities) {
		return stadiumDao.updateAmenities(amenities);
	}

	@Override
	public int updateRental(Rental rental) {
		return stadiumDao.updateRental(rental);
	}

	@Override
	public boolean updateStadium(StadiumDto stadiumDto, Amenities amenities, Rental rental) {
		boolean isStadiumUpdated = stadiumDao.updateStadium(stadiumDto) > 0; // 구장 정보 업데이트
        boolean isAmenitiesUpdated = stadiumDao.updateAmenities(amenities) > 0; // 편의시설 업데이트
        boolean isRentalUpdated = stadiumDao.updateRental(rental) > 0; // 대여 정보 업데이트

        return isStadiumUpdated && isAmenitiesUpdated && isRentalUpdated;
	}

}
