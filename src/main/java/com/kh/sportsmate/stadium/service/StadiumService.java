package com.kh.sportsmate.stadium.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dto.StadiumDto;
import com.kh.sportsmate.stadium.model.dto.StadiumImgDto;
import com.kh.sportsmate.stadium.model.dto.StadiumRefundDto;
import com.kh.sportsmate.stadium.model.vo.Amenities;
import com.kh.sportsmate.stadium.model.vo.Rental;
import com.kh.sportsmate.stadium.model.vo.Stadium;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;

public interface StadiumService {
	// **조회 메서드**
    List<Stadium> getStadiumsByManager(int memNo);                  // 관리자의 구장 리스트 조회
    StadiumDto getStadiumByManager(int memNo);                      // 관리자의 단일 구장 조회
    List<StadiumDto> getStadiumImagesByManager(int memNo);          // 구장 이미지 리스트 조회
    List<StadiumRefundDto> getRefundPageData(int memNo);            // 환불 데이터 조회

    // **업데이트 메서드**
    int updateStadium(StadiumDto stadiumDto);                       // 구장 정보 업데이트
    int updateAmenities(Amenities amenities);                       // 편의시설 정보 업데이트
    int updateRental(Rental rental);                                // 대여 정보 업데이트
    boolean updateStadium(StadiumDto stadiumDto, Amenities amenities, Rental rental); // 복합 업데이트

    // **처리 메서드**
    boolean processRefund(int reservationNo, String refundReason, String reasonType); // 환불 처리

	
	// 문의 리스트 갯수
	int selectInquiryCount(int memNo);
	
	// 문의 리스트
	ArrayList<StadiumQna> inquiryList(int memNo, PageInfo pi);
	
	// 문의 답변
	int inquiryUpdate(StadiumQna sq);
	

}
