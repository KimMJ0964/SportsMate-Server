package com.kh.sportsmate.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.board.model.vo.Board;
import com.kh.sportsmate.board.model.vo.BoardComment;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.team.model.dao.TeamDao;
import com.kh.sportsmate.team.model.vo.Team;
import com.kh.sportsmate.team.model.vo.TeamBoard;
import com.kh.sportsmate.team.model.vo.TeamBoardComment;
import com.kh.sportsmate.team.model.vo.TeamMember;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class TeamServiceImpl implements TeamService {
	@Autowired
	private final SqlSessionTemplate sqlSession;

	@Autowired
	private final TeamDao teamDao;

	// 게시글 수 세기
	@Override
	public int selectListCount(int teamNo) {
		return teamDao.selectListCount(sqlSession);
	}

	// 게시글 목록 가져오기
	@Override
	public ArrayList<Team> selectList(PageInfo pi, int teamNo) {
		return teamDao.selectList(sqlSession, pi);
	}

	// 구단 멤버 가져오기
	@Override
	public ArrayList<TeamMember> selectMemberList(int teamNo) {
		return teamDao.selectMemberList(sqlSession, teamNo);
	}

	// 게시글 내용 가져오기
	@Override
	public TeamBoard detailList(int bno) {
		return teamDao.detailList(sqlSession, bno);
	}

	// 댓글 가져오기
	@Override
	public ArrayList<TeamBoardComment> commentList(int bno) {
		return teamDao.commentList(sqlSession, bno);
	}

	// 댓글 수 구하기
	@Override
	public int commentCount(int bno) {
		return teamDao.commentCount(sqlSession, bno);
	}

	// 게시글 생성
	@Override
	public int createBoard(TeamBoard b) {
		return teamDao.createBoard(sqlSession, b);
	}

	// 게시글 수정
	@Override
	public int updateBoard(TeamBoard b) {
		return teamDao.updateBoard(sqlSession, b);
	}
}
