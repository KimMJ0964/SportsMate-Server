package com.kh.sportsmate.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.sportsmate.board.model.vo.Board;
import com.kh.sportsmate.board.model.vo.BoardComment;
import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.service.BoardService;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@CrossOrigin
@Controller
public class BoardController {

	private final BoardService boardService;
	
	@Autowired
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}
	
	// 게시글 목록 페이지 : 게시글, 페이지네이션
	@RequestMapping("boardList.bd")
	public String selectList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Model model) {
		int boardCount = boardService.selectListCount();
		
		PageInfo pi = Template.getPageInfo(boardCount, currentPage, 10, 10);
		ArrayList<Board> list = boardService.selectList(pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "board/board";
	}
	
	// 게시글 생성 페이지 이동
	@RequestMapping("createMove.bd")
	public String enrollForm() {
		return "board/boardCreate";
	}
	
	// 게시글 상세 페이지로 이동
	@RequestMapping("detailMove.bd")
	public String detailList(int bno, Model model) {
		Board board = boardService.detailList(bno);
		ArrayList<BoardComment> comment = boardService.commentList(bno); 
		int commentCount = boardService.commentCount(bno);
		
		
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("comment", comment);
		model.addAttribute("board", board);
		return "board/boardDetail";
	}
	
	// 게시글 수정 페이지로 이동
	@RequestMapping("modifyMove.bd")
	public String mdBoardSelect(int mpage, Model model) {
		Board board = boardService.detailList(mpage);
		
		model.addAttribute("board", board);
		return "board/boardModify";
	}
	
	// 게시글 생성
	@PostMapping("create.bd")
	public String insertBoard(Board b, HttpSession session, Model m) {
		System.out.println(b);
		int result = boardService.createBoard(b);
		
		if(result > 0) { //성공
			session.setAttribute("alertMsg", "게시글 작성 성공");
			return "redirect:boardList.bd";
		} else { //실패
			System.out.println("일반 게시글 생성 실패");
			m.addAttribute("errorMsg", "게시글 작성 실패");
			return "main";
		}
		
	}
	
	// 게시글 수정
		@PostMapping("modify.bd")
		public String updateBoard(Board b, HttpSession session, Model m, int bno) {
			System.out.println(b);
			int result = boardService.updateBoard(b, bno);
			
			if(result > 0) { //성공
				session.setAttribute("alertMsg", "게시글 작성 성공");
				return "redirect:boardList.bd";
			} else { //실패
				System.out.println("일반 게시글 생성 실패");
				m.addAttribute("errorMsg", "게시글 작성 실패");
				return "main";
			}
			
		}
}
