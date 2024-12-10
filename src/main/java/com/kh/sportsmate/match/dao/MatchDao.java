package com.kh.sportsmate.match.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sportsmate.match.model.dto.MyMatch;
import com.kh.sportsmate.match.model.dto.StadiumSubscription;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.match.model.vo.MatchBest;

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
	
	public int insertMatchA(SqlSessionTemplate sqlSession, Match mc) {
		return sqlSession.insert("matchMapper.insertMatchA", mc);
	}
	
	public int insertMatchB(SqlSessionTemplate sqlSession, Match mc) {
		return sqlSession.update("matchMapper.insertMatchB", mc);
	}
	
	public int insertMatch(SqlSessionTemplate sqlSession, List<MatchBest> mb) {
		return sqlSession.insert("matchMapper.insertMatchBest", mb);
	}
	
	public String mainRegionMatch(SqlSessionTemplate sqlSession, String activityArea) {
		return sqlSession.selectOne("matchMapper.mainRegionMatch", activityArea);
	}
	
	public ArrayList<MyMatch> mainMatchList(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return (ArrayList) sqlSession.selectList("matchMapper.mainMatchList", map);
	}
	
	public ArrayList<MyMatch> mainMatching(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return (ArrayList) sqlSession.selectList("matchMapper.mainMatching", map);
	}
}
