package com.kh.sportsmate.common.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.sportsmate.member.model.vo.Member;
import com.kh.sportsmate.team.service.TeamService;

@Component
public class TeamBoardTwoInterceptor implements HandlerInterceptor {
	private TeamService teamService;
	
	@Autowired
	public TeamBoardTwoInterceptor(TeamService teamService) {
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
	        int result = teamService.checkBoardMember(bno);

	        System.out.println("사용자 번호 : " + memNo + ", 게시글 번호 : " + result);
	        
	        if (memNo != result) {
	            session.setAttribute("alertMsg", "권한이 없습니다.");
	            // 응답이 커밋되지 않은 경우에만 리다이렉트
	            if (!response.isCommitted()) {
	                response.sendRedirect(request.getContextPath() + "/loginForm.me");
	            }
	            return false; // 후속 처리 중지
	        } else {
	            return true; // 구단에 속하는 경우
	        }
	    } else {
	        session.setAttribute("alertMsg", "로그인후 이용가능한 서비스입니다.");
	        // 응답이 커밋되지 않은 경우에만 리다이렉트
	        if (!response.isCommitted()) {
	            response.sendRedirect(request.getContextPath() + "/loginForm.me");
	        }
	    }
	    return HandlerInterceptor.super.preHandle(request, response, handler);
	}
}
