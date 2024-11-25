package com.kh.sportsmate.common.intercepter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.sportsmate.board.service.BoardService;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.team.service.TeamService;

@Component
public class BoardInterceptor implements HandlerInterceptor {
	private BoardService boardService;

	@Autowired
	public BoardInterceptor(BoardService boardService) {
		this.boardService = boardService;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String bno = request.getParameter("bno");

		if (session.getAttribute("loginMember") != null) {
			Member loginMember = (Member) session.getAttribute("loginMember");
			int memNo = loginMember.getMemNo();

			Map<String, String> map = new HashMap<>();
			map.put("bno", bno);
			map.put("memNo", String.valueOf(memNo));

			Integer result = boardService.checkBoardMember(map);

			if (result == null || result == 0) {
	            session.setAttribute("alertMsg", "권한이 없습니다.");
	            response.sendRedirect(request.getContextPath() + "/loginForm.me");
	            return false; // 추가: 더 이상 후속 처리하지 않음
	        } else {
	            return true; // 구단에 속하는 경우
	        }
		} else {
			session.setAttribute("alertMsg", "로그인후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
