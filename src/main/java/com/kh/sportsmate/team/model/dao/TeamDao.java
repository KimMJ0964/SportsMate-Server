package com.kh.sportsmate.team.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.sportsmate.team.model.dto.RecruitDetailDto;
import com.kh.sportsmate.team.model.dto.RecruitDto;
import com.kh.sportsmate.team.model.dto.RecruitListDto;
import com.kh.sportsmate.team.model.dto.RecruitListQueryStringDto;
import com.kh.sportsmate.team.model.dto.TeamInfoDto;
import com.kh.sportsmate.team.model.dto.TeamMemberDto;
import com.kh.sportsmate.team.model.dto.TeamVoteDetailDto;
import com.kh.sportsmate.team.model.vo.*;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.sportsmate.board.model.vo.BoardFile;
import com.kh.sportsmate.board.model.vo.BoardLike;
import com.kh.sportsmate.common.vo.PageInfo;

@Repository
public class TeamDao {
    public int selectListCount(SqlSessionTemplate sqlSession, int teamNo) {
        return sqlSession.selectOne("teamMapper.selectListCount", teamNo);
    }
    
    /**
     * 구단 게시글 목록 Select
     * @param sqlSession
     * @param pi
     * @param teamNo
     * @return
     */
    public ArrayList<TeamBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int teamNo) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        Map<String, Object> params = new HashMap<>();
        params.put("teamNo", teamNo);

        return (ArrayList) sqlSession.selectList("teamMapper.selectList", params, rowBounds);
    }
    
    /**
     * 구단 단원 목록 Select
     * @param sqlSession
     * @param teamNo
     * @return
     */
    public ArrayList<TeamMemberDto> selectMemberList(SqlSessionTemplate sqlSession, int teamNo) {
        return (ArrayList) sqlSession.selectList("teamMapper.selectMemberList", teamNo);
    }
    
    /**
     * 구단 상세 게시글 Select
     * @param sqlSession
     * @param bno
     * @return
     */
    public TeamBoard detailList(SqlSessionTemplate sqlSession, int bno) {
        return (TeamBoard) sqlSession.selectOne("teamMapper.detailList", bno);
    }
    
    /**
     * 구단 게시글 댓글 Select
     * @param sqlSession
     * @param bno
     * @return
     */
    public ArrayList<TeamBoardComment> commentList(SqlSessionTemplate sqlSession, int bno) {
        return (ArrayList) sqlSession.selectList("teamMapper.commentList", bno);
    }

    /**
     * 구단 댓글 수 Select
     * @param sqlSession
     * @param bno
     * @return
     */
    public int commentCount(SqlSessionTemplate sqlSession, int bno) {
        return sqlSession.selectOne("teamMapper.commentCount", bno);
    }
    
    /**
     * 구단 게시글 생성 update
     * @param sqlSession
     * @param b
     * @return
     */
    public int createBoard(SqlSessionTemplate sqlSession, TeamBoard b) {
    	sqlSession.insert("teamMapper.createBoard", b);
	    return b.getBoardNo();
    }

    /**
     * 구단 게시글 수정 Update
     * @param sqlSession
     * @param b
     * @return
     */
    public int updateBoard(SqlSessionTemplate sqlSession, TeamBoard b) {
        return sqlSession.update("teamMapper.updateBoard", b);
    }

    /**
     * 구단 게시글 삭제 Update
     * @param sqlSession
     * @param bno
     * @return
     */
    public int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
        return sqlSession.delete("teamMapper.deleteBoard", bno);
    }

    /**
     * 구단 입단 거절 delete
     * @param sqlSession
     * @param mno
     * @return
     */
    public int rejectJoin(SqlSessionTemplate sqlSession, int mno) {
        return sqlSession.delete("teamMapper.rejectJoin", mno);
    }
    
    /**
     * 구단 입단 허락 delete
     * @param sqlSession
     * @param mno
     * @return
     */
    public int approveJoin(SqlSessionTemplate sqlSession, int mno) {
        return sqlSession.delete("teamMapper.approveJoin", mno);
    }

    /**
     * 구단 입단 허락 insert (TEAM_MEMBER 추가)
     * @param sqlSession
     * @param nos
     * @return
     */
    public int approveJoinTwo(SqlSessionTemplate sqlSession, Map<String, Integer> nos) {
        return sqlSession.insert("teamMapper.approveJoinTwo", nos);
    }

    /**
     * 구단 게시글 검색 SELECT
     * @param sqlSession
     * @param pi
     * @param map
     * @return
     */
    public ArrayList<TeamBoard> searchBoard(SqlSessionTemplate sqlSession, PageInfo pi, Map<String, String> map) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return (ArrayList) sqlSession.selectList("teamMapper.searchBoard", map, rowBounds);
    }
    
    /**
     * 댓글 쓰기 update
     * @param sqlSession
     * @param map
     * @return
     */
    public int writeReply(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("teamMapper.writeReply", map);
	}
	
    /**
     * 댓글 삭제 update
     * @param sqlSession
     * @param cno
     * @return
     */
	public int deleteReply(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.update("teamMapper.deleteReply", cno);
	}
	
	/**
     * 조회수 증가 update
     * @param sqlSession
     * @param bno
     * @return
     */
	public int viewAdd(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("teamMapper.viewAdd", bno);
	}
	
	
    public int insertTeam(SqlSessionTemplate sqlSession, Team t) {
        return sqlSession.insert("teamMapper.insertTeam", t);
    }

    public int insertActivityDays(SqlSessionTemplate sqlSession, TeamActivityDays days) {
        return sqlSession.insert("teamMapper.insertActivityDays", days);
    }

    public int selectRecruitListCount(SqlSessionTemplate sqlSession, String category) {
        return sqlSession.selectOne("teamMapper.selectRecruitListCount", category);
    }
    
    public ArrayList<RecruitListDto> selectRecruitList(SqlSessionTemplate sqlSession, RecruitListQueryStringDto filter, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return (ArrayList) sqlSession.selectList("teamMapper.selectRecruitList", filter, rowBounds);
    }

    public RecruitDetailDto selectRecruitDetail(SqlSessionTemplate sqlSession, int tno) {
        return sqlSession.selectOne("teamMapper.selectRecruitDetail", tno);
    }
    public int insertRecruit(SqlSessionTemplate sqlSession, RecruitDto application){
        return sqlSession.insert("teamMapper.insertRecruit", application);
    }
    public String selectAreaName(SqlSessionTemplate sqlSession, String searchArea) {
        return sqlSession.selectOne("teamMapper.selectAreaName",searchArea);
    }
    public int insertTeamMember(SqlSessionTemplate sqlSession, TeamMember teamMember){
        return sqlSession.insert("teamMapper.insertTeamMember", teamMember);
    }
    
    /**
     * 좋아요 갯수 select
     * @param sqlSession
     * @param bno
     * @return
     */
    public int likeCount(SqlSessionTemplate sqlSession, int bno) {
    	return sqlSession.selectOne("teamMapper.likeCount", bno);
    }
    
    /**
     * 파일 다운로드 select
     * @param sqlSession
     * @param bno
     * @return
     */
    public BoardFile filedownloadLink(SqlSessionTemplate sqlSession, int bno) {
    	return sqlSession.selectOne("teamMapper.filedownloadLink", bno);
    }
    
    /**
     * 좋아요 여부 select
     * @param sqlSession
     * @param map
     * @return
     */
    public BoardLike boardIsLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.selectOne("teamMapper.boardIsLike", map);
	}
	
    /**
     * 좋아요 select
     * @param sqlSession
     * @param map
     * @return
     */
	public int boardToLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.update("teamMapper.boardToLike", map);
	}
	
	 /**
     * 좋아요 취소 update
     * @param sqlSession
     * @param map
     * @return
     */
	public int boardToUnLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.update("teamMapper.boardToUnLike", map);
	}
	
	 /**
     * 좋아요 insert (좋아요 처음 눌렀을대)
     * @param sqlSession
     * @param map
     * @return
     */
	public int boardInsertLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.insert("teamMapper.boardInsertLike", map);
	}
	
	 /**
     * 대댓글 Insert
     * @param sqlSession
     * @param map
     * @return
     */
	public int replyComment(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.insert("teamMapper.replyComment", map);
	}
	
	 /**
     * 파일 업로드 Insert
     * @param sqlSession
     * @param map
     * @return
     */
	public int saveBoardFile(SqlSessionTemplate sqlSession, BoardFile bf) {
		return sqlSession.insert("teamMapper.saveBoardFile", bf);
	}
	
	 /**
     * 구단 탈퇴 update
     * @param sqlSession
     * @param team
     * @return
     */
	public int teamOut(SqlSessionTemplate sqlSession, Team team) {
		return sqlSession.update("teamMapper.teamOut", team);
	}
	
	 /**
     * 구단 정보 select
     * @param sqlSession
     * @param tno
     * @return
     */
	public TeamInfoDto teamInfo(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("teamMapper.teamInfo", tno);
	}
	
	 /**
     * 구단 정원 수 select
     * @param sqlSession
     * @param tno
     * @return
     */
	public int numOfTeamPerson(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("teamMapper.numOfTeamPerson", tno);
	}
	
	 /**
     * 구단 정보 수정 Update
     * @param sqlSession
     * @param t
     * @return
     */
	public int modifyTeam(SqlSessionTemplate sqlSession, Team t) {
        return sqlSession.update("teamMapper.modifyTeam", t);
    }

	 /**
     * 구단 활동일 수정 update
     * @param sqlSession
     * @param days
     * @return
     */
    public int modifyActivityDays(SqlSessionTemplate sqlSession, TeamActivityDays days) {
        return sqlSession.update("teamMapper.modifyActivityDays", days);
    }
    
    /**
     * 투표 생성 Insert
     * @param sqlSession
     * @param teamVote
     */
    public int insertVote(SqlSessionTemplate sqlSession, TeamVote teamVote) {
    	return sqlSession.insert("teamMapper.insertVote", teamVote);
    }
    
    /**
     * 투표 생성(TEAM_VOTE_DETAIL) Insert
     * @param sqlSession
     * @param voteNo
     */
    public int insertVoteDetail(SqlSessionTemplate sqlSession, int voteNo) {
    	return sqlSession.insert("teamMapper.insertVoteDetail", voteNo);
    }
    
    /**
     * 진행중인 투표 Select
     * @param sqlSession
     * @param tno
     */
    public TeamVote voting(SqlSessionTemplate sqlSession, int tno) {
    	return sqlSession.selectOne("teamMapper.voting", tno);
    }
    
    /**
     * 진행완료 투표 Select
     * @param sqlSession
     * @param tno
     */
    public ArrayList<TeamVoteDetailDto> voteList(SqlSessionTemplate sqlSession, int tno) {
    	return (ArrayList) sqlSession.selectList("teamMapper.voteList", tno);
    }
    
    /**
     * 투표 선택 Update
     * @param sqlSession
     * @param map
     */
    public int choseVote(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
    	return sqlSession.update("teamMapper.choseVote", map);
    }
    
    /**
     * 투표 종료 Update
     * @param sqlSession
     * @param vno
     */
    public int voteComplete(SqlSessionTemplate sqlSession, int vno) {
    	return sqlSession.update("teamMapper.voteComplete", vno);
    }
}
