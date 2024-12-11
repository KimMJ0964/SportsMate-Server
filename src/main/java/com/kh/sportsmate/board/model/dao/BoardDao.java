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
	/**
     * 게시글 수 Select
     * @param sqlSession
     * @return
     */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	/**
     * 게시글 목록 Select
     * @param sqlSession
     * @param pi
     * @return
     */
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
	}
	
	/**
     * 게시글 내용 Select
     * @param sqlSession
     * @param bno
     * @return
     */
	public Board detailList(SqlSessionTemplate sqlSession, int bno) {
		return (Board) sqlSession.selectOne("boardMapper.detailList", bno);
	}
	
	/**
     * 댓글 목록 Select
     * @param sqlSession
     * @param bno
     * @return
     */
	public ArrayList<CommentInfo> commentList(SqlSessionTemplate sqlSession, int bno) {
		return (ArrayList) sqlSession.selectList("boardMapper.commentList", bno);
	}
	
	/**
     * 댓글 수 갯수 Select
     * @param sqlSession
     * @param bno
     * @return
     */
	public int commentCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.commentCount", bno);
	}
	
	/**
     * 게시글 생성 Insert
     * @param sqlSession
     * @param b
     * @return
     */
	public int createBoard(SqlSessionTemplate sqlSession, Board b) {
		sqlSession.insert("boardMapper.createBoard", b);
	    return b.getBoardNo();  // 생성된 BOARD_NO 반환
	}
	
	/**
     * 게시글 수정 Update
     * @param sqlSession
     * @param b
     * @return
     */
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}
	
	/**
     * 게시글 삭제 Update
     * @param sqlSession
     * @param bno
     * @return
     */
	public int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("boardMapper.deleteBoard", bno);
	}
	
	/**
     * 게시글 검색 Select
     * @param sqlSession
     * @param pi
     * @param map
     * @return
     */
	public ArrayList<Board> searchBoard(SqlSessionTemplate sqlSession, PageInfo pi, Map<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("boardMapper.searchBoard", map, rowBounds);
	}
	
	/**
     * 댓글 쓰기 Insert
     * @param sqlSession
     * @param map
     * @return
     */
	public int writeReply(SqlSessionTemplate sqlSession, Map<String, String>map) {
		return sqlSession.insert("boardMapper.writeReply", map);
	}
	
	/**
     * 댓글 삭제 Update
     * @param sqlSession
     * @param cno
     * @return
     */
	public int deleteReply(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.update("boardMapper.deleteReply", map);
	}
	
	/**
     * 조회수 증가 Update
     * @param sqlSession
     * @param bno
     * @return
     */
	public int viewAdd(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("boardMapper.viewAdd", bno);
	}
	
	/**
     * 댓글 아이디 가져오기 Select
     * @param sqlSession
     * @param cno
     * @return
     */
	public BoardComment getCommentById(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.selectOne("boardMapper.getCommentById", cno);
	}
	
	/**
     * 좋아요 여부 확인 Select
     * @param sqlSession
     * @param map
     * @return
     */
	public BoardLike boardIsLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.selectOne("boardMapper.boardIsLike", map);
	}
	
	/**
     * 좋아요 Update
     * @param sqlSession
     * @param map
     * @return
     */
	public int boardToLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.update("boardMapper.boardToLike", map);
	}
	
	/**
     * 좋아요 취소 Update
     * @param sqlSession
     * @param map
     * @return
     */
	public int boardToUnLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.update("boardMapper.boardToUnLike", map);
	}
	
	/**
     * 좋아요 생성 insert
     * @param sqlSession
     * @param map
     * @return
     */
	public int boardInsertLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.insert("boardMapper.boardInsertLike", map);
	}
	
	/**
     * 좋아요 갯수 Select
     * @param sqlSession
     * @param bno
     * @return
     */
	public int likeCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.likeCount", bno);
	}
	
	/**
     * 게시글 신고 Insert
     * @param sqlSession
     * @param map
     * @return
     */
	public int boardReport(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.insert("boardMapper.boardReport", map);
	}
	
	/**
     * 댓글 신고 Insert
     * @param sqlSession
     * @param map
     * @return
     */
	public int commentReport(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.insert("boardMapper.commentReport", map);
	}
	
	/**
     * 게시글 파일 저장 insert
     * @param sqlSession
     * @param bf
     * @return
     */
	public int saveBoardFile(SqlSessionTemplate sqlSession, BoardFile bf) {
		return sqlSession.insert("boardMapper.saveBoardFile", bf);
	}
	
	/**
     * 파일 다운로드 Select
     * @param sqlSession
     * @param bno
     * @return
     */
	public BoardFile filedownloadLink(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.filedownloadLink", bno);
	}
	
	/**
     * 대댓글 Insert
     * @param sqlSession
     * @param map
     * @return
     */
	public int replyComment(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.insert("boardMapper.replyComment", map);
	}
	
	/**
     * 파일 존재 여부 Select
     * @param sqlSession
     * @param bno
     * @return
     */
	public BoardFile fileCheck(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.fileCheck", bno);
	}
	
	/**
     * 파일 수정 Update
     * @param sqlSession
     * @param bf
     * @return
     */
	public int updateBoardFile(SqlSessionTemplate sqlSession, BoardFile bf) {
		return sqlSession.update("boardMapper.updateBoardFile", bf);
	}
	
	/**
	 * 게시글 주인 확인 Select
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int checkBoardMember(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.checkBoardMember", bno);
	}
	
	/**
	 * 게시글 검색 수 Select
	 * @param sqlSession
	 * @return
	 */
	public int searchListCount(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.selectOne("boardMapper.searchListCount", map);
	}
}
