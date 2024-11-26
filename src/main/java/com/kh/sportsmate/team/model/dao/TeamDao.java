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

    public ArrayList<TeamBoard> selectList(SqlSessionTemplate sqlSession, PageInfo pi, int teamNo) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        Map<String, Object> params = new HashMap<>();
        params.put("teamNo", teamNo);

        return (ArrayList) sqlSession.selectList("teamMapper.selectList", params, rowBounds);
    }

    public ArrayList<TeamMemberDto> selectMemberList(SqlSessionTemplate sqlSession, int teamNo) {
        return (ArrayList) sqlSession.selectList("teamMapper.selectMemberList", teamNo);
    }

    public TeamBoard detailList(SqlSessionTemplate sqlSession, int bno) {
        return (TeamBoard) sqlSession.selectOne("teamMapper.detailList", bno);
    }

    public ArrayList<TeamBoardComment> commentList(SqlSessionTemplate sqlSession, int bno) {
        return (ArrayList) sqlSession.selectList("teamMapper.commentList", bno);
    }

    public int commentCount(SqlSessionTemplate sqlSession, int bno) {
        return sqlSession.selectOne("teamMapper.commentCount", bno);
    }

    public int createBoard(SqlSessionTemplate sqlSession, TeamBoard b) {
    	sqlSession.insert("teamMapper.createBoard", b);
	    return b.getBoardNo();
    }

    public int updateBoard(SqlSessionTemplate sqlSession, TeamBoard b) {
        return sqlSession.update("teamMapper.updateBoard", b);
    }

    public int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
        return sqlSession.delete("teamMapper.deleteBoard", bno);
    }

    public int rejectJoin(SqlSessionTemplate sqlSession, int mno) {
        return sqlSession.delete("teamMapper.rejectJoin", mno);
    }

    public int approveJoin(SqlSessionTemplate sqlSession, int mno) {
        return sqlSession.delete("teamMapper.approveJoin", mno);
    }

    public int approveJoinTwo(SqlSessionTemplate sqlSession, Map<String, Integer> nos) {
        return sqlSession.insert("teamMapper.approveJoinTwo", nos);
    }

    public ArrayList<TeamBoard> searchBoard(SqlSessionTemplate sqlSession, PageInfo pi, Map<String, String> map) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return (ArrayList) sqlSession.selectList("teamMapper.searchBoard", map, rowBounds);
    }
    
    public int writeReply(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.update("teamMapper.writeReply", map);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, int cno) {
		return sqlSession.update("teamMapper.deleteReply", cno);
	}
	
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
    
    public int likeCount(SqlSessionTemplate sqlSession, int bno) {
    	return sqlSession.selectOne("teamMapper.likeCount", bno);
    }
    
    public BoardFile filedownloadLink(SqlSessionTemplate sqlSession, int bno) {
    	return sqlSession.selectOne("teamMapper.filedownloadLink", bno);
    }
    
    public BoardLike boardIsLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.selectOne("teamMapper.boardIsLike", map);
	}
	
	public int boardToLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.update("teamMapper.boardToLike", map);
	}
	
	public int boardToUnLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.update("teamMapper.boardToUnLike", map);
	}
	
	public int boardInsertLike(SqlSessionTemplate sqlSession, Map<String, Integer> map) {
		return sqlSession.insert("teamMapper.boardInsertLike", map);
	}
	
	public int replyComment(SqlSessionTemplate sqlSession, Map<String, String> map) {
		return sqlSession.insert("teamMapper.replyComment", map);
	}
	
	public int saveBoardFile(SqlSessionTemplate sqlSession, BoardFile bf) {
		return sqlSession.insert("teamMapper.saveBoardFile", bf);
	}
	
	public int teamOut(SqlSessionTemplate sqlSession, Team team) {
		return sqlSession.update("teamMapper.teamOut", team);
	}
	
	public TeamInfoDto teamInfo(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("teamMapper.teamInfo", tno);
	}
	
	public int numOfTeamPerson(SqlSessionTemplate sqlSession, int tno) {
		return sqlSession.selectOne("teamMapper.numOfTeamPerson", tno);
	}
	
	public int modifyTeam(SqlSessionTemplate sqlSession, Team t) {
        return sqlSession.update("teamMapper.modifyTeam", t);
    }

    public int modifyActivityDays(SqlSessionTemplate sqlSession, TeamActivityDays days) {
        return sqlSession.update("teamMapper.modifyActivityDays", days);
    }
}
