package com.kh.sportsmate.board.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.sportsmate.board.model.dto.BoardMemberPanalty;
import com.kh.sportsmate.board.model.dto.CommentInfo;
import com.kh.sportsmate.board.model.vo.Board;
import com.kh.sportsmate.board.model.vo.BoardComment;
import com.kh.sportsmate.board.model.vo.BoardFile;
import com.kh.sportsmate.board.model.vo.BoardLike;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.member.model.vo.ProfileFile;

public interface BoardService {
	//게시글 총 갯수 가져오기
	int selectListCount();
	
	// 게시글 목록 가져오기
	ArrayList<Board> selectList(PageInfo pi);
	
	// 게시글 내용 가져오기
	Board detailList(int bno);
	
	// 댓글 가져오기
	ArrayList<CommentInfo> commentList(int bno);
	
	// 댓글 수 구하기
	int commentCount(int bno);
	
	// 조회수 증가
	int viewAdd(int bno);
	
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
	
	// 댓글 주인 확인
	BoardComment getCommentById(int cno);
	
	// 좋아요인지 확인
	BoardLike boardIsLike(Map<String, Integer> map);
	
	// 좋아요 변경
	int boardToLike(Map<String, Integer> map);
	
	// 좋아요 취소
	int boardToUnLike(Map<String, Integer> map);
	
	// 좋아요 생성
	int boardInsertLike(Map<String, Integer> map);
	
	// 상세 페이지 좋아요 갯수
	int likeCount(int bno);
	
	// 게시글 신고
	int boardReport(Map<String, String> map);
	
	// 게시글 댓글 신고
	int commentReport(Map<String, String> map);
	
	// 게시글 생성 파일 업로드
	int saveBoardFile(BoardFile bf);
	
	// 상세 페이지 파일 다운로드
	BoardFile filedownloadLink(int bno);
	
	// 대댓글 작성
	int replyComment(Map<String, String> map);
}
