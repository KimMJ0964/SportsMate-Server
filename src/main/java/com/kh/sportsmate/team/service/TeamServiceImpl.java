package com.kh.sportsmate.team.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Map;

import com.kh.sportsmate.Attachment.model.dao.AttachmentDao;
import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.board.model.vo.BoardFile;
import com.kh.sportsmate.board.model.vo.BoardLike;
import com.kh.sportsmate.team.model.dto.*;
import com.kh.sportsmate.team.model.vo.*;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.match.model.vo.MatchRefund;
import com.kh.sportsmate.team.model.dao.TeamDao;

import lombok.RequiredArgsConstructor;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@RequiredArgsConstructor
@Service
public class TeamServiceImpl implements TeamService {
    private final SqlSessionTemplate sqlSession;
    private final AttachmentDao attachmentDao;
    private final TeamDao teamDao;

    /**
     * 게시글 세기
     *
     * @param teamNo
     * @return
     */
 	@Override
 	public int selectListCount(int teamNo) {
 		return teamDao.selectListCount(sqlSession, teamNo);
 	}

 	 /**
     * 게시글 목록
     *
     * @param pi
     * @param teamNo
     * @return
     */
 	@Override
 	public ArrayList<TeamBoard> selectList(PageInfo pi, int teamNo) {
 		return teamDao.selectList(sqlSession, pi, teamNo);
 	}

 	 /**
     * 구단 멤버 가져오기
     *
     * @param teamNo
     * @return
     */
 	@Override
 	public ArrayList<TeamMemberDto> selectMemberList(int teamNo) {
 		return teamDao.selectMemberList(sqlSession, teamNo);
 	}

 	 /**
     * 게시글 내용 가져오기
     *
     * @param bno
     * @return
     */
 	@Override
 	public TeamBoard detailList(int bno) {
 		return teamDao.detailList(sqlSession, bno);
 	}

 	 /**
     * 댓글 가져오기
     *
     * @param bno
     * @return
     */
 	@Override
 	public ArrayList<TeamBoardComment> commentList(int bno) {
 		return teamDao.commentList(sqlSession, bno);
 	}

 	/**
     * 댓글 수 구하기
     *
     * @param bno
     * @return
     */
 	@Override
 	public int commentCount(int bno) {
 		return teamDao.commentCount(sqlSession, bno);
 	}

 	/**
     * 게시글 생성
     *
     * @param b
     * @return
     */
 	@Override
 	public int createBoard(TeamBoard b) {
 		return teamDao.createBoard(sqlSession, b);
 	}

 	/**
     * 게시글 수정
     *
     * @param b
     * @return
     */
 	@Override
 	public int updateBoard(TeamBoard b) {
 		return teamDao.updateBoard(sqlSession, b);
 	}

 	/**
     * 게시글 삭제
     *
     * @param bno
     * @return
     */
 	@Override
 	public int deleteBoard(int bno) {
 		return teamDao.deleteBoard(sqlSession, bno);
 	}

 	/**
     * 입단 거절
     *
     * @param mno
     * @return
     */
 	@Override
 	public int rejectJoin(int mno) {
 		return teamDao.rejectJoin(sqlSession, mno);
 	}

 	/**
     * 입단 승인
     *
     * @param nos
     * @return
     */
 	@Override
 	public int approveJoin(Map<String, Integer> nos) {
 		int mno = nos.get("mno");
 		if(teamDao.approveJoin(sqlSession, mno) > 0) {
 			return teamDao.approveJoinTwo(sqlSession, nos);
 		} else {
 			return 0;
 		}
 	}

 	/**
     * 게시글 검색
     *
     * @param pi
     * @param map
     * @return
     */
 	@Override
 	public ArrayList<TeamBoard> searchBoard(PageInfo pi, Map<String, String> map) {
 		return teamDao.searchBoard(sqlSession, pi, map);
 	}

