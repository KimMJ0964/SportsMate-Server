package com.kh.sportsmate.common.intercepter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.team.model.vo.TeamBoard;
import com.kh.sportsmate.team.service.TeamService;

@Component
public class TeamBoardInterceptor implements HandlerInterceptor {
	private TeamService teamService;

	@Autowired
	public TeamBoardInterceptor(TeamService teamService) {
		this.teamService = teamService;
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		int bno = Integer.parseInt(request.getParameter("bno"));

		if (session.getAttribute("loginMember") != null) {
			Member loginMember = (Member) session.getAttribute("loginMember");
			int memNo = loginMember.getMemNo();

			System.out.println("본인의 번호 : " + memNo + "구단 번호 : " + bno);
			
			Map<String, Integer> map = new HashMap<>();
			
			map.put("bno", bno);
			map.put("memNo", memNo);
			
			String result = teamService.checkTeamBoard(map);

			if (result == null) {
				session.setAttribute("alertMsg", "해당 구단의 인원이 아닙니다.");
	            response.sendRedirect(request.getContextPath() + "/myPageInfo.mp");
	            return false; // 추가: 더 이상 후속 처리하지 않음
			} else {
				return true;
			}

		} else {
			session.setAttribute("alertMsg", "로그인후 이용가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath() + "/loginForm.me");
		}
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
