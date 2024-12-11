package com.kh.sportsmate.common.intercepter;

import com.kh.sportsmate.member.model.vo.Member;
import lombok.extern.slf4j.Slf4j;
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
@Slf4j
@Component
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if(session.getAttribute("loginMember")!= null){
            Member member = (Member) session.getAttribute("loginMember");
            log.info("Login Session found : {}",member);
            return true;
        }else{
            log.warn("로그인 멤버 존재 X");
            session.setAttribute("alertMsg","로그인후 이용가능한 서비스입니다.");
            response.sendRedirect(request.getContextPath() + "/loginForm.me");
            return false;
        }
    }
}