 	/**
     * 댓글 쓰기
     *
     * @param map
     * @return
     */
 	@Override
 	public int writeReply(Map<String, String> map) {
 		return teamDao.writeReply(sqlSession, map);
 	}

 	/**
     * 댓글 삭제
     *
     * @param cno
     * @return
     */
 	@Override
 	public int deleteReply(int cno) {
 		return teamDao.deleteReply(sqlSession, cno);
 	}

 	/**
     * 조회수 증가
     *
     * @param bno
     * @return
     */
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
		TeamMember teamMember = new TeamMember(team.getMemNo(), team.getTeamNo());
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
    
    /**
     * 상세 게시글 좋아요 갯수
     *
     * @param bno
     * @return
     */
	@Override
	public int likeCount(int bno) {
		return teamDao.likeCount(sqlSession, bno);
	}
	
	/**
     * 상세 게시글 페이지 파일 다운로드
     *
     * @param bno
     * @return
     */
	@Override
	public BoardFile filedownloadLink(int bno) {
		return teamDao.filedownloadLink(sqlSession, bno);
	}
	
	/**
     * 좋아요 확인
     *
     * @param map
     * @return
     */
	@Override
	public BoardLike boardIsLike(Map<String, Integer> map) {
		return teamDao.boardIsLike(sqlSession, map);
	}
		
	/**
     * 좋아요
     *
     * @param map
     * @return
     */
	@Override
	public int boardToLike(Map<String, Integer> map) {
		return teamDao.boardToLike(sqlSession, map);
	}

	/**
     * 좋아요 취소
     *
     * @param map
     * @return
     */
	@Override
	public int boardToUnLike(Map<String, Integer> map) {
		return teamDao.boardToUnLike(sqlSession, map);
	}
		
	/**
     * 좋아요 삽입
     *
     * @param map
     * @return
     */
	@Override
	public int boardInsertLike(Map<String, Integer> map) {
		return teamDao.boardInsertLike(sqlSession, map);
	}
	
	/**
     * 대댓글
     *
     * @param map
     * @return
     */
	@Override
	public int replyComment(Map<String, String> map) {
		return teamDao.replyComment(sqlSession, map);
	}
	
	/**
     * 파일 업로드
     *
     * @param bg
     * @return
     */
	@Override
	public int saveBoardFile(BoardFile bf) {
		return teamDao.saveBoardFile(sqlSession, bf);
	}

	/**
     * 구단 탈퇴
     *
     * @param team
     * @return
     */
	@Override
	public int teamOut(Team team) {
		return teamDao.teamOut(sqlSession, team);
	}

	/**
     * 구단 정보
     *
     * @param tno
     * @return
     */
	@Override
	public TeamInfoDto teamInfo(int tno) {
		return teamDao.teamInfo(sqlSession, tno);
	}
	
	/**
     * 구단 인원 수
     *
     * @param tno
     * @return
     */
	@Override
	public int numOfTeamPerson(int tno) {
		return teamDao.numOfTeamPerson(sqlSession, tno);
	}
	
