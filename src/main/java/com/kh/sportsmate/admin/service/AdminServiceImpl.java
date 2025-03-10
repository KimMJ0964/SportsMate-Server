package com.kh.sportsmate.admin.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sportsmate.admin.model.dao.AdminDao;
import com.kh.sportsmate.admin.model.dto.BlockProfileDto;
import com.kh.sportsmate.admin.model.dto.ChartDateDto;
import com.kh.sportsmate.admin.model.vo.MemberPenalty;
import com.kh.sportsmate.common.vo.PageInfo;

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
	public int selectListCount(String category) {
		return adminDao.selectListCount(sqlSession, category);
	}
	
	@Override
	public int selectAllListCount() {
		return adminDao.selectAllListCount(sqlSession);
	}

	@Override
	public ArrayList<MemberPenalty> selectList(PageInfo pi, String category) {
		return adminDao.selectList(sqlSession, pi, category);
	}

	@Transactional
	@Override
	public int blockUser(MemberPenalty mp) {
		return adminDao.blockUser(sqlSession, mp);
	}

	@Transactional
	@Override
	public int blockCancle(int pnNo) {
		return adminDao.blockCancle(sqlSession, pnNo);
	}

	@Override
	public int selectBlockListCount() {
		return adminDao.selectBlockListCount(sqlSession);
	}

	@Transactional
	@Override
	public ArrayList<BlockProfileDto> selectBlockList(PageInfo pi) {
		return adminDao.selectBlockList(sqlSession, pi);
	}

	@Transactional
	@Override
	public int unblockUser(int memNo) {
		return adminDao.unblockUser(sqlSession, memNo);
	}

}
