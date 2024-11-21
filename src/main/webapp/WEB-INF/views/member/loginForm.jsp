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
                        <a href="#">아이디/비밀번호 찾기</a>
                    </div>
                    <div class="enroll-member">
                        <a href="enrollSelect.me">회원가입</a>
                    </div>
                </div>
                <div class="split-bar"></div>
                <div class="submit-btn">
                    <button type="button" class="sns-login-btn" onclick="naverLogin()"><img src="${pageContext.request.contextPath}/resources/images/Naver_login.png" class="sns-login-img" alt=""></button>
                </div>
                <script>
                    function naverLogin() {
                        const clientId = "5GKM2LrZ_OEPzmwL6z66";
                        const redirectURI = encodeURIComponent("http://localhost:7777/SportsMate/naver-login"); // redirectURL을 UTF-8로 인코딩하여 저장

                        // 랜덤한 수 2개를 넣어줘야한다. (36진수로 변환 후 2개 뽑는다.)
                        const state = Math.random().toString(36).substring(2);
                        let apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
                        apiURL += "&client_id=" + clientId;
                        apiURL += "&redirect_uri=" + redirectURI;
                        apiURL += "&state=" + state;

                        location.href = apiURL;
                    }
                </script>
            </form>
        </div>
    </div>
</body>
</html>
