package com.kh.sportsmate.team.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Map;

import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.board.model.vo.BoardFile;
import com.kh.sportsmate.board.model.vo.BoardLike;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.match.model.vo.MatchRefund;
import com.kh.sportsmate.team.model.dto.*;
import com.kh.sportsmate.team.model.vo.*;

public interface TeamService {
	//게시글 총 갯수 가져오기
	int selectListCount(int teamNo);
	
	// 게시글 목록 가져오기
	ArrayList<TeamBoard> selectList(PageInfo pi, int teamNo);
	
	// 팀 목록 가져오기
	ArrayList<TeamMemberDto> selectMemberList(int teamNo);
	
	// 게시글 내용 가져오기
	TeamBoard detailList(int bno);
	
	// 댓글 가져오기
	ArrayList<TeamBoardComment> commentList(int bno);
	
	// 댓글 수 구하기
	int commentCount(int bno);
	
	// 게시글 생성
	int createBoard(TeamBoard b);
	
	// 게시글 수정
	int updateBoard(TeamBoard b);
	
	// 게시글 삭제
	int deleteBoard(int bno);
	
	// 입단 허락
	int approveJoin(Map<String, Integer> nos);
	
	// 입단 거부
	int rejectJoin(int mno);
	
	// 게시글 검색
	ArrayList<TeamBoard> searchBoard(PageInfo pi, Map<String, String> map);
	
	// 댓글 입력
	int writeReply(Map<String, String> map);
	
	// 댓글 삭제
	int deleteReply(int cno);
	
	// 조회수 증가
	int viewAdd(int bno);

    // 구단 창설
    int insertTeam(CreateTeamDto t, Profile profile);

    // 단원 모집 상태가 Y인 리스트 개수
    int selectRecruitListCount(String category);

    // 단원 모집 리스트 select
    ArrayList<RecruitListDto> selectRecruitList(RecruitListQueryStringDto filter, PageInfo pi);

    // 단원 모집 디테일 select
    RecruitDetailDto selectRecruitDetail(int tno);

    // 구단 가입 신청 insert
    int insertRecruit(RecruitDto application);

    // 지역명 select
    String selectAreaName(String searchArea);
    
    // 상세 페이지 좋아요 갯수
    int likeCount(int bno);
    
    // 상세 페이지 파일 다운로드
 	BoardFile filedownloadLink(int bno);
 	
 	// 좋아요인지 확인
 	BoardLike boardIsLike(Map<String, Integer> map);
 	
 	// 좋아요 변경
 	int boardToLike(Map<String, Integer> map);
 	
 	// 좋아요 취소
 	int boardToUnLike(Map<String, Integer> map);
 	
 	// 좋아요 생성
 	int boardInsertLike(Map<String, Integer> map);
 	
 	// 대댓글 작성
 	int replyComment(Map<String, String> map);
 	
 	// 팀 게시글 파일 업로드
 	int saveBoardFile(BoardFile bf);
 	
 	// 구단 탈퇴
 	int teamOut(Team team);
 	
 	// 구단 수정 페이지 내 구단 정보 가져오기
 	TeamInfoDto teamInfo(int tno);
 	
 	// 구단 인원 수 가져오는 쿼리
 	int numOfTeamPerson(int tno);
 	
 	// 구단 수정
 	int modifyTeam(TeamInfoDto t, Profile profile);
 	
 	// 투표 생성
 	int createVote(TeamVote teamVote);
 	
 	// 진행중인 투표
 	TeamVote voting(int tno);
 	
 	// 진행완료된 투표
 	ArrayList<TeamVoteDetailDto> voteList(int tno);
 	
 	// 투표 선택
 	int choseVote(Map<String, Integer> map);
 	
 	// 투표 종료
 	int voteComplete(int vno);
 	
 	// 구단장 번호
 	int leaderNo(int tno);
 	
 	// 구단 배너
 	Profile teamBanner(int tno);
 	
 	// 본인 팀인지 체크
 	int checkTeamMember(Map<String, Integer> map);
 	
 	// 구단 미니 홈피 게시글 검색
 	int searchListCount(Map<String, String> map);
 	
 	// 구단 전적 수
 	int selectMatchCount(int tno);
 	
 	// 구단 전적
 	ArrayList<TeamMatchInfoDto> matchInfo(PageInfo pi, int tno);
 	
 	// 예정된 매치
 	ArrayList<TeamMatchInfoDto> willMatch(int tno);
 	
 	// 매치 환불
 	int teamMatchRefund(MatchRefund mr, HttpSession session);
 	
 	// 구단 폐쇄
 	int teamClosing(int tno);
 	
 	// 팀 게시글이 본인 팀 확인
 	String checkTeamBoard(Map<String, Integer> map);
 	
 	// 댓글 및 게시판 주인 확인
 	int checkBoardMember(int bno);
 	
 	// 메인페이지 구단 랭킹
 	ArrayList<MyTeamDto> mainRanking(String category);
}

