package com.kh.sportsmate.common.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.sportsmate.member.model.vo.Member;

@Component
public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		Member m = (Member) session.getAttribute("loginMember");
        if(m != null){
            if(m.getMemStatus().equals("A")) {
            	return true;
            } else {
            	session.setAttribute("alertMsg","사이트 관리자만 이용가능한 서비스입니다.");
            	response.sendRedirect(request.getContextPath());
            }
        }else{
            session.setAttribute("alertMsg","로그인 후 이용가능한 서비스입니다.");
            response.sendRedirect(request.getContextPath() + "/loginForm.me");
        }
        
		return false;
	}

}
