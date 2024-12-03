package com.kh.sportsmate.common.intercepter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.sportsmate.board.service.BoardService;
import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.team.model.dao.TeamDao;
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
		int tno = Integer.parseInt(request.getParameter("tno"));

		if (session.getAttribute("loginMember") != null) {
			Member loginMember = (Member) session.getAttribute("loginMember");
			int memNo = loginMember.getMemNo();

			System.out.println("본인의 번호 : " + memNo + "구단 번호 : " + tno);
			
			Map<String, Integer> map = new HashMap<>();
			
			map.put("tno", tno);
			map.put("memNo", memNo);
			
			int result = teamService.checkTeamMember(map);

			if (result < 1) {
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
