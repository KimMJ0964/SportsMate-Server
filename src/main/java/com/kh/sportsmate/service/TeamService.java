package com.kh.sportsmate.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.team.model.vo.Team;
import com.kh.sportsmate.team.model.vo.TeamBoard;
import com.kh.sportsmate.team.model.vo.TeamBoardComment;
import com.kh.sportsmate.team.model.vo.TeamMember;

public interface TeamService {
	//게시글 총 갯수 가져오기
		int selectListCount(int teamNo);
		
		// 게시글 목록 가져오기
		ArrayList<TeamBoard> selectList(PageInfo pi, int teamNo);
		
		// 팀 목록 가져오기
		ArrayList<TeamMember> selectMemberList(int teamNo);
		
		// 게시글 내용 가져오기
		TeamBoard detailList(int bno);
		
		// 댓글 가져오기
		ArrayList<TeamBoardComment> commentList(int bno);
		
		// 댓글 수 구하기
		int commentCount(int bno);
		
		// 게시글 생성
		int createBoard(TeamBoard b);
		
		// 게시글 수정
		int updateBoard(TeamBoard b);
		
		// 게시글 삭제
		int deleteBoard(int bno);
		
		// 입단 허락
		int approveJoin(Map<String, Integer> nos);
		
		// 입단 거부
		int rejectJoin(int mno);
		
		// 게시글 검색
		ArrayList<TeamBoard> searchBoard(PageInfo pi, Map<String, String> map);
}
