package com.kh.sportsmate.stadium.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.sportsmate.stadium.model.dto.GameResultDTO;
import com.kh.sportsmate.stadium.model.dto.Rating;
import com.kh.sportsmate.stadium.model.dto.TeamScore;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.stadium.model.dao.StadiumDao;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@RequiredArgsConstructor
@Transactional(readOnly = true)
@Service
public class StadiumServiceImpl implements StadiumService {
	private final StadiumDao stadiumDao;
	private final SqlSessionTemplate sqlSession;

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

	@Transactional
	@Override
	public int insertGameResult(GameResultDTO gameResultDTO) {
		List<Rating> ratingList = gameResultDTO.getRatings();
		TeamScore score = gameResultDTO.getTeamScore();
		log.info("평점 리스트 : {}",ratingList);
		log.info("경기 결과 : {}",score);
		int result1 = stadiumDao.updateRating(sqlSession, ratingList);
		return 0;
	}
}
