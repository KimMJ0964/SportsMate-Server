package com.kh.sportsmate.admin.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sportsmate.admin.model.dao.AdminDao;
import com.kh.sportsmate.admin.model.dto.ChartDateDto;
import com.kh.sportsmate.admin.model.vo.MemberPenalty;

@Service
@Transactional(readOnly = true)
public class AdminServiceImpl implements AdminService {
	
	private final SqlSessionTemplate sqlSession;
	private final AdminDao adminDao;
	
	@Autowired
	public AdminServiceImpl(SqlSessionTemplate sqlSession, AdminDao adminDao) {
		super();
		this.sqlSession = sqlSession;
		this.adminDao = adminDao;
	}

	@Override
	public ArrayList<ChartDateDto> drawChart() {
		return adminDao.drawChart(sqlSession);
	}

	@Override
	public ArrayList<MemberPenalty> selectReportList() {
		return adminDao.selectReportList(sqlSession);
	}

}
