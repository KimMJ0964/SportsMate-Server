package com.kh.sportsmate.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.sportsmate.board.model.vo.Board;
import com.kh.sportsmate.board.model.vo.BoardComment;
import com.kh.sportsmate.common.vo.PageInfo;

public interface BoardService {
	//게시글 총 갯수 가져오기
	int selectListCount();
	
	// 게시글 목록 가져오기
	ArrayList<Board> selectList(PageInfo pi);
	
	// 게시글 내용 가져오기
	Board detailList(int bno);
	
	// 댓글 가져오기
	ArrayList<BoardComment> commentList(int bno);
	
	// 댓글 수 구하기
	int commentCount(int bno);
	
	// 게시글 생성
	int createBoard(Board b);
	
	// 게시글 수정
	int updateBoard(Board b);
	
	// 게시글 삭제
	int deleteBoard(int bno);
	
	// 게시글 검색
	ArrayList<Board> searchBoard(PageInfo pi, Map<String, String> map);
	
	// 댓글 입력
	int writeReply(Map<String, String> map);
	
	// 댓글 삭제
	int deleteReply(int cno);
}
