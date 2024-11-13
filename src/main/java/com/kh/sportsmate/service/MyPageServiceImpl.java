package com.kh.sportsmate.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.board.model.dao.BoardDao;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.member.model.dao.MemberDao;
import com.kh.sportsmate.member.model.dto.MemberPosition;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.place.model.vo.PlaceReview;
import com.kh.sportsmate.team.model.vo.Recruit;
import com.kh.sportsmate.team.model.vo.Team;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private final SqlSessionTemplate sqlSession;
	
	@Autowired
	private final MemberDao memberDao;
	
	// 내 정보
	@Override
	public MemberPosition selectMyInfo(int memNo) {
		return memberDao.selectMyInfo(sqlSession, memNo);
	}
	
	// 내 구단
	@Override
	public ArrayList<Team> selectMyTeam(int memNo) {
		return memberDao.selectMyTeam(sqlSession, memNo);
	}

	// 내 구단 입단 명단자
	@Override
	public ArrayList<Recruit> selectMyRecruit(int memNo) {
		return memberDao.selectMyRecruit(sqlSession, memNo);
	}
	
	// 내 전적
	@Override
	public ArrayList<Match> selectMyMatch(int memNo) {
		return memberDao.selectMyMatch(sqlSession, memNo);
	}

	// 내 전적 판 수
	@Override
	public int selectMyMatchCount(int memNo) {
		return memberDao.selectMyMatchCount(sqlSession, memNo);
	}

	@Override
	public int selectMyMatchWinCount(int memNo) {
		return memberDao.selectMyMatchWinCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<MemberPosition> selectATeamInfo(int teamANo) {
		return memberDao.selectATeamInfo(sqlSession, teamANo);
	}

	@Override
	public ArrayList<MemberPosition> selectBTeamInfo(int teamBNo) {
		return memberDao.selectBTeamInfo(sqlSession, teamBNo);
	}

	@Override
	public int insertPReview(PlaceReview pr) {
		return memberDao.insertPReview(sqlSession, pr);
	}

	@Override
	public int bestPlayerChoice(Map<String, Object> map) {
		return memberDao.bestPlayerChoice(sqlSession, map);
	}

}
