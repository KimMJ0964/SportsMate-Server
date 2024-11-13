package com.kh.sportsmate.team.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.sportsmate.board.model.vo.Board;
import com.kh.sportsmate.board.model.vo.BoardComment;
import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.service.BoardService;
import com.kh.sportsmate.service.TeamService;
import com.kh.sportsmate.team.model.vo.Team;
import com.kh.sportsmate.team.model.vo.TeamBoard;
import com.kh.sportsmate.team.model.vo.TeamBoardComment;
import com.kh.sportsmate.team.model.vo.TeamMember;

@CrossOrigin
@Controller
public class TeamController {

	private final TeamService teamService;
	
	@Autowired
	public TeamController(TeamService teamService) {
		this.teamService = teamService;
	}
	
	// 구단 메인 페이지 : 게시글, 페이지네이션, 팀원 목록
	@RequestMapping("boardList.tm")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model, int tno) {
		// 임의의 팀 번호 값

		
		System.out.println(tno + "번 구단 미니 홈피");
		int boardCount = teamService.selectListCount(tno);
		
		PageInfo pi = Template.getPageInfo(boardCount, currentPage, 10, 10);
		ArrayList<TeamBoard> list = teamService.selectList(pi, tno);
		ArrayList<TeamMember> memberList = teamService.selectMemberList(tno);
		
		for (TeamMember teamMember : memberList) {
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
		public String detailList(int bno, Model model) {
			TeamBoard teamBoard = teamService.detailList(bno);
			ArrayList<TeamBoardComment> comment = teamService.commentList(bno); 
			int commentCount = teamService.commentCount(bno);
			
			
			model.addAttribute("commentCount", commentCount);
			model.addAttribute("comment", comment);
			model.addAttribute("teamBoard", teamBoard);
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
		public String insertBoard(TeamBoard b, HttpSession session, Model m, int tno) {
			b.setTeamNo(tno);
			int result = teamService.createBoard(b);
			
			if(result > 0) { //성공
				session.setAttribute("alertMsg", "게시글 작성 성공");
				return "redirect:boardList.tm?tno=" + tno;
			} else { //실패
				System.out.println("일반 게시글 생성 실패");
				m.addAttribute("errorMsg", "게시글 작성 실패");
				return "main";
			}
			
		}
		
		// 게시글 수정
		@PostMapping("modify.tm")
		public String updateBoard(TeamBoard b, HttpSession session, Model m, int bno, int tno) {
			b.setBoardNo(bno);
			System.out.println(b);
			int result = teamService.updateBoard(b);
					
			if(result > 0) { //성공
				session.setAttribute("alertMsg", "게시글 작성 성공");
				return "redirect:boardList.tm?tno=" + tno;
			} else { //실패
				System.out.println("일반 게시글 생성 실패");
				m.addAttribute("errorMsg", "게시글 작성 실패");
				return "main";
			}
					
		}
				
		// 게시글 삭제
		@RequestMapping("delete.tm")
		public String deleteBoard(Model m, HttpSession session, int bno, int tno) {
			System.out.println(bno);
			int result = teamService.deleteBoard(bno);
			if(result > 0) { //성공
				session.setAttribute("alertMsg", "게시글 삭제 성공");
				return "redirect:boardList.tm?tno=" + tno;
			} else { //실패
				System.out.println("일반 게시글 생성 실패");
				m.addAttribute("errorMsg", "게시글 삭제 실패");
				return "main";
			}
		}
		
		// 구단 입단 신청 허락
		@RequestMapping("approveJoin.tm")
		public String approveJoin(Model m, HttpSession session, int mno, int tno) {
			Map<String, Integer> nos = new HashMap<>();
			nos.put("mno", mno);
			nos.put("tno", tno);
			
			int result = teamService.approveJoin(nos);
			    
			if(result > 0) { //성공
				session.setAttribute("alertMsg", "입단 성공");
				return "redirect:myPageInfo.mp";
			} else { //실패
				m.addAttribute("errorMsg", "입단 실패");
				return "redirect:myPageInfo.mp";
			} 
		}
		
		// 구단 입단 신청 거절
		@RequestMapping("rejectJoin.tm")
		public String rejectJoin(Model m, HttpSession session, int mno) {
			int result = teamService.rejectJoin(mno);
			if(result > 0) { //성공
				session.setAttribute("alertMsg", "입단 거부 성공");
				return "redirect:myPageInfo.mp";
			} else { //실패
				m.addAttribute("errorMsg", "입단 거부 실패");
				return "redirect:myPageInfo.mp";
			} 
		}
		
		// 게시글 검색
		@RequestMapping("searchBoard.tm")
		public String searchBoard(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model m, String category, String keyword, int tno) {
			System.out.println(category + "/" + keyword + "/" + tno);
			int boardCount = teamService.selectListCount(tno);
			PageInfo pi = Template.getPageInfo(boardCount, currentPage, 10, 10);
					
			Map<String, String> map = new HashMap<>();
			map.put("category", category);
			map.put("keyword", keyword);
			map.put("tno", String.valueOf(tno));
			ArrayList<TeamBoard> list = teamService.searchBoard(pi, map);
			ArrayList<TeamMember> memberList = teamService.selectMemberList(tno);
					
			m.addAttribute("list", list);
			m.addAttribute("pi", pi);
			m.addAttribute("memberList", memberList);
			m.addAttribute("tno", tno);
			
			return "teamBoard/teamHome";
		}
}






