package com.kh.sportsmate.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.member.model.dto.MemberPosition;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.place.model.vo.PlaceReview;
import com.kh.sportsmate.team.model.vo.Recruit;
import com.kh.sportsmate.team.model.vo.Team;

public interface MyPageService {
	 /* 마이페이지 */
    // 내 정보
    MemberPosition selectMyInfo(int memNo);
    
    // 내 전적
    ArrayList<Match> selectMyMatch(int memNo);
    
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
    int insertPReview(PlaceReview pr);
    
    // 베스트 플레이어 선정
    int bestPlayerChoice(Map<String, Integer> map);
    
    // 베스트 플레이어 선정2
    int bestPlayerVote(Map<String, Integer> map);
    
}
