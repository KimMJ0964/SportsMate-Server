package com.kh.sportsmate.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.board.model.dao.BoardDao;
import com.kh.sportsmate.board.model.vo.Board;
import com.kh.sportsmate.board.model.vo.BoardComment;
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
}
