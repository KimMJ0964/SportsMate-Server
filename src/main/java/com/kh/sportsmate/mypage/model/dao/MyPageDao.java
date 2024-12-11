package com.kh.sportsmate.mypage.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.match.model.vo.MatchBest;
import com.kh.sportsmate.match.model.vo.MatchQna;
import com.kh.sportsmate.match.model.dto.MyMatch;
import com.kh.sportsmate.member.model.dto.MemberEnrollDto;
import com.kh.sportsmate.member.model.dto.MemberModifyDto;
import com.kh.sportsmate.member.model.dto.MemberPositionDto;
import com.kh.sportsmate.member.model.vo.Category;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.member.model.vo.ProfileFile;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;
import com.kh.sportsmate.stadium.model.vo.StadiumReview;
import com.kh.sportsmate.team.model.dto.MyRecruitDto;
import com.kh.sportsmate.team.model.dto.MyTeamDto;
import com.kh.sportsmate.team.model.dto.TeamMatchInfoDto;
import com.kh.sportsmate.team.model.vo.Recruit;
import com.kh.sportsmate.team.model.vo.Team;
import com.kh.sportsmate.team.model.vo.TeamRecord;

@Repository
public class MyPageDao {
	/* 마이페이지 */

	/**
     * 내 정보 Select
     * @param sqlSession
     * @param memNo
     * @return
     */
	public MemberPositionDto selectMyInfo(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.selectMyInfo", memNo);
	}

	/**
     * 내 구단 Select
     * @param sqlSession
     * @param map
     * @return
     */
	public ArrayList<MyTeamDto> selectMyTeam(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList) sqlSession.selectList("memberMapper.selectMyTeam", memNo);
	}

	/**
     * 내 구단 입단자 명단 Select
     * @param sqlSession
     * @param map
     * @return
     */
	public ArrayList<MyRecruitDto> selectMyRecruit(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList) sqlSession.selectList("memberMapper.selectMyRecruit", memNo);
	}

	/**
     * 내 전적 Select
     * @param sqlSession
     * @param map
     * @return
     */
	public ArrayList<MyMatch> selectMyMatch(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList) sqlSession.selectList("memberMapper.selectMyMatch", memNo);
	}

	/**
     * 내 전적 판수 Select
     * @param sqlSession
     * @param map
     * @return
     */
	public TeamRecord selectMyMatchCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.selectMyMatchCount", memNo);
	}

	/**
     * 내 전적 이긴 판 수 Select
     * @param sqlSession
     * @param map
     * @return
     */
	public int selectMyMatchWinCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.selectMyMatchWinCount", memNo);
	}

	/**
     * 내 구단 A팀 정보 Select
     * @param sqlSession
     * @param teamNo
     * @return
     */
	public ArrayList<MemberPositionDto> selectATeamInfo(SqlSessionTemplate sqlSession, Map<String, Integer> aMap) {
		return (ArrayList) sqlSession.selectList("memberMapper.selectTeamInfo", aMap);
	}

	/**
     * 내 구단 B팀 정보 Select
     * @param sqlSession
     * @param teamNo
     * @return
     */
	public ArrayList<MemberPositionDto> selectBTeamInfo(SqlSessionTemplate sqlSession, Map<String, Integer> bMap) {
		return (ArrayList) sqlSession.selectList("memberMapper.selectTeamInfo", bMap);
	}

	/**
     * 구장 인터뷰 Insert
     * @param sqlSession
     * @param pr
     * @return
     */
	public int insertPReview(SqlSessionTemplate sqlSession, StadiumReview pr) {
		return sqlSession.insert("stadiumMapper.insertPReview", pr);
	}

	/**
     * 베스트 플레이어 선정 Update
     * @param sqlSession
     * @param map
     * @return
     */
	public int bestPlayerChoice(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.update("matchMapper.updateVoteStatus", map);
	}

	/**
     * 베스트 플레이어 선정 (수 증가) Update
     * @param sqlSession
     * @param map
     * @return
     */
	public int bestPlayerVote(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.update("matchMapper.incrementVoteCount", map);
	}

	/**
     * 내 프로필 정보 Select
     * @param sqlSession
     * @param memNo
     * @return
     */
	public Profile selectMyProfile(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.selectMyProfile", memNo);
	}

	/**
     * 수정 페이지 내 프로필 정보 출력 Select
     * @param sqlSession
     * @param memNo
     * @return
     */
	public MemberModifyDto myInfoList(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("memberMapper.myInfoList", memNo);
	}

	/**
     * 내 정보 수정 Update
     * @param sqlSession
     * @param m
     * @return
     */
	public int modifyMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.modifyMember", m);
	}

	/**
     * 내 프로필 정보수정 Update
     * @param sqlSession
     * @param profile
     * @return
     */
	public int modifyProfile(SqlSessionTemplate sqlSession, Profile profile) {
		return sqlSession.update("memberMapper.modifyProfile", profile);
	}

	/**
     * 내 카테고리 수정
     * @param sqlSession
     * @param category
     * @return
     */
	public int modifyCategory(SqlSessionTemplate sqlSession, Category category) {
		return sqlSession.update("memberMapper.modifyCategory", category);
	}
	
	/**
     * 비밀번호 확인 Select
     * @param sqlSession
     * @param memNo
     * @param memPwd
     * @return
     */
	public boolean verifyOldPassword(SqlSessionTemplate sqlSession, int memNo, String memPwd) {
		Map<String, String> map = new HashMap<>();
		map.put("memNo", String.valueOf(memNo));
		map.put("memNo", memPwd);
		return sqlSession.selectOne("memberMapper.verifyOldPassword", map);
	}
	
	/**
     * 내 비밀번호 변경 update
     * @param sqlSession
     * @param map
     * @return
     */
	public int updatePassword(SqlSessionTemplate sqlSession,  Map<String, String> map) {
		return sqlSession.update("memberMapper.updatePassword", map);
	}
	
	/**
     * 계정 탈퇴 Update
     * @param sqlSession
     * @param memNo
     * @return
     */
	public int accountCancel(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.update("memberMapper.accountCancel", memNo);
	}
	
	/**
     * 내 문의 Select
     * @param sqlSession
     * @param memNo
     * @return
     */
	public ArrayList<StadiumQna> selectMyQna(SqlSessionTemplate sqlSession, int memNo) {
		return (ArrayList) sqlSession.selectList("memberMapper.selectMyQna", memNo);
	}
	
	/**
     * 리뷰 체크 Select
     * @param sqlSession
     * @param map
     * @return
     */
	public MatchBest checkReview(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.selectOne("memberMapper.checkReview", map);
	}
	
	/** 전적페이지 전적
	 * @param sqlSession
	 * @param map
	 * @return 
	 */
	public ArrayList<TeamMatchInfoDto> myMatchInfo(SqlSessionTemplate sqlSession, Map<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList) sqlSession.selectList("memberMapper.myMatchInfo", map, rowBounds);
	}
	
	public int categoryMatchCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("memberMapper.categoryMatchCount", map);
	}
}
