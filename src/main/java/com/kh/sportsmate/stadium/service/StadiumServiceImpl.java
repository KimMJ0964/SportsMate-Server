package com.kh.sportsmate.stadium.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.stadium.model.dao.StadiumDao;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class StadiumServiceImpl implements StadiumService {
	 private final StadiumDao stadiumDao;
	 private final SqlSessionTemplate sqlSession;

	@Override
	public ArrayList<StadiumQna> inquiryList(int memNo) {
		return stadiumDao.inquiryList(sqlSession, memNo);
	}

	@Override
	public int inquiryUpdate(StadiumQna sq) {
		return stadiumDao.inquiryUpdate(sqlSession, sq);
	} 
}
