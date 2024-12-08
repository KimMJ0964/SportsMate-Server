package com.kh.sportsmate.mypage.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.sportsmate.Attachment.model.dao.AttachmentDao;
import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.board.model.dao.BoardDao;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.match.model.vo.MatchBest;
import com.kh.sportsmate.match.model.vo.MatchQna;
import com.kh.sportsmate.match.model.dto.MyMatch;
import com.kh.sportsmate.member.model.dao.MemberDao;
import com.kh.sportsmate.member.model.dto.MemberEnrollDto;
import com.kh.sportsmate.member.model.dto.MemberModifyDto;
import com.kh.sportsmate.member.model.dto.MemberPositionDto;
import com.kh.sportsmate.member.model.vo.Category;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.member.model.vo.ProfileFile;
import com.kh.sportsmate.mypage.model.dao.MyPageDao;
import com.kh.sportsmate.stadium.model.vo.Stadium;
import com.kh.sportsmate.stadium.model.vo.StadiumQna;
import com.kh.sportsmate.stadium.model.vo.StadiumReview;
import com.kh.sportsmate.team.model.dto.MyTeamDto;
import com.kh.sportsmate.team.model.dto.TeamMatchInfoDto;
import com.kh.sportsmate.team.model.vo.Recruit;
import com.kh.sportsmate.team.model.vo.Team;
import com.kh.sportsmate.team.model.vo.TeamRecord;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private final SqlSessionTemplate sqlSession;
	
	@Autowired
	private final MyPageDao mypageDao;
	
	@Autowired
	private final AttachmentDao attachmentDao;
	
	/**
     * 내 정보
     *
     * @param memNo
     * @return
     */
	@Override
	@Transactional(readOnly = true)
	public MemberPositionDto selectMyInfo(int memNo) {
		return mypageDao.selectMyInfo(sqlSession, memNo);
	}
	
	/**
     * 내 구단
     *
     * @param memNo
     * @return
     */
	@Override
	@Transactional(readOnly = true)
	public ArrayList<MyTeamDto> selectMyTeam(int memNo) {
		return mypageDao.selectMyTeam(sqlSession, memNo);
	}

	/**
     * 내 구단 입단자 명단
     *
     * @param memNo
     * @return
     */
	@Override
	@Transactional(readOnly = true)
	public ArrayList<Recruit> selectMyRecruit(int memNo) {
		return mypageDao.selectMyRecruit(sqlSession, memNo);
	}
	
	/**
     * 내 전적
     *
     * @param memNo
     * @return
     */
	@Override
	@Transactional(readOnly = true)
	public ArrayList<MyMatch> selectMyMatch(int memNo) {
		return mypageDao.selectMyMatch(sqlSession, memNo);
	}

	/**
     * 내 전적 판 수
     *
     * @param memNo
     * @return
     */
	@Override
	@Transactional(readOnly = true)
	public TeamRecord selectMyMatchCount(int memNo) {
		return mypageDao.selectMyMatchCount(sqlSession, memNo);
	}
	
	/**
     * 내 전적 이긴 수
     *
     * @param memNo
     * @return
     */
	@Override
	@Transactional(readOnly = true)
	public int selectMyMatchWinCount(int memNo) {
		return mypageDao.selectMyMatchWinCount(sqlSession, memNo);
	}
	
	/**
     * 전적 A팀 정보
     *
     * @param teamANo
     * @return
     */
	@Override
	@Transactional(readOnly = true)
	public ArrayList<MemberPositionDto> selectATeamInfo(int teamANo) {
		return mypageDao.selectATeamInfo(sqlSession, teamANo);
	}
	
	/**
     * 전적 B팀 정보
     *
     * @param teamBNo
     * @return
     */
	@Override
	@Transactional(readOnly = true)
	public ArrayList<MemberPositionDto> selectBTeamInfo(int teamBNo) {
		return mypageDao.selectBTeamInfo(sqlSession, teamBNo);
	}
	
	/**
     * 구장 리뷰
     *
     * @param pr
     * @return
     */
	@Override
	@Transactional
	public int insertPReview(StadiumReview pr) {
		return mypageDao.insertPReview(sqlSession, pr);
	}
	
	/**
     * 베스트 플레이어 선택
     *
     * @param map
     * @return
     */
	@Override
	@Transactional
	public int bestPlayerChoice(Map<String, Integer> map) {
		return mypageDao.bestPlayerChoice(sqlSession, map);
	}
	
	/**
     * 베스트 플레이어 투표
     *
     * @param map
     * @return
     */
	@Override
	@Transactional
	public int bestPlayerVote(Map<String, Integer> map) {
		return mypageDao.bestPlayerVote(sqlSession, map);
	}
	
	/**
     * 내 프로필 정보
     *
     * @param memNo
     * @return
     */
	@Override
	@Transactional(readOnly = true)
	public Profile selectMyProfile(int memNo) {
		return mypageDao.selectMyProfile(sqlSession, memNo);
	}
	
	/**
     * 내 정보 출력
     *
     * @param memNo
     * @return
     */
	@Override
	@Transactional
	public MemberModifyDto myInfoList(int memNo) {
		return mypageDao.myInfoList(sqlSession, memNo);
	}
	
	/**
     * 내 정보 수정
     *
     * @param m
     * @param profile
     * @param session
     * @return
     */
	@Override
	@Transactional
	public int modifyMember(MemberEnrollDto m, Profile profile, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();
		
		int result1 = 0;
        int result2 = 1;
        int result3 = 0;
        String memAdd = m.getMemberBaseAdd() + " , " + m.getMemberDetailAdd();
        String memBirth = m.getYear() + "." + m.getMonth() + "." + m.getDay(); // 생년월일 concatenate
        String memPhone = m.getPhone1() + "-" + m.getPhone2() + "-" + m.getPhone3(); // 전화번호
        Member processedMember = new Member(m.getMemEmail(), m.getMemPwd(), m.getMemName(),
                m.getMemGender(), m.getMemberZipcode(),memAdd, memBirth, memPhone, "Y");
        processedMember.setMemNo(memNo);
        result1 = mypageDao.modifyMember(sqlSession, processedMember);

        System.out.println("memNo : " + processedMember.getMemNo());
        if (profile != null) {
            profile.setMemNo(processedMember.getMemNo());
            result2 = mypageDao.modifyProfile(sqlSession, profile);
            if(result2 == 0) {
            	result2 = attachmentDao.insertProfile(sqlSession, profile);
            }
        }

        // 종목 관련 내용을 담을 객체
        Category c = new Category(processedMember.getMemNo(),
                m.getSoccerPosition(), m.getSoccerSkill(), m.getFutsalPosition(),
                m.getFutsalSkill(), m.getBasketballPosition(), m.getBasketballSkill(), m.getBasketballPosition(), m.getBasketballSkill());
        c.setMemNo(memNo);
        System.out.println(c);
        result3 = mypageDao.modifyCategory(sqlSession, c);
        
        System.out.println("내 정보 수정 : " + result1);
        System.out.println("내 프로필 사진 수정 : " + result2);
        System.out.println("내 카테고리 수정 : " + result3);
        return result1 * result2 * result3;
	}
	
	/**
     * 옛날 비밀번호 확인
     *
     * @param memNo
     * @param memPwd
     * @return
     */
	@Override
	@Transactional(readOnly = true)
	public boolean verifyOldPassword(int memNo, String memPwd) {
		return mypageDao.verifyOldPassword(sqlSession, memNo, memPwd);
	}
	
	/**
     * 비밀번호 수정
     *
     * @param map
     * @return
     */
	@Override
	@Transactional
	public int updatePassword( Map<String, String> map) {
		return mypageDao.updatePassword(sqlSession, map);
	}
	
	/**
     * 계정 탈톼
     *
     * @param memNo
     * @return
     */
	@Override
	@Transactional
	public int accountCancel(int memNo) {
		return mypageDao.accountCancel(sqlSession, memNo);
	}
	
	/**
     * 내 문의 목록
     *
     * @param memNo
     * @return
     */
	@Override
	@Transactional(readOnly = true)
	public ArrayList<StadiumQna> selectMyQna(int memNo) {
		return mypageDao.selectMyQna(sqlSession, memNo);
	}

	/**
     * 리뷰 작성 여부
     *
     * @param map
     * @return
     */
	@Override
	@Transactional(readOnly = true)
	public MatchBest checkReview(Map<String, Integer> map) {
		return mypageDao.checkReview(sqlSession, map);
	}
	
	/**
	 * 전적 페이지
	 * 
	 * @param map
	 * @return
	 */
	@Override
	@Transactional(readOnly = true)
	public ArrayList<TeamMatchInfoDto> myMatchInfo(Map<String, String> map) {
		return mypageDao.myMatchInfo(sqlSession, map);
	}

	@Override
	public int categoryMatchCount(Map<String, String> map) {
		return mypageDao.categoryMatchCount(sqlSession, map);
	}
}