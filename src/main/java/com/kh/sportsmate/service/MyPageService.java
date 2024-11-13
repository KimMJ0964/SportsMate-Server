package com.kh.sportsmate.service;

import java.util.ArrayList;

import com.kh.sportsmate.match.model.vo.Match;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.team.model.vo.Recruit;
import com.kh.sportsmate.team.model.vo.Team;

public interface MyPageService {
	 /* 마이페이지 */
    // 내 정보
    Member selectMyInfo(int memNo);
    
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
    
    
}
