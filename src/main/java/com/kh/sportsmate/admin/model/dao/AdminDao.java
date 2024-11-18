package com.kh.sportsmate.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sportsmate.admin.model.dto.ChartDateDto;
import com.kh.sportsmate.admin.model.vo.MemberPenalty;
import com.kh.sportsmate.common.vo.PageInfo;

@Repository
public class AdminDao {
	public ArrayList<ChartDateDto> drawChart(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.drawChart");
	}
	
	public int selectListCount(SqlSessionTemplate sqlSession){
		return sqlSession.selectOne("adminMapper.selectListCount");
	}
	
	public ArrayList<MemberPenalty> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectList", null, rowBounds);
	}
}
