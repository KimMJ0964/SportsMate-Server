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
    <title>SportsMate - 로그인</title>
</head>
<body>
    <div class="wrap">
        <div id="login-wrap">
            <form action="login.me" class="login-form">
                <div class="email-wrap">
                    <span class="form-title">이메일</span> <br>
                    <input type="email" name="email" placeholder="이메일을 입력해주세요.">
                </div>
                <div class="pwd-wrap">
                    <span class="form-title">비밀번호</span><br>
                    <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요.">
                </div>
                <input type="checkbox" name="saveId" id="saveId"> 이메일 저장
                <div class="submit-btn">
                    <button type="submit">로그인</button>
                </div>
                <div class="find-info-wrap">
                    <div class="find-info">
                        <a href="#">아이디/비밀번호 찾기</a>
                    </div>
                    <div class="enroll-member">
                        <a href="enrollSelect.me">회원가입</a>
                    </div>
                </div>
                <div class="split-bar"></div>
            </form>
        </div>
    </div>
</body>
</html>
