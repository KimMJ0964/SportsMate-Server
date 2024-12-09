package com.kh.sportsmate.common.intercepter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.team.service.TeamService;

public class TeamLeaderInterceptor implements HandlerInterceptor{
	
	private TeamService teamService;

	@Autowired
	public TeamLeaderInterceptor(TeamService teamService) {
		this.teamService = teamService;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String tno = request.getParameter("tno");
		int tnoInt = Integer.parseInt(tno);

		if (session.getAttribute("loginMember") != null) {
			Member loginMember = (Member) session.getAttribute("loginMember");
			int memNo = loginMember.getMemNo();
			
			int result = teamService.leaderNo(tnoInt);

			System.out.println("구단장 번호 : " + tnoInt+ " / 내 번호 : " + memNo);

			if (result != memNo) {
	            session.setAttribute("alertMsg", "해당 구단의 구단장이 아닙니다.");
	            response.sendRedirect(request.getContextPath() + "/myPageInfo.mp");
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
