<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구단 멤버 관리 페이지</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"
	integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4="
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/team/memberRecruitList.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/team/memberRecruitList.css">
<style>
	.team-delete-wrap {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    height: 100%;
	}
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp" />
		<br>
		<jsp:include page="../common/nav.jsp" />
		<div class="recruit-list-wrap">
			<div id="title">단원모집</div>

			<div class="list-wrap">
				<c:forEach var="ml" items="${memberList}">
					<div class="content-wrap">
						<div class="team-logo-wrap">
							<img src="${pageContext.request.contextPath}/resources/images/user_default_profile.png" alt="">
						</div>
						<div class="team-info-wrap">
							<p id="team-name">${ml.memName }</p>
							<p class="memberCount">${ml.position } / ${ml.ability }</p>
							<p><img src="${pageContext.request.contextPath}/resources/images/birth.png" alt="" style="width: 30px;">${ml.memBirth }</p>
						</div>
						<div class="team-delete-wrap" onclick="history.back()">
							<img class="team-delete-wrap-img" src="${pageContext.request.contextPath}/resources/images/teamX.png" alt="" style="width: 35px;">
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />

	</div>
</body>
</html>