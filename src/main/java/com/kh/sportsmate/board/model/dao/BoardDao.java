package com.kh.sportsmate.board.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sportsmate.board.model.dto.BoardMemberPanalty;
import com.kh.sportsmate.board.model.dto.CommentInfo;
import com.kh.sportsmate.board.model.vo.Board;
import com.kh.sportsmate.board.model.vo.BoardComment;
import com.kh.sportsmate.board.model.vo.BoardFile;
import com.kh.sportsmate.board.model.vo.BoardLike;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.member.model.vo.ProfileFile;

@Repository
public class BoardDao {
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}
	
	public Board detailList(SqlSessionTemplate sqlSession, int bno) {
		return (Board) sqlSession.selectOne("boardMapper.detailList", bno);
	}
	
	public ArrayList<CommentInfo> commentList(SqlSessionTemplate sqlSession, int bno) {
		return (ArrayList) sqlSession.selectList("boardMapper.commentList", bno);
	}
	
	public int commentCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.commentCount", bno);
	}
	
	public int createBoard(SqlSessionTemplate sqlSession, Board b) {
		sqlSession.insert("boardMapper.createBoard", b);
	    return b.getBoardNo();  // 생성된 BOARD_NO 반환
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("boardMapper.deleteBoard", bno);
	}
	
	public ArrayList<Board> searchBoard(SqlSessionTemplate sqlSession, PageInfo pi, Map<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.searchBoard", map, rowBounds);
	}
	
	public int writeReply(SqlSessionTemplate sqlSession, Map<String, String>map) {
		return sqlSession.insert("boardMapper.writeReply", map);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.update("boardMapper.deleteReply", cno);
	}
	
	public int viewAdd(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("boardMapper.viewAdd", bno);
	}
	
	public BoardComment getCommentById(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.selectOne("boardMapper.getCommentById", cno);
	}
	
	public BoardLike boardIsLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.selectOne("boardMapper.boardIsLike", map);
	}
	
	public int boardToLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.update("boardMapper.boardToLike", map);
	}
	
	public int boardToUnLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.update("boardMapper.boardToUnLike", map);
	}
	
	public int boardInsertLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.insert("boardMapper.boardInsertLike", map);
	}
	
	public int likeCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.likeCount", bno);
	}
	
	public int boardReport(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.insert("boardMapper.boardReport", map);
	}
	
	public int commentReport(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.insert("boardMapper.commentReport", map);
	}
	
	public int saveBoardFile(SqlSessionTemplate sqlSession, BoardFile bf) {
		return sqlSession.insert("boardMapper.saveBoardFile", bf);
	}
	
	public BoardFile filedownloadLink(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.filedownloadLink", bno);
	}
	
	public int replyComment(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.insert("boardMapper.replyComment", map);
	}
	
}
