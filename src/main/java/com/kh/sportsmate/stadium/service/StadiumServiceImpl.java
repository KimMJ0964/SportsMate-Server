package com.kh.sportsmate.stadium.service;

import java.sql.Time;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.stadium.model.dao.StadiumDao;
import com.kh.sportsmate.stadium.model.vo.Stadium;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class StadiumServiceImpl implements StadiumService{

	@Autowired
	private final SqlSessionTemplate sqlSession;
	
	@Autowired
	private final StadiumDao stadiumDao;

	@Override
	public List<Stadium> findStadiums(Stadium sd) {
		return stadiumDao.findStadiums(sqlSession, sd);
	}
}
