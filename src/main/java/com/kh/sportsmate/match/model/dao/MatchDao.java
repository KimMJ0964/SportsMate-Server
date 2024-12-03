package com.kh.sportsmate.match.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sportsmate.match.model.dto.MyMatch;
import com.kh.sportsmate.match.model.vo.Match;

@Repository
public class MatchDao {
	public String mainRegionMatch(SqlSessionTemplate sqlSession, String activityArea) {
		return sqlSession.selectOne("matchMapper.mainRegionMatch", activityArea);
	}
	
	public ArrayList<MyMatch> mainMatchList(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return (ArrayList) sqlSession.selectList("matchMapper.mainMatchList", map);
	}
}
