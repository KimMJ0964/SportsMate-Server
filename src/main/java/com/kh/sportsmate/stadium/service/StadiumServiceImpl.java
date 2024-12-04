package com.kh.sportsmate.stadium.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dao.StadiumDao;
import com.kh.sportsmate.stadium.model.dto.StadiumDto;
import com.kh.sportsmate.stadium.model.dto.StadiumRefundDto;
import com.kh.sportsmate.stadium.model.vo.Amenities;
import com.kh.sportsmate.stadium.model.vo.Refund;
import com.kh.sportsmate.stadium.model.vo.Rental;
import com.kh.sportsmate.stadium.model.vo.Stadium;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;

@Service
public class StadiumServiceImpl implements StadiumService{

	private final SqlSessionTemplate sqlSession;
    private final StadiumDao stadiumDao;
    
    @Autowired
    public StadiumServiceImpl(SqlSessionTemplate sqlSession, StadiumDao stadiumDao) {
		super();
		this.sqlSession = sqlSession;
		this.stadiumDao = stadiumDao;
	}

    @Override
    public List<Stadium> getStadiumsByManager(int memNo) {
        return stadiumDao.selectStadiumByManager(sqlSession, memNo); // 여러 구장 가져오기
    }

	@Override
	public StadiumDto getStadiumByManager(int memNo) {
		return stadiumDao.selectOneStadiumByManager(sqlSession, memNo);
	}

	@Override
	public List<StadiumDto> getStadiumImagesByManager(int memNo) {
		return stadiumDao.selectStadiumImages(sqlSession, memNo);
	}

	@Override
	public int updateStadium(StadiumDto stadiumDto) {
		return stadiumDao.updateStadium(sqlSession, stadiumDto);
	}

	@Override
	public int updateAmenities(Amenities amenities) {
		return stadiumDao.updateAmenities(sqlSession, amenities);
	}

	@Override
	public int updateRental(Rental rental) {
		return stadiumDao.updateRental(sqlSession, rental);
	}

	@Override
	public boolean updateStadium(StadiumDto stadiumDto, Amenities amenities, Rental rental) {
		boolean isStadiumUpdated = stadiumDao.updateStadium(sqlSession, stadiumDto) > 0; // 구장 정보 업데이트
        boolean isAmenitiesUpdated = stadiumDao.updateAmenities(sqlSession, amenities) > 0; // 편의시설 업데이트
        boolean isRentalUpdated = stadiumDao.updateRental(sqlSession, rental) > 0; // 대여 정보 업데이트

        return isStadiumUpdated && isAmenitiesUpdated && isRentalUpdated;
	}
	
	@Override
	public List<StadiumRefundDto> getRefundPageData(int memNo) {
	    // DAO에서 VO 리스트 가져오기
	    
	    return stadiumDao.getRefundPageData(memNo);
	}

	@Override
	public boolean processRefund(int refundNo, String refundContent) {
	    int result = stadiumDao.updateReservationStatus(sqlSession, refundNo, refundContent);
	    return result > 0;
	}


	@Override
	public int selectInquiryCount(int memNo) {
		return stadiumDao.selectInquiryCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<StadiumQna> inquiryList(int memNo, PageInfo pi) {
		return stadiumDao.inquiryList(sqlSession, memNo, pi);
	}

	@Override
	public int inquiryUpdate(StadiumQna sq) {
		return stadiumDao.inquiryUpdate(sqlSession, sq);
	}

}
