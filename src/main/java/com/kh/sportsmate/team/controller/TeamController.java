package com.kh.sportsmate.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.board.model.vo.BoardFile;
import com.kh.sportsmate.board.model.vo.BoardLike;
import com.kh.sportsmate.board.service.BoardService;
import com.kh.sportsmate.team.model.dto.*;
import com.kh.sportsmate.team.model.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.team.service.TeamService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.multipart.MultipartFile;

/**
 * packageName    : com.kh.sportsmate.team.controller
 * fileName       : TeamController
 * author         : jun
 * date           : 2024. 11. 14.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 14.        jun       최초 생성
 */
@CrossOrigin
@Slf4j
@Controller
public class TeamController {

    private final TeamService teamService;
    
    private final BoardService boardService;

    @Autowired
    public TeamController(TeamService teamService, BoardService boardService) {
        this.teamService = teamService;
        this.boardService = boardService;
    }

    // 구단 메인 페이지 : 게시글, 페이지네이션, 팀원 목록
    @RequestMapping("boardList.tm")
    public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model, int tno) {
        // 임의의 팀 번호 값

        System.out.println(tno + "번 구단 미니 홈피");
        int boardCount = teamService.selectListCount(tno);

        PageInfo pi = Template.getPageInfo(boardCount, currentPage, 10, 10);
        ArrayList<TeamBoard> list = teamService.selectList(pi, tno);
        ArrayList<TeamMemberDto> memberList = teamService.selectMemberList(tno);

        for (TeamMemberDto teamMember : memberList) {
            System.out.println(teamMember);
        }

        model.addAttribute("tno", tno);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        model.addAttribute("memberList", memberList);
        return "teamBoard/teamHome";
    }

    // 게시글 생성 페이지 이동
    @RequestMapping("createMoveBd.tm")
    public String enrollForm(Model m, int tno) {
        m.addAttribute("tno", tno);
        return "teamBoard/teamBoardCreate";
    }

	// 게시글 상세 페이지로 이동
	@RequestMapping("detailMoveBd.tm")
	public String detailList(int bno, Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		TeamBoard teamBoard = teamService.detailList(bno);
		ArrayList<TeamBoardComment> comment = teamService.commentList(bno);
		int commentCount = teamService.commentCount(bno);
		int boardViewAdd = teamService.viewAdd(bno);
		int likeCount = teamService.likeCount(bno);
		BoardFile bf = teamService.filedownloadLink(bno);
		
		if(bf != null) {
			String downloadLink = bf.getFilePath() + bf.getChangeName();
			model.addAttribute("downloadLink", downloadLink);
		}
		
		model.addAttribute("likeCount", likeCount);
        model.addAttribute("commentCount", commentCount);
        model.addAttribute("comment", comment);
        model.addAttribute("teamBoard", teamBoard);
        model.addAttribute("loginMember", loginMember);
        return "teamBoard/teamBoardDetail";
    }

    // 게시글 수정 페이지로 이동
    @RequestMapping("modifyMoveBd.tm")
    public String mdBoardSelect(int mpage, Model model) {
        TeamBoard teamBoard = teamService.detailList(mpage);

        model.addAttribute("teamBoard", teamBoard);
        return "teamBoard/teamBoardModify";
    }

    // 게시글 생성
    @PostMapping("createBd.tm")
    public String insertBoard(TeamBoard b, MultipartFile fileUpload, HttpSession session, Model m, int tno) {
    	Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();
		BoardFile bf;
    	
    	b.setTeamNo(tno);
    	b.setMemNo(memNo);
        int result = teamService.createBoard(b);

        if (result > 0) { // 성공
        	
        	String path = "resources/images/boardFile/";
	        String filePath = session.getServletContext().getRealPath(path);
	        
	        if (!fileUpload.getOriginalFilename().equals("")) {
	            String changeName = Template.saveFile(fileUpload, session, path);
	            bf = new BoardFile(result, fileUpload.getOriginalFilename(), changeName, path);
	            
	            int result2 = teamService.saveBoardFile(bf);
	        }
        	
            session.setAttribute("alertMsg", "게시글 작성 성공");
            return "redirect:boardList.tm?tno=" + tno;
        } else { // 실패
            System.out.println("일반 게시글 생성 실패");
            m.addAttribute("alertMsg", "게시글 작성 실패");
            return "redirect:boardList.tm?tno=" + tno;
        }

    }

    // 게시글 수정
    @PostMapping("modify.tm")
    public String updateBoard(TeamBoard b, MultipartFile fileUpload, HttpSession session, Model m, int bno, int tno) {
        b.setBoardNo(bno);
        System.out.println(b);
        BoardFile bf;
		
		BoardFile fCheck = boardService.fileCheck(bno);
		
		if(fCheck == null) {	// 파일 없다면 새로 생성
			String path = "resources/boardFile/";
			String filePath = session.getServletContext().getRealPath(path);
			if (!fileUpload.getOriginalFilename().equals("")) {
				String changeName = Template.saveFile(fileUpload, session, path);
				bf = new BoardFile(b.getBoardNo(), fileUpload.getOriginalFilename(), changeName, path);
				
				int result2 = boardService.saveBoardFile(bf);
			}
		} else {	// 파일 있다면 수정
			String path = "resources/images/boardFile/";
			String filePath = session.getServletContext().getRealPath(path);
			if (!fileUpload.getOriginalFilename().equals("")) {
				String changeName = Template.saveFile(fileUpload, session, path);
				bf = new BoardFile(b.getBoardNo(), fileUpload.getOriginalFilename(), changeName, path);
				
				int result2 = boardService.updateBoardFile(bf);
			}
		}
		
        int result = teamService.updateBoard(b);

        if (result > 0) { // 성공
            session.setAttribute("alertMsg", "게시글 수정 성공");
            return "redirect:boardList.tm?tno=" + tno;
        } else { // 실패
            System.out.println("일반 게시글 생성 실패");
            session.setAttribute("alertMsg", "게시글 수정 실패");
            return "redirect:boardList.tm?tno=" + tno;
        }

    }

    // 게시글 삭제
    @RequestMapping("delete.tm")
    public String deleteBoard(Model m, HttpSession session, int bno, int tno) {
        System.out.println(bno);
        int result = teamService.deleteBoard(bno);
        if (result > 0) { // 성공
            session.setAttribute("alertMsg", "게시글 삭제 성공");
            return "redirect:boardList.tm?tno=" + tno;
        } else { // 실패
            System.out.println("일반 게시글 생성 실패");
            session.setAttribute("alertMsg", "게시글 삭제 실패");
            return "redirect:boardList.tm?tno=" + tno;
        }
    }

    // 구단 입단 신청 허락
    @RequestMapping("approveJoin.tm")
    public String approveJoin(Model m, HttpSession session, int mno, int tno) {
        Map<String, Integer> nos = new HashMap<>();
        nos.put("mno", mno);
        nos.put("tno", tno);

        int result = teamService.approveJoin(nos);

        if (result > 0) { // 성공
            session.setAttribute("alertMsg", "입단 성공");
            return "redirect:myPageInfo.mp";
        } else { // 실패
            m.addAttribute("errorMsg", "입단 실패");
            return "redirect:myPageInfo.mp";
        }
    }

    // 구단 입단 신청 거절
    @RequestMapping("rejectJoin.tm")
    public String rejectJoin(Model m, HttpSession session, int mno) {
        int result = teamService.rejectJoin(mno);
        if (result > 0) { // 성공
            session.setAttribute("alertMsg", "입단 거부 성공");
            return "redirect:myPageInfo.mp";
        } else { // 실패
            m.addAttribute("errorMsg", "입단 거부 실패");
            return "redirect:myPageInfo.mp";
        }
    }

    // 게시글 검색
    @RequestMapping("searchBoard.tm")
    public String searchBoard(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model m,
                              String category, String keyword, int tno) {
        System.out.println(category + "/" + keyword + "/" + tno);
        int boardCount = teamService.selectListCount(tno);
        PageInfo pi = Template.getPageInfo(boardCount, currentPage, 10, 10);

        Map<String, String> map = new HashMap<>();
        map.put("category", category);
        map.put("keyword", keyword);
        map.put("tno", String.valueOf(tno));
        ArrayList<TeamBoard> list = teamService.searchBoard(pi, map);
        ArrayList<TeamMemberDto> memberList = teamService.selectMemberList(tno);

        m.addAttribute("list", list);
        m.addAttribute("pi", pi);
        m.addAttribute("memberList", memberList);
        m.addAttribute("tno", tno);

        return "teamBoard/teamHome";
    }

	// 댓글 작성
	@RequestMapping("writeReply.tm")
	public String writeReply(int bno, String comContent, Model m, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();
		Map<String, String> map = new HashMap<>();
		map.put("bno", String.valueOf(bno));
		map.put("memNo", String.valueOf(memNo));
		map.put("comContent", comContent);
        int result = teamService.writeReply(map);

		if (result > 0) { // 성공
			return "redirect:detailMoveBd.tm?bno=" + bno;
		} else { // 실패
			m.addAttribute("errorMsg", "댓글 작성 실패");
			return "redirect:detailMoveBd.tm?bno=" + bno;
		}
	}

    // 댓글 삭제
    @RequestMapping("deleteComm.tm")
    public String deleteReply(int cno, int bno, int tno, Model m) {
        int result = teamService.deleteReply(cno);

		if (result > 0) { // 성공
			return "redirect:detailMoveBd.tm?bno=" + bno;
		} else { // 실패
			m.addAttribute("errorMsg", "댓글 작성 실패");
			return "redirect:detailMoveBd.tm?bno=" + bno;
		}
	}
    
    // 좋아요 버튼 클릭
 	@RequestMapping("boardLike.tm")
 	public String boardLike(HttpSession session, int bno) {
 		Member loginMember = (Member) session.getAttribute("loginMember");

 		if (loginMember != null) {
 			int memNo = loginMember.getMemNo();

 			Map<String, Integer> map = new HashMap<>();

 			map.put("memNo", memNo);
 			map.put("bno", bno);

 			BoardLike board = teamService.boardIsLike(map);

 			if (board == null) {
 				int boardLI = teamService.boardInsertLike(map);
 				session.setAttribute("alertMsg", "게시글에 좋아요를 눌렀습니다.");
 				return "redirect:detailMoveBd.tm?bno=" + bno;
 			} else if (board.getStatus().equals("N")) {
 				int boardLikeChange = teamService.boardToLike(map);
 				session.setAttribute("alertMsg", "게시글에 좋아요를 눌렀습니다.");
 				return "redirect:detailMoveBd.tm?bno=" + bno;
 			} else {
 				int boardLikeChange = teamService.boardToUnLike(map);
 				session.setAttribute("alertMsg", "게시글에 좋아요를 취소했습니다.");
 				return "redirect:detailMoveBd.tm?bno=" + bno;
 			}

 		} else {
 			session.setAttribute("alertMsg", "로그인을 진행해주시길 바랍니다.");
 			return "redirect:detailMove.bd?bno=" + bno;
 		}
 	}

 	// 게시글 신고
 	@RequestMapping("boardReport.tm")
 	public String boardReport(HttpSession session, String pnContent, int boardNo, int comNo, int reporterNo, int teamNo) {
 		Member loginMember = (Member) session.getAttribute("loginMember");

 		System.out.println(pnContent + " / " + boardNo + " / " + comNo + " / " + reporterNo + "teamNo : " + teamNo);
 		if (loginMember != null) {
 			int memNo = loginMember.getMemNo();
 			
 			 String comNoValue = (comNo == 0) ? null : String.valueOf(comNo);
 		     String boardNoValue = (comNo == 0) ? String.valueOf(boardNo) : null;

 		     Map<String, String> map = new HashMap<>();
 		     map.put("pnContent", pnContent);
 		     map.put("memNo", String.valueOf(memNo));
 		     map.put("boardNo", boardNoValue);
 		     map.put("comNo", comNoValue);
 		     map.put("reporterNo", String.valueOf(reporterNo));
 		     map.put("teamNo", String.valueOf(teamNo));
 		     
 			int result1 = boardService.commentReport(map);

 			session.setAttribute("alertMsg", "신고 작성이 되었습니다.");
 			return "redirect:detailMoveBd.tm?bno=" + boardNo;

 		} else {
 			session.setAttribute("alertMsg", "로그인을 진행해주시길 바랍니다.");
 			return "redirect:detailMoveBd.tm?bno=" + boardNo;
 		}
 	}
 	
 	// 대댓글 작성
 	@RequestMapping("replyComment.tm")
 	public String replyComment(HttpSession session, int comParentNo, String pnContent, int boardNo) {
 		Member loginMember = (Member) session.getAttribute("loginMember");

 		if (loginMember != null) {
 			int memNo = loginMember.getMemNo();

 			Map<String, String> map = new HashMap<>();
 			map.put("pnContent", pnContent);
 			map.put("memNo", String.valueOf(memNo));
 			map.put("boardNo", String.valueOf(boardNo));
 			map.put("comNo", String.valueOf(comParentNo));

 			int result1 = teamService.replyComment(map);

 			return "redirect:detailMoveBd.tm?bno=" + boardNo;

 		} else {
 			session.setAttribute("alertMsg", "로그인을 진행해주시길 바랍니다.");
 			return "redirect:detailMoveBd.tm?bno=" + boardNo;
 		}
 	}
 	
 	// 구단 관리 페이지로 이동
    @GetMapping(value = "teamManagement.tm")
    public String moveTeamManagement(int tno, Model m) {
    	m.addAttribute("tno", tno);
        return "teamBoard/teamManagement";
    }
    
    // 구단 정보 수정 페이지로 이동
    @GetMapping(value = "teamModify.tm")
    public String moveTeamModify(int tno, Model m) {
    	TeamInfoDto teamInfo = teamService.teamInfo(tno);
    	System.out.println("내 구단 정보 : " + teamInfo);
    	m.addAttribute("teamInfo", teamInfo);
    	
        return "teamBoard/teamModify";
    }
    
    // 구단 멤버 관리 페이지로 이동
    @GetMapping(value = "teamMemberModify.tm")
    public String moveTeamMemberModify(int tno, Model m) {
    	ArrayList<TeamMemberDto> memberList = teamService.selectMemberList(tno);
    	
    	m.addAttribute("memberList", memberList);
        return "teamBoard/teamMemberModify";
    }
    
    // 구단 탈퇴
    @RequestMapping("teamSelfOut.tm")
    public String teamSelfOut(int tno, HttpSession session) {
    	Member loginMember = (Member) session.getAttribute("loginMember");
    	int memNo = loginMember.getMemNo();
    	
    	int teamNo = tno;
    	
    	Team team = new Team(memNo, teamNo);
    	
    	int result = teamService.teamOut(team);
 		
 		if(result > 0) {
 			session.setAttribute("alertMsg", "구단 탈퇴를 성공했습니다.");
 			return "main";
		} else {
			session.setAttribute("alertMsg", "구단 탈퇴를 실패했습니다.");
			return "main";
		}
    }
    
    // 구단 단원 강퇴
    @RequestMapping("teamOut.tm")
    public String teamOut(int memNo, int tno, HttpSession session, Model m) {
    	int teamNo = tno;
    	
    	Team team = new Team(memNo, teamNo);
    	
    	int result = teamService.teamOut(team);
 		
 		if(result > 0) {
 			session.setAttribute("alertMsg", "구단 단원의 강퇴을 성공했습니다.");
 			m.addAttribute("tno", tno);
 			return "teamBoard/teamManagement";
		} else {
			session.setAttribute("alertMsg", "구단 단원의 강퇴을 실패했습니다.");
			m.addAttribute("tno", tno);
			return "teamBoard/teamManagement";
		}
    }
    
    // 구단 수정
    @RequestMapping("teamInfoModify.tm")
    public String modifyTeam(TeamInfoDto t, MultipartFile userProfile, HttpSession session, int tno, Model model) {
        log.info("t : {}", t);
        if(t.getApplication() == null || t.getApplication().isEmpty()) {
        	t.setApplication("N");  // 체크박스가 선택되지 않으면 "N"으로 설정
        } else {
            t.setApplication("Y");  // 체크박스가 선택되면 "Y"로 설정
        }
        
        System.out.println(t.getApplication());
        
        model.addAttribute("tno", tno);
        int maxPerson = t.getTeamMaxPerson();
        
        // 인원 수 확인해서 최대 인원 수가 현재 인원수보다 낮으면 수정 실패
        int teamNum = teamService.numOfTeamPerson(tno);
        
        System.out.println("구단 인원 수 : " + teamNum);
        System.out.println("입력한 최대 인원 수 : " + maxPerson);
        
	    if (teamNum > maxPerson) {
	    	session.setAttribute("alertMsg", "최대 인원 수가 현재 인원 수보다 적습니다.");
	    	 return "redirect:boardList.tm?tno=" + tno;
	    }
        
        // 구단 프로필 이미지 처리
        Profile profile = null;
        String path = "resources/images/userProFile/";
        String savePath = session.getServletContext().getRealPath(path);
        if (!userProfile.getOriginalFilename().equals("")) {
            String changeName = Template.saveFile(userProfile, session, path);
            profile = new Profile(userProfile.getOriginalFilename(), changeName, savePath);
        }
        t.setTeamNo(tno);
        int result = teamService.modifyTeam(t, profile);
        if(result > 0 ){
            session.setAttribute("alertMsg", "구단 정보 수정이 성공적으로 완료되었습니다.");
        }else {
            session.setAttribute("alertMsg", "구단 정보 수정에 실패하였습니다. 다시 시도해주세요.");
        }
        
        return "redirect:boardList.tm?tno=" + tno;
    }
    
    /*===================================================================================================================================*/
    

    // 구단 메뉴로 이동
    @GetMapping(value = "teamMenu.tm")
    public String moveTeamMenu() {
        return "team/teamMenu";
    }

    // 구단 창설 폼으로 이동
    @GetMapping(value = "teamEnrollForm.tm")
    public String moveTeamEnrollForm() {
        return "team/teamEnrollForm";
    }
    // 단원 모집 리스트로 이동
    @GetMapping(value = "memberRecruit.tm")
    public String moveTeamRecruit(RecruitListQueryStringDto queryString, HttpServletRequest request) {
        String areaName = null;
        log.info("모집 리스트 쿼리스트링 : {}", queryString);
        // 카테고리에 해당하는 모집리스트 개수
        int RecruitListCount = teamService.selectRecruitListCount(queryString.getCategory());
        PageInfo pi = Template.getPageInfo(RecruitListCount, queryString.getPage(), 10, 10);
        // 지역 설정 all 일때 지역명 조회
        if (!queryString.getSearchArea().equals("all")) {
            areaName = teamService.selectAreaName(queryString.getSearchArea());
            log.info("지역명 : {}",areaName);
        }
        ArrayList<RecruitListDto> recruitList = teamService.selectRecruitList(queryString, pi);
        log.info("모집 리스트 개수 : {}", RecruitListCount);
        log.info("모집 리스트 : {}", recruitList);
        request.setAttribute("RecruitList", recruitList);
        request.setAttribute("category", queryString.getCategory());
        // 지역 설정이 있을 경우
        if (!queryString.getSearchArea().equals("all")) {
            request.setAttribute("searchArea", areaName);
        } else {
            request.setAttribute("searchArea", queryString.getSearchArea());
        }
        request.setAttribute("pi", pi);
        return "team/memberRecruitList";
    }

    @PostMapping(value = "create.tm")
    public String insertTeam(CreateTeamDto t, MultipartFile userProfile, HttpSession session) {
        log.info("t : {}", t);
        // 구단 프로필 이미지 처리
        Profile profile = null;
        String path = "resources/images/userProFile/";
        String savePath = session.getServletContext().getRealPath(path);
        if (!userProfile.getOriginalFilename().equals("")) {
            String changeName = Template.saveFile(userProfile, session, path);
            profile = new Profile(userProfile.getOriginalFilename(), changeName, savePath);
        }
        int result = teamService.insertTeam(t, profile);
        if(result > 0 ){
            session.setAttribute("alertMsg", "구단 창설이 성공적으로 완료되었습니다.");
        }else {
            session.setAttribute("alertMsg", "구단 창설에 실패하였습니다. 다시 시도해주세요.");
        }

        return "redirect:/";
    }

    @GetMapping(value = "recruit_detail.tm")
    public String moveRecruitDetail(int tno, HttpServletRequest request) {
        log.info("팀번호 : {}", tno);
        RecruitDetailDto detailInfo = teamService.selectRecruitDetail(tno);
        log.info("디테일 INFO : {}", detailInfo);
        request.setAttribute("detailInfo", detailInfo);
        return "team/memberRecruitDetail";
    }

    /**
     * 구단 가입 신청 API
     *
     * @param query
     * @return
     */
    @PostMapping(value = "enroll.tm")
    public String insertRecruit(RecruitDto application) {
        log.info("가입 신청 쿼리 : {}", application);
        int result = teamService.insertRecruit(application);
        return "redirect:/";
    }
    
    // 랭킹페이지
    @RequestMapping("/ranking.tm")
    public String showStadiumList() {
        return "ranking/ranking";
    }

}
