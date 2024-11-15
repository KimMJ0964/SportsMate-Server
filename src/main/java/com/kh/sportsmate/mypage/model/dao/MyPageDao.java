package com.kh.sportsmate.mypage.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.member.model.dto.MemberPosition;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.member.model.vo.ProfileFile;
import com.kh.sportsmate.stadium.model.vo.StadiumReview;
import com.kh.sportsmate.team.model.vo.Recruit;
import com.kh.sportsmate.team.model.vo.Team;

@Repository
public class MyPageDao {
 /* 마이페이지 */
    
    // 내 정보
	public MemberPosition selectMyInfo(SqlSessionTemplate sqlSession, int memNo) {
    	return sqlSession.selectOne("memberMapper.selectMyInfo", memNo);
    }

    // 내 구단
	public ArrayList<Team> selectMyTeam(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMyTeam", memNo);
	}

	// 내 구단 입단 명단자
	public ArrayList<Recruit> selectMyRecruit(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMyRecruit", memNo);
	}
	
	// 내 전적
	public ArrayList<Match> selectMyMatch(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectMyMatch", memNo);
	}
	
	// 내 전적 판 수
	public int selectMyMatchCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.selectMyMatchCount", memNo);
	}
	
	// 내 전적 이긴 판 수
	public int selectMyMatchWinCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.selectMyMatchWinCount", memNo);
	}
	
	// a팀 정보
	public ArrayList<MemberPosition> selectATeamInfo(SqlSessionTemplate sqlSession, int teamNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectTeamInfo", teamNo);
	}
	
	// b팀 정보
	public ArrayList<MemberPosition> selectBTeamInfo(SqlSessionTemplate sqlSession, int teamNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectTeamInfo", teamNo);
	}
	
	// 리뷰 작성
	public int insertPReview(SqlSessionTemplate sqlSession, StadiumReview pr) {
		return sqlSession.insert("placeMapper.insertPReview", pr);
	}
	
	// 베스트 플레이어 선정 (투표자 기록)
	public int bestPlayerChoice(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.update("matchMapper.updateVoteStatus", map);
	}
	
	// 베스트 플레이어 선정 (투표자 기록)
	public int bestPlayerVote(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.update("matchMapper.incrementVoteCount", map);
	}
	
	// 내 프로필 사진
	public Profile selectMyProfile(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.selectMyProfile", memNo);
	}
	
	// 마이페이지 수정 페이지 및 내 정보 출력
	public Member myInfoList(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.myInfoList", memNo);
	}
}
