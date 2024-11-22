package com.kh.sportsmate.mypage.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.match.model.vo.MatchBest;
import com.kh.sportsmate.match.model.vo.MatchQna;
import com.kh.sportsmate.match.model.dto.MyMatch;
import com.kh.sportsmate.member.model.dto.MemberEnrollDto;
import com.kh.sportsmate.member.model.dto.MemberModifyDto;
import com.kh.sportsmate.member.model.dto.MemberPosition;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.member.model.vo.ProfileFile;
import com.kh.sportsmate.stadium.model.vo.StadiumReview;
import com.kh.sportsmate.team.model.vo.Recruit;
import com.kh.sportsmate.team.model.vo.Team;

public interface MyPageService {
	 /* 마이페이지 */
    // 내 정보
    MemberPosition selectMyInfo(int memNo);
    
    // 내 전적
    ArrayList<MyMatch> selectMyMatch(int memNo);
    
    // 내 프로필 사진
    Profile selectMyProfile(int memNo);
    
    // 내 전적 판 수
    int selectMyMatchCount(int memNo);
    
    // 내 전적 이긴 판 수
    int selectMyMatchWinCount(int memNo);
    
    // 내 구단
    ArrayList<Team> selectMyTeam(int memNo);
    	
    // 내 구단 입단 명단
    ArrayList<Recruit> selectMyRecruit(int memNo);
    
    // a팀 정보
    ArrayList<MemberPosition> selectATeamInfo(int teamANo);
    
    // b팀 정보
    ArrayList<MemberPosition> selectBTeamInfo(int teamBNo);
    
    // 구장 리뷰
    int insertPReview(StadiumReview pr);
    
    // 베스트 플레이어 선정
    int bestPlayerChoice(Map<String, Integer> map);
    
    // 베스트 플레이어 선정2
    int bestPlayerVote(Map<String, Integer> map);
    
    // 마이페이지 수정 페이지 이동 및 내 정보 출력
    MemberModifyDto myInfoList(int memNo);
    
    // 내 정보 수정
    int modifyMember(MemberEnrollDto m, Profile profile, HttpSession session);
    
    // 비밀번호 확인
    boolean verifyOldPassword(int memNo, String memPwd);
    
    // 비밀번호 변경
    int updatePassword( Map<String, String> map);
    
    // 계정 탈퇴
    int accountCancel(int memNo);
    
    // 내 문의
    ArrayList<MatchQna> selectMyQna(int memNo);
    
    // 리뷰 체크
    MatchBest checkReview(Map<String, Integer> map);
}