	/**
     * 구단 정보 수정
     *
     * @param t
     * @param profile
     * @return
     */
	@Transactional
	@Override
	public int modifyTeam(TeamInfoDto t, Profile profile) {
		int result2 = 1;
        int result3 = 1;
        System.out.println("구단 변경 프로필 : " + profile);
        // Team 객체 생성
        Team team = new Team(t.getTeamName(), t.getMemNo(), t.getTeamDescription(), t.getTeamMaxPerson(),
                t.getTeamCategory(), t.getActivityTime(), t.getActivityArea(), t.getTeamNo(), t.getApplication());
        int result1 = teamDao.modifyTeam(sqlSession, team);
        // TeamActivityDays 객체 생성
        TeamActivityDays days = new TeamActivityDays();
        days.setTeamNo(t.getTeamNo());
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
            result2 = teamDao.modifyActivityDays(sqlSession, days);
        }
        if (profile != null) {
        	
        	result3 = attachmentDao.modifyProfile(sqlSession, profile);
        	if (result3 < 1) {
        		result3 = attachmentDao.insertProfile(sqlSession, profile);
        	}
        }
        return result1 * result2 * result3;
	}
	
	/**
     * 투표 생성
     *
     * @param teamVote
     * @return
     */
	@Override
	public int createVote(TeamVote teamVote) {
		int result1 = 0;
		int result2 = 0;
		
		// TEAM_VOTE insert
		result1 = teamDao.insertVote(sqlSession, teamVote);
		
		// TEAM_VOTE_DETAIL insert
		result2 = teamDao.insertVoteDetail(sqlSession, teamVote.getVoteNo());
		
		return result1 * result2;
	}
	
	/**
     * 진행중인 투표
     *
     * @param tno
     * @return
     */
	@Override
	public TeamVote voting(int tno) {
		return teamDao.voting(sqlSession, tno);
	}
	
	/**
     * 지금까지 한 투표 정보
     *
     * @param tno
     * @return
     */
	@Override
	public ArrayList<TeamVoteDetailDto> voteList(int tno) {
		return teamDao.voteList(sqlSession, tno);
	}
	
	/**
     * 투표 목록 선택
     *
     * @param map
     * @return
     */
	@Override
	public int choseVote(Map<String, Integer> map) {
		return teamDao.choseVote(sqlSession, map);
	}
	
	/**
     * 투표 종료
     *
     * @param vno
     * @return
     */
	@Override
	public int voteComplete(int vno) {
		return teamDao.voteComplete(sqlSession, vno);
	}
	
	/**
	 * 구단장 번호
	 * @param tno
	 * @return
	 */
	@Override
	public int leaderNo(int tno) {
		return teamDao.leaderNo(sqlSession, tno);
	}
	
	/**
	 * 구단 배너
	 * @param tno
	 * @return
	 */
	@Override
	public Profile teamBanner(int tno) {
		return teamDao.teamBanner(sqlSession, tno);
	}
	
	/**
	 * 본인 팀인지 체크
	 * @param map
	 * @return
	 */
	@Override
	public Integer checkTeamMember(Map<String, String> map) {
		return teamDao.checkTeamMember(sqlSession, map);
	}
	
	/**
	 * 구단 미니 홈피 게시글 검색
	 * @param map
	 * @return
	 */
	@Override
	public int searchListCount(Map<String, String> map) {
		return teamDao.searchListCount(sqlSession, map);
	}
	
	/**
	 * 구단 전적 수
	 * @param tno
	 * @return
	 */
	@Override
	public int selectMatchCount(int tno) {
		return teamDao.selectMatchCount(sqlSession, tno);
	}
	
	/**
	 * 구단 전적
	 * @param pi
	 * @param tno
	 * @return
	 */
	@Override
	public ArrayList<TeamMatchInfoDto> matchInfo(PageInfo pi, int tno) {
		return teamDao.matchInfo(sqlSession, pi, tno);
	}

	/**
	 * 예정된 매칭
	 * @param tno
	 * @return
	 */
	@Override
	public TeamMatchInfoDto willMatch(int tno) {
		return teamDao.willMatch(sqlSession, tno);
	}

	/**
	 * 매치환불
	 * @param mr
	 * @return
	 */
	@Override
	public int teamMatchRefund(MatchRefund mr, HttpSession session) {
		int result = 0;
		result = teamDao.checkMatchRefund(sqlSession, mr);
		
		System.out.println("환불 체크 : " + result);
		
		if(result < 1) {
			result = teamDao.teamMatchRefund(sqlSession, mr);
			session.setAttribute("alertMsg", "환불에 성공하였습니다.");
			return result;
		} else {
			session.setAttribute("alertMsg", "이미 환불을 진행하였습니다.");
			return result;
		}
		
	}
	
}

