package com.kh.sportsmate.common.intercepter;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * packageName    : com.kh.sportsmate.common.intercepter
 * fileName       : loginIntercepter
 * author         : jun
 * date           : 2024. 11. 17.
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2024. 11. 17.        jun       최초 생성
 */
@Component
public class loginIntercepter implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if(session.getAttribute("loginMember")!= null){
            return true;
        }else{
            session.setAttribute("alertMsg","로그인후 이용가능한 서비스입니다.");
            response.sendRedirect(request.getContextPath() + "/loginForm.me");
//            return false;
        }
        return HandlerInterceptor.super.preHandle(request, response, handler);
    }
}
