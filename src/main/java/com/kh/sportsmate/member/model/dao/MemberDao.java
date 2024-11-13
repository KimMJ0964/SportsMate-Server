package com.kh.sportsmate.member.model.dao;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.member.model.vo.Category;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.place.model.vo.PlaceReview;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.member.model.vo.Category;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.team.model.vo.Recruit;
import com.kh.sportsmate.team.model.vo.Team;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

/**
 * packageName    : com.kh.sportsmate.member.model.dao
 * fileName       : MemberDao
 * author         : jun
 * date           : 2024. 11. 7.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 7.        jun       최초 생성
 */
@Repository
public class MemberDao {
    /***
     * 회원 기본정보 Insert
     * @param sqlSession
     * @param m
     * @return
     */
    public int insertMember(SqlSessionTemplate sqlSession, Member m ){
        return sqlSession.insert("memberMapper.insertMember", m);
    }

    /**
     * 프로필 이미지 Insert
     * @param sqlSession
     * @param profile
     * @return
     */
    public int insertProfile(SqlSessionTemplate sqlSession, Profile profile){
        return sqlSession.insert("memberMapper.insertProfile", profile);
    }

    /***
     * 종목 입력 정보 Insert
     * @param sqlSession
     * @param category
     * @return
     */
    public int insertCategory(SqlSessionTemplate sqlSession, Category category){
        return sqlSession.insert("memberMapper.insertCategory",category);
    }
    public Member loginMember(SqlSessionTemplate sqlSession, Member m){
        return sqlSession.selectOne("memberMapper.loginMember", m);
    }
    
    /* 마이페이지 */
    
    // 내 정보
	public Member selectMyInfo(SqlSessionTemplate sqlSession, int memNo) {
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
	public ArrayList<Member> selectATeamInfo(SqlSessionTemplate sqlSession, int teamNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectTeamInfo", teamNo);
	}
	
	// b팀 정보
	public ArrayList<Member> selectBTeamInfo(SqlSessionTemplate sqlSession, int teamNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectTeamInfo", teamNo);
	}
	
	// 리뷰 작성
	public int insertPReview(SqlSessionTemplate sqlSession, PlaceReview pr) {
		return sqlSession.insert("placeMapper.insertPReview", pr);
	}
	
	// 베스트 플레이어 선정
	public int bestPlayerChoice(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return sqlSession.update("matchMapper.bestPlayerChoice", map);
	}
}
