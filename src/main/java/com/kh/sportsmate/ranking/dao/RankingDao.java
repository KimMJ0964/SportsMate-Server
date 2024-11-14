package com.kh.sportsmate.ranking.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.sportsmate.ranking.vo.Ranking;

@Repository
public class RankingDao {
	
	private final SqlSession sqlSession;
	
	public RankingDao(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<Ranking> getAllTeams() {
		return sqlSession.selectList("teamMapper.getAllTeams");
	}
}
