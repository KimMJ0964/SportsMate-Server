<%--
  Created by IntelliJ IDEA.
  User: jun
  Date: 2024. 11. 21.
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/searchResult.css">
    <script src="${pageContext.request.contextPath}/resources/js/member/searchResult.js"></script>
    <title>SportsMate</title>
</head>
<body>
    <div class="wrap">
        <jsp:include page="../common/header.jsp"/>
        <br>
        <jsp:include page="../common/nav.jsp"/>
        <br>
        <div class="content-container">
            <div id="result-header">
                <div>${resultHeader}</div>
            </div>
            <div id="result-body">
                <div>${description}</div>
                <div>${body}</div>
            </div>
            <div id="result-footer">
                    <button type="button" class="move-btn" onclick="location.href= 'searchInfo.me'">비밀번호 찾기</button>
                    <button type="button" class="move-btn" onclick="location.href= 'loginForm.me'">로그인</button>
            </div>
        </div>
    </div>
</body>
</html>
