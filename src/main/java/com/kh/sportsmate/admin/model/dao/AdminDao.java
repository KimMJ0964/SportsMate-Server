package com.kh.sportsmate.admin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sportsmate.admin.model.dto.ChartDateDto;
import com.kh.sportsmate.admin.model.vo.MemberPenalty;

@Repository
public class AdminDao {
	public ArrayList<ChartDateDto> drawChart(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.drawChart");
	}
	
	public ArrayList<MemberPenalty> selectReportList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("adminMapper.selectReportList");
	}
}
