package com.kh.sportsmate.team.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.sportsmate.Attachment.model.dao.AttachmentDao;
import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.team.model.dto.*;
import com.kh.sportsmate.team.model.vo.*;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.board.model.vo.Board;
import com.kh.sportsmate.board.model.vo.BoardComment;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.team.model.dao.TeamDao;

import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

import static jdk.nashorn.internal.runtime.regexp.joni.Config.log;

@Slf4j
@RequiredArgsConstructor
@Service
public class TeamServiceImpl implements TeamService {
    private final SqlSessionTemplate sqlSession;
    private final AttachmentDao attachmentDao;
    private final TeamDao teamDao;

 // 게시글 수 세기
 	@Override
 	public int selectListCount(int teamNo) {
 		return teamDao.selectListCount(sqlSession, teamNo);
 	}

 	// 게시글 목록 가져오기
 	@Override
 	public ArrayList<TeamBoard> selectList(PageInfo pi, int teamNo) {
 		return teamDao.selectList(sqlSession, pi, teamNo);
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

 	// 게시글 삭제
 	@Override
 	public int deleteBoard(int bno) {
 		return teamDao.deleteBoard(sqlSession, bno);
 	}

 	// 입단 거절
 	@Override
 	public int rejectJoin(int mno) {
 		return teamDao.rejectJoin(sqlSession, mno);
 	}

 	// 입단 승인
 	@Override
 	public int approveJoin(Map<String, Integer> nos) {
 		int mno = nos.get("mno");
 		if(teamDao.approveJoin(sqlSession, mno) > 0) {
 			return teamDao.approveJoinTwo(sqlSession, nos);
 		} else {
 			return 0;
 		}
 	}

 	// 게시글 검색
 	@Override
 	public ArrayList<TeamBoard> searchBoard(PageInfo pi, Map<String, String> map) {
 		return teamDao.searchBoard(sqlSession, pi, map);
 	}

 	// 댓글 쓰기
 	@Override
 	public int writeReply(Map<String, String> map) {
 		return teamDao.writeReply(sqlSession, map);
 	}

 	// 댓글 삭제
 	@Override
 	public int deleteReply(int cno) {
 		return teamDao.deleteReply(sqlSession, cno);
 	}

 	// 조회수 증가
 	@Override
 	public int viewAdd(int bno) {
 		return teamDao.viewAdd(sqlSession, bno);
 	}

    @Transactional
    @Override
    public int insertTeam(CreateTeamDto t, Profile profile) {
        int result2 = 1;
        int result3 = 1;
        // Team 객체 생성
        Team team = new Team(t.getTeamName(), t.getMemNo(), t.getTeamDescription(), t.getTeamMaxPerson(),
                t.getTeamCategory(), t.getActivityTime(), t.getActivityArea());
        int result1 = teamDao.insertTeam(sqlSession, team);
        // TeamActivityDays 객체 생성
        TeamActivityDays days = new TeamActivityDays();
        if (!t.getActivityDays().isEmpty()) {
            for (Object day : t.getActivityDays()) {
                log.info("day : {}", day);
                switch (day.toString()) {
                    case "monday":
                        days.setMonday('Y');
                        break;
                    case "tuesday":
                        days.setTuesday('Y');
                        break;
                    case "wednesday":
                        days.setWednesday('Y');
                        break;
                    case "thursday":
                        days.setThursday('Y');
                        break;
                    case "friday":
                        days.setFriday('Y');
                        break;
                    case "saturday":
                        days.setSaturday('Y');
                        break;
                    case "sunday":
                        days.setSunday('Y');
                        break;
                }
            }
            days.setTeamNo(team.getTeamNo());
            result2 = teamDao.insertActivityDays(sqlSession, days);
        }
        if (profile != null) {
            profile.setTeamNo(team.getTeamNo());
            result3 = attachmentDao.insertProfile(sqlSession, profile);
        }
		// 구단장 팀원에 추가
		TeamMember teamMember = new TeamMember(team.getTeamNo(), team.getMemNo());
		int result4 = teamDao.insertTeamMember(sqlSession, teamMember);
        return result1 * result2 * result3 * result4;
    }

    /**
     * 카테고리에 따른 단원 모집 리스트 개수 조회
     *
     * @param category category(soccer, futsal, basketball, baseball)
     * @return 리스트 개수
     */
    @Override
    public int selectRecruitListCount(String category) {
        return teamDao.selectRecruitListCount(sqlSession, category);
    }

    /**
     * 필터에 맞는 단원 리스트 조회
     *
     * @param filter category(soccer, futsal, basketball, baseball), filter(latest, ), searchArea(000-0001)
     * @param pi
     * @return
     */
    @Override
    public ArrayList<RecruitListDto> selectRecruitList(RecruitListQueryStringDto filter, PageInfo pi) {
        return teamDao.selectRecruitList(sqlSession, filter, pi);
    }

    @Override
    public RecruitDetailDto selectRecruitDetail(int tno) {
        return teamDao.selectRecruitDetail(sqlSession, tno);
    }

    @Override
    public int insertRecruit(RecruitDto application) {
        return teamDao.insertRecruit(sqlSession,application);
    }

    @Override
    public String selectAreaName(String searchArea) {
        return teamDao.selectAreaName(sqlSession, searchArea);
    }   
}

