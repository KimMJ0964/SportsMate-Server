<%--
  Created by IntelliJ IDEA.
  User: jun
  Date: 2024. 11. 5.
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/loginForm.css">
    <script src="${pageContext.request.contextPath}/resources/js/member/loginForm.js"></script>
    <title>SportsMate - 로그인</title>
</head>
<body>
    <div class="wrap">
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        <div id="login-wrap">
            <form action="login.me" class="login-form" method="post">
                <div class="email-wrap">
                    <span class="form-title">이메일</span> <br>
                    <input type="email" name="memEmail" placeholder="이메일을 입력해주세요." value="${cookie.saveId.value}">
                </div>
                <div class="pwd-wrap">
                    <span class="form-title">비밀번호</span><br>
                    <input type="password" name="memPwd" placeholder="비밀번호를 입력해주세요.">
                </div>
                <input type="checkbox" name="saveId" id="saveId" checked> 이메일 저장
                <div class="submit-btn">
                    <button type="submit">로그인</button>
                </div>
                <div class="find-info-wrap">
                    <div class="find-info">
                        <a href="searchInfo.me">아이디/비밀번호 찾기</a>
                    </div>
                    <div class="enroll-member">
                        <a href="enrollSelect.me">회원가입</a>
                    </div>
                </div>
                <div class="split-bar"></div>
                <div class="submit-btn">
                    <button type="button" class="sns-login-btn" onclick="naverLogin('${naverClientId}')">
                        <img src="${pageContext.request.contextPath}/resources/images/Naver_login.png" class="sns-login-img" alt="">
                    </button>
                </div>
                <div class="submit-btn">
                    <button type="button" class="sns-login-btn" onclick="kakaoLogin('${kakaoClientId}')">
                        <img src="${pageContext.request.contextPath}/resources/images/kakao_login.png" class="sns-login-img" alt="">
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
