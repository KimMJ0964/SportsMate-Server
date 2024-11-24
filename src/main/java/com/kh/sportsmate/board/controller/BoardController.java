package com.kh.sportsmate.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.sportsmate.Attachment.model.vo.Profile;
import com.kh.sportsmate.board.model.dto.BoardMemberPanalty;
import com.kh.sportsmate.board.model.dto.CommentInfo;
import com.kh.sportsmate.board.model.vo.Board;
import com.kh.sportsmate.board.model.vo.BoardComment;
import com.kh.sportsmate.board.model.vo.BoardFile;
import com.kh.sportsmate.board.model.vo.BoardLike;
import com.kh.sportsmate.common.template.Template;
import com.kh.sportsmate.common.vo.PageInfo;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.member.model.vo.ProfileFile;
import com.kh.sportsmate.board.service.BoardService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

@CrossOrigin
@Controller
public class BoardController {

	private final BoardService boardService;

	@Autowired
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}

	/**
     * 게시글 목록 페이지 : 게시글, 페이지네이션
     *
     * @param cpage (defaultValue= 1) 페이지
     * @param currentPage
     * @param model
     * @return
     */
	@RequestMapping("boardList.bd")
	public String selectList(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model model) {
		int boardCount = boardService.selectListCount();

		PageInfo pi = Template.getPageInfo(boardCount, currentPage, 10, 10);
		ArrayList<Board> list = boardService.selectList(pi);

		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		return "board/board";
	}

	/**
     * 게시글 생성 페이지 이동
     *
     * @return
     */
	@RequestMapping("createMove.bd")
	public String enrollForm() {
		return "board/boardCreate";
	}

	/**
     * 게시글 상세 페이지로 이동
     *
     * @param bno
     * @param model
     * @param session
     * @return
     */
	@RequestMapping("detailMove.bd")
	public String detailList(int bno, Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		Board board = boardService.detailList(bno);
		ArrayList<CommentInfo> comment = boardService.commentList(bno);
		int commentCount = boardService.commentCount(bno);
		int boardViewAdd = boardService.viewAdd(bno);
		int likeCount = boardService.likeCount(bno);
		BoardFile bf = boardService.filedownloadLink(bno);
		
		if(bf != null) {
			String downloadLink = bf.getFilePath() + bf.getChangeName();
			model.addAttribute("downloadLink", downloadLink);
		}
		
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("commentCount", commentCount);
		model.addAttribute("comment", comment);
		model.addAttribute("board", board);
		model.addAttribute("loginMember", loginMember);
		return "board/boardDetail";
	}

	/**
     * 게시글 수정 페이지로 이동
     *
     * @param bno
     * @param model
     * @param session
     * @return
     */
	@RequestMapping("modifyMove.bd")
	public String mdBoardSelect(int mpage, Model model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		if (loginMember == null ) {
			session.setAttribute("alertMsg", "로그인을 진행해주시길 바랍니다.");
			return "boardList.bd";
		}
		
		int memNo = loginMember.getMemNo();
		Board board = boardService.detailList(mpage);

		if (board.getMemNo() != memNo) {
			session.setAttribute("alertMsg", "권한이 없습니다.");
			return "boardList.bd";
		}

		model.addAttribute("board", board);
		return "board/boardModify";
	}

	/**
     * 게시글 생성
     *
     * @param b (제목, 내용, 종류)
     * @param fileUpload
     * @param session
     * @param m
     * @return
     */
	@PostMapping("create.bd")
	public String insertBoard(Board b, MultipartFile fileUpload, HttpSession session, Model m) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		int memNo = loginMember.getMemNo();
		BoardFile bf;

		b.setMemNo(memNo);
		int boardNo = boardService.createBoard(b);
		System.out.println("게시글 생성" + boardNo);
		if (boardNo > 0) { // 성공
			
			String path = "resources/images/boardFile/";
	        String filePath = session.getServletContext().getRealPath(path);
	        if (!fileUpload.getOriginalFilename().equals("")) {
	            String changeName = Template.saveFile(fileUpload, session, path);
	            bf = new BoardFile(b.getBoardNo(), fileUpload.getOriginalFilename(), changeName, path);
	            
	            int result2 = boardService.saveBoardFile(bf);
	        }
			
			session.setAttribute("alertMsg", "게시글 작성 성공");
			return "redirect:boardList.bd";
		} else { // 실패
			System.out.println("일반 게시글 생성 실패");
			m.addAttribute("errorMsg", "게시글 작성 실패");
			return "main";
		}

	}

	/**
     * 게시글 수정
     *
     * @param b (제목, 내용, 종류)
     * @param fileUpload
     * @param model
     * @param session
     * @param m
     * @param bno
     * @return
     */
	@PostMapping("modify.bd")
	public String updateBoard(Board b, MultipartFile fileUpload, HttpSession session, Model m, int bno) {
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
		
		int result = boardService.updateBoard(b);

		if (result > 0) { // 성공
			session.setAttribute("alertMsg", "게시글 작성 성공");
			return "redirect:boardList.bd";
		} else { // 실패
			System.out.println("일반 게시글 생성 실패");
			m.addAttribute("errorMsg", "게시글 작성 실패");
			return "main";
		}

	}

	/**
     * 게시글 삭제
     *
     * @param session
     * @param m
     * @param bno
     * @return
     */
	@RequestMapping("delete.bd")
	public String deleteBoard(Model m, HttpSession session, int bno) {
		System.out.println(bno);
		int result = boardService.deleteBoard(bno);
		if (result > 0) { // 성공
			session.setAttribute("alertMsg", "게시글 삭제 성공");
			return "redirect:boardList.bd";
		} else { // 실패
			System.out.println("일반 게시글 생성 실패");
			m.addAttribute("errorMsg", "게시글 삭제 실패");
			return "main";
		}
	}

	/**
     * 게시글 검색
     *
     * @param cpage (defaultValue = 1)
     * @param m
     * @param currentPage
     * @return
     */
	@RequestMapping("search.bd")
	public String searchBoard(@RequestParam(value = "cpage", defaultValue = "1") int currentPage, Model m,
			String category, String keyword) {
		int boardCount = boardService.selectListCount();
		PageInfo pi = Template.getPageInfo(boardCount, currentPage, 10, 10);

		Map<String, String> map = new HashMap<>();
		map.put("category", category);
		map.put("keyword", keyword);
		ArrayList<Board> list = boardService.searchBoard(pi, map);

		m.addAttribute("list", list);
		m.addAttribute("pi", pi);

		return "board/board";
	}

	/**
     * 댓글 작성
     *
     * @param content
     * @param session
     * @param m
     * @param bno
     * @return
     */
	@RequestMapping("writeReply.bd")
	public String writeReply(int bno, String content, Model m, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		if (loginMember == null ) {
			session.setAttribute("alertMsg", "로그인을 진행해주시길 바랍니다.");
			return "redirect:detailMove.bd?bno=" + bno;
		}
		
		int memNo = loginMember.getMemNo();
		
		
		Map<String, String> map = new HashMap<>();
		map.put("bno", String.valueOf(bno));
		map.put("memNo", String.valueOf(memNo));
		map.put("content", content);

		int result = boardService.writeReply(map);

		if (result > 0) { // 성공
			return "redirect:detailMove.bd?bno=" + bno;
		} else { // 실패
			m.addAttribute("errorMsg", "댓글 작성 실패");
			return "redirect:detailMove.bd?bno=" + bno;
		}
	}

	/**
     * 댓글 삭제
     *
     * @param cno
     * @param session
     * @param m
     * @param bno
     * @return
     */
	@RequestMapping("deleteComm.bd")
	public String deleteReply(HttpSession session, int cno, int bno, Model m) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		if (loginMember == null ) {
			session.setAttribute("alertMsg", "로그인을 진행해주시길 바랍니다.");
			return "redirect:detailMove.bd?bno=" + bno;
		}
		
		int memNo = loginMember.getMemNo();

		BoardComment comment = boardService.getCommentById(cno);

		if (comment != null && comment.getMemNo() != memNo) {
			session.setAttribute("alertMsg", "권한이 없습니다.");
			return "redirect:detailMove.bd?bno=" + bno;
		}

		int result = boardService.deleteReply(cno);

		if (result > 0) { // 성공
			return "redirect:detailMove.bd?bno=" + bno;
		} else { // 실패
			m.addAttribute("errorMsg", "댓글 작성 실패");
			return "redirect:detailMove.bd?bno=" + bno;
		}
	}

	/**
     * 좋아요 버튼 클릭
     *
     * @param session
     * @param bno
     * @return
     */
	@RequestMapping("boardLike.bd")
	public String boardLike(HttpSession session, int bno) {
		Member loginMember = (Member) session.getAttribute("loginMember");

		if (loginMember != null) {
			int memNo = loginMember.getMemNo();

			Map<String, Integer> map = new HashMap<>();

			map.put("memNo", memNo);
			map.put("bno", bno);

			BoardLike board = boardService.boardIsLike(map);

			if (board == null) {
				int boardLI = boardService.boardInsertLike(map);
				session.setAttribute("alertMsg", "게시글에 좋아요를 눌렀습니다.");
				return "redirect:detailMove.bd?bno=" + bno;
			} else if (board.getStatus().equals("N")) {
				int boardLikeChange = boardService.boardToLike(map);
				session.setAttribute("alertMsg", "게시글에 좋아요를 눌렀습니다.");
				return "redirect:detailMove.bd?bno=" + bno;
			} else {
				int boardLikeChange = boardService.boardToUnLike(map);
				session.setAttribute("alertMsg", "게시글에 좋아요를 취소했습니다.");
				return "redirect:detailMove.bd?bno=" + bno;
			}

		} else {
			session.setAttribute("alertMsg", "로그인을 진행해주시길 바랍니다.");
			return "redirect:detailMove.bd?bno=" + bno;
		}
	}

	/**
     * 게시글 신고
     *
     * @param session
     * @param m
     * @param pnContent
     * @param boardNo
     * @param comNo
     * @param reporterNo
     * @return
     */
	@RequestMapping("boardReport.bd")
	public String boardReport(HttpSession session, String pnContent, int boardNo, int comNo, int reporterNo) {
		Member loginMember = (Member) session.getAttribute("loginMember");

		System.out.println(pnContent + " / " + boardNo + " / " + comNo + " / " + reporterNo);
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

			int result1 = boardService.commentReport(map);

			session.setAttribute("alertMsg", "신고 작성이 되었습니다.");
			return "redirect:detailMove.bd?bno=" + boardNo;

		} else {
			session.setAttribute("alertMsg", "로그인을 진행해주시길 바랍니다.");
			return "redirect:detailMove.bd?bno=" + boardNo;
		}
	}
	
	/**
     * 대댓글 작성
     *
     * @param content
     * @param session
     * @param pnContent
     * @param bno
     * @return
     */
	@RequestMapping("replyComment.bd")
	public String replyComment(HttpSession session, int comParentNo, String pnContent, int boardNo) {
		Member loginMember = (Member) session.getAttribute("loginMember");

		if (loginMember != null) {
			int memNo = loginMember.getMemNo();

			Map<String, String> map = new HashMap<>();
			map.put("pnContent", pnContent);
			map.put("memNo", String.valueOf(memNo));
			map.put("boardNo", String.valueOf(boardNo));
			map.put("comNo", String.valueOf(comParentNo));

			int result1 = boardService.replyComment(map);

			return "redirect:detailMove.bd?bno=" + boardNo;

		} else {
			session.setAttribute("alertMsg", "로그인을 진행해주시길 바랍니다.");
			return "redirect:detailMove.bd?bno=" + boardNo;
		}
	}
	
	/**
     * summernote ajax 요청
     *
     * @param fileList
     * @param session
     * @return
     */
	@ResponseBody
	@PostMapping("uploadFileSum.bd")
	public String upload(List<MultipartFile> fileList, HttpSession session) {
		System.out.println(fileList);
		
		List<String> changeNameList = new ArrayList<>();
		for(MultipartFile f : fileList) {
			changeNameList.add( Template.saveFile(f, session, "/resources/images/boardFile/"));
			System.out.println("썸머노트 : " + changeNameList);
		}
		
		return new Gson().toJson(changeNameList);
	}
}
