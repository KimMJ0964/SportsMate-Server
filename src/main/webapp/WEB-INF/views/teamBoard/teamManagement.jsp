<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구단 관리 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/team/teamMenu.css">
</head>
<body data-context-path="${pageContext.request.contextPath}">
    <div class="wrap">
        <jsp:include page="../common/header.jsp"/>
        <br>
        <jsp:include page="../common/nav.jsp"/>
        <div class="list-wrap">
            <div id="title" class="menu-title">구단 관리</div>
        </div>
        <div class="select-wrap">
            <div class="btn-wrap">
                <div class="btn-title">구단 정보 수정</div>
                <div class="user" onclick="location.href = 'teamModify.tm?tno=${tno}'">
                    <img src="${pageContext.request.contextPath}/resources/images/club_memberModify.png" alt="">
                </div>
            </div>
            <div class="btn-wrap">
                <div class="btn-title">구단 단원 관리</div>
                <div class="manager" onclick="location.href = 'teamMemberModify.tm?tno=${tno}'">
                    <img src="${pageContext.request.contextPath}/resources/images/club_modify.png" alt="">
                </div>
            </div>
        </div>
        <jsp:include page="../common/footer.jsp"/>
    </div>
</body>
</html>