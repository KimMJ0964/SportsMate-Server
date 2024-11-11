package com.kh.sportsmate.team.controller;

import java.util.ArrayList;

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
		public String enrollForm() {
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
		public String insertBoard(TeamBoard b, HttpSession session, Model m) {
			System.out.println(b);
			int result = teamService.createBoard(b);
			
			if(result > 0) { //성공
				session.setAttribute("alertMsg", "게시글 작성 성공");
				return "redirect:boardList.tm";
			} else { //실패
				System.out.println("일반 게시글 생성 실패");
				m.addAttribute("errorMsg", "게시글 작성 실패");
				return "main";
			}
			
		}
}
