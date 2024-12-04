package com.kh.sportsmate.match.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sportsmate.match.model.dto.StadiumSubscription;
import com.kh.sportsmate.match.model.vo.Match;

@Repository
public class MatchDao {
	
	public StadiumSubscription selectMatch(SqlSessionTemplate sqlSession, Match mc) {
		return sqlSession.selectOne("matchMapper.selectMatch", mc);
	}
	
	public StadiumSubscription selectMatchA(SqlSessionTemplate sqlSession, Match mc) {
		return sqlSession.selectOne("matchMapper.selectMatchA", mc);
	}
	
	public StadiumSubscription selectMatchB(SqlSessionTemplate sqlSession, Match mc) {
		return sqlSession.selectOne("matchMapper.selectMatchB", mc);
	}
	
	public int insertMatch(Match mc) {
		return 0;
	}
}
