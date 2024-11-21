<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/calendar_header.css">
</head>
<body>
    <div class="wrapper">
        <header>
            <div class="nav">
                <button id="prev-button"> < </button>
                <p class="current-date" id="current-date"></p>
                <button id="next-button"> > </button>
            </div>
        </header>
        <div class="calendar">
            <ul class="weeks">
                <li style="color: red;">일</li>
                <li>월</li>
                <li>화</li>
                <li>수</li>
                <li>목</li>
                <li>금</li>
                <li style="color: blue;">토</li>
            </ul>
            <ul class="days" id="days"></ul>
        </div>
    </div>
<script src="${pageContext.request.contextPath}/resources/js/calendar/calendar_header.js"></script>
</body>
</html>