<%--
  Created by IntelliJ IDEA.
  User: jun
  Date: 2024. 11. 21.
  Time: 09:30
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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/searchInfoForm.css">
    <script src="${pageContext.request.contextPath}/resources/js/member/searchInfoForm.js"></script>
    <title>SportsMate - 아이디 & 비밀번호 찾기</title>
</head>
<body>
    <div class="wrap">
        <jsp:include page="../common/header.jsp"/>
        <br>
        <div id="enroll-wrap">
            <div class="title">아이디 찾기</div>
            <form action="searchId.me" class="enroll-form" method="post">
                <div class="input-wrap">
                    <span class="form-title">이름</span><br>
                    <input type="text" name="memName" placeholder="이름을 입력해주세요." required>
                </div>
                <div class="input-wrap">
                    <span class="form-title">생년월일</span><br>
                    <div class="birth-wrap">
                        <div class="year-wrap">
                            <select name="year" id="year" required="required"></select>
                        </div>
                        <div class="month-wrap">
                            <select name="month" id="month" required="required"></select>
                        </div>
                        <div class="day-wrap">
                            <select name="day" id="day" required="required"></select>
                        </div>
                    </div>
                </div>
                <div class="submit-btn">
                    <button type="submit" class="submit-btn" >아이디 찾기</button>
                </div>
            </form>
            <div class="split-bar"></div>
            <div class="title">비밀번호 찾기</div>
            <form action="searchPwd.me" class="enroll-form" method="post">
                <div class="input-wrap">
                    <span class="form-title">이메일</span><br>
                    <input type="email" name="memEmail" placeholder="이메일을 입력해주세요." required>
                </div>
                <div class="input-wrap">
                    <span class="form-title">이름</span><br>
                    <input type="text" name="memName" placeholder="이름을 입력해주세요." required>
                </div>
                <div class="submit-btn">
                    <button type="submit" class="submit-btn">비밀번호 찾기</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
