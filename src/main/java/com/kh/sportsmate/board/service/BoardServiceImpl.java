package com.kh.sportsmate.board.service;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionManager;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.board.model.dao.BoardDao;
import com.kh.sportsmate.board.model.dto.BoardMemberPanalty;
import com.kh.sportsmate.board.model.vo.Board;
import com.kh.sportsmate.board.model.vo.BoardComment;
import com.kh.sportsmate.board.model.vo.BoardFile;
import com.kh.sportsmate.board.model.vo.BoardLike;
import com.kh.sportsmate.board.service.BoardService;
import com.kh.sportsmate.common.vo.PageInfo;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private final SqlSessionTemplate sqlSession;
	
	@Autowired
	private final BoardDao boardDao;
	
	// 게시글 수 세기
	@Override
	public int selectListCount() {
		return boardDao.selectListCount(sqlSession);
	}

	// 게시글 목록 가져오기
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return boardDao.selectList(sqlSession, pi);
	}

	// 게시글 내용 가져오기
	@Override
	public Board detailList(int bno) {
		return boardDao.detailList(sqlSession, bno);
	}

	// 댓글 가져오기
	@Override
	public ArrayList<BoardComment> commentList(int bno) {
		return boardDao.commentList(sqlSession, bno);
	}
	
	// 댓글 수 구하기
	@Override
	public int commentCount(int bno) {
		return boardDao.commentCount(sqlSession, bno);
	}
	
	// 게시글 생성
	@Override
	public int createBoard(Board b) {
		return boardDao.createBoard(sqlSession, b);
	}
	
	// 게시글 수정
	@Override
	public int updateBoard(Board b) {
		return boardDao.updateBoard(sqlSession, b);
	}

	@Override
	public int deleteBoard(int bno) {
		return boardDao.deleteBoard(sqlSession, bno);
	}

	@Override
	public ArrayList<Board> searchBoard(PageInfo pi, Map<String, String> map) {
		return boardDao.searchBoard(sqlSession, pi, map);
	}

	// 댓글 작성
	@Override
	public int writeReply(Map<String, String> map) {
		return boardDao.writeReply(sqlSession, map);
	}
	
	// 댓글 삭제
	@Override
	public int deleteReply(int cno) {
		return boardDao.deleteReply(sqlSession, cno);
	}

	// 조회수 증가
	@Override
	public int viewAdd(int bno) {
		return boardDao.viewAdd(sqlSession, bno);
	}
	
	// 댓글 주인 확인
	@Override
	public BoardComment getCommentById(int cno) {
		return boardDao.getCommentById(sqlSession, cno);
	}
	
	// 좋아요 확인
	@Override
	public BoardLike boardIsLike(Map<String, Integer> map) {
		return boardDao.boardIsLike(sqlSession, map);
	}
	
	// 좋아요 변경
	@Override
	public int boardToLike(Map<String, Integer> map) {
		return boardDao.boardToLike(sqlSession, map);
	}

	// 좋아요 취소
	@Override
	public int boardToUnLike(Map<String, Integer> map) {
		return boardDao.boardToUnLike(sqlSession, map);
	}
	
	// 좋아요 삽입
	@Override
	public int boardInsertLike(Map<String, Integer> map) {
		return boardDao.boardInsertLike(sqlSession, map);
	}
	
	// 상세 페이지 좋아요 갯수
	@Override
	public int likeCount(int bno) {
		return boardDao.likeCount(sqlSession, bno);
	}
	
	// 게시글 신고
	@Override
	public int boardReport(Map<String, String> map) {
		return boardDao.boardReport(sqlSession, map);
	}
	
	// 댓글 신고
	@Override
	public int commentReport(Map<String, String> map) {
		return boardDao.commentReport(sqlSession, map);
	}

	// 파일 업로드
	@Override
	public int saveBoardFile(BoardFile bf) {
		return boardDao.saveBoardFile(sqlSession, bf);
	}

	// 파일 다운로드
	@Override
	public BoardFile filedownloadLink(int bno) {
		return boardDao.filedownloadLink(sqlSession, bno);
	}

	// 대댓글
	@Override
	public int replyComment(Map<String, String> map) {
		return boardDao.replyComment(sqlSession, map);
	}
}
