package com.kh.sportsmate.mypage.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.board.model.dao.BoardDao;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.match.model.vo.MatchBest;
import com.kh.sportsmate.match.model.vo.MatchQna;
import com.kh.sportsmate.member.model.dao.MemberDao;
import com.kh.sportsmate.member.model.dto.MemberEnrollDto;
import com.kh.sportsmate.member.model.dto.MemberModifyDto;
import com.kh.sportsmate.member.model.dto.MemberPosition;
import com.kh.sportsmate.member.model.vo.Category;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.member.model.vo.ProfileFile;
import com.kh.sportsmate.mypage.model.dao.MyPageDao;
import com.kh.sportsmate.stadium.model.vo.Stadium;
import com.kh.sportsmate.stadium.model.vo.StadiumReview;
import com.kh.sportsmate.team.model.vo.Recruit;
import com.kh.sportsmate.team.model.vo.Team;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private final SqlSessionTemplate sqlSession;
	
	@Autowired
	private final MyPageDao mypageDao;
	
	// 내 정보
	@Override
	public MemberPosition selectMyInfo(int memNo) {
		return mypageDao.selectMyInfo(sqlSession, memNo);
	}
	
	// 내 구단
	@Override
	public ArrayList<Team> selectMyTeam(int memNo) {
		return mypageDao.selectMyTeam(sqlSession, memNo);
	}

	// 내 구단 입단 명단자
	@Override
	public ArrayList<Recruit> selectMyRecruit(int memNo) {
		return mypageDao.selectMyRecruit(sqlSession, memNo);
	}
	
	// 내 전적
	@Override
	public ArrayList<Match> selectMyMatch(int memNo) {
		return mypageDao.selectMyMatch(sqlSession, memNo);
	}

	// 내 전적 판 수
	@Override
	public int selectMyMatchCount(int memNo) {
		return mypageDao.selectMyMatchCount(sqlSession, memNo);
	}

	@Override
	public int selectMyMatchWinCount(int memNo) {
		return mypageDao.selectMyMatchWinCount(sqlSession, memNo);
	}

	@Override
	public ArrayList<MemberPosition> selectATeamInfo(int teamANo) {
		return mypageDao.selectATeamInfo(sqlSession, teamANo);
	}

	@Override
	public ArrayList<MemberPosition> selectBTeamInfo(int teamBNo) {
		return mypageDao.selectBTeamInfo(sqlSession, teamBNo);
	}

	@Override
	public int insertPReview(StadiumReview pr) {
		return mypageDao.insertPReview(sqlSession, pr);
	}

	@Override
	public int bestPlayerChoice(Map<String, Integer> map) {
		return mypageDao.bestPlayerChoice(sqlSession, map);
	}

	@Override
	public int bestPlayerVote(Map<String, Integer> map) {
		return mypageDao.bestPlayerVote(sqlSession, map);
	}

	@Override
	public Profile selectMyProfile(int memNo) {
		return mypageDao.selectMyProfile(sqlSession, memNo);
	}

	@Override
	public MemberModifyDto myInfoList(int memNo) {
		return mypageDao.myInfoList(sqlSession, memNo);
	}

	@Override
	public int modifyMember(MemberEnrollDto m, Profile profile, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();
		
		int result1 = 0;
        int result2 = 1;
        int result3 = 0;
        String memAdd = m.getMemberBaseAdd() + " " + m.getMemberDetailAdd();
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

	@Override
	public boolean verifyOldPassword(int memNo, String memPwd) {
		return mypageDao.verifyOldPassword(sqlSession, memNo, memPwd);
	}

	@Override
	public int updatePassword( Map<String, String> map) {
		return mypageDao.updatePassword(sqlSession, map);
	}

	@Override
	public int accountCancel(int memNo) {
		return mypageDao.accountCancel(sqlSession, memNo);
	}

	@Override
	public ArrayList<MatchQna> selectMyQna(int memNo) {
		return mypageDao.selectMyQna(sqlSession, memNo);
	}

	@Override
	public MatchBest checkReview(Map<String, Integer> map) {
		return mypageDao.checkReview(sqlSession, map);
	}
	

}