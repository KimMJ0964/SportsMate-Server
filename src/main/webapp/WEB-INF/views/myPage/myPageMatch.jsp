<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 내 전적</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/myPage/myMatch.css?after">
<link href="resources/css/teamBoard/teamMatch.css" rel="stylesheet">
<link href="resources/css/board/board.css" rel="stylesheet">
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<br>
		<jsp:include page="/WEB-INF/views/common/nav.jsp" />
		<br>
		<div class="myMatch">
			<div class="myMatch-title">
				<h2>
					<b>내 전적</b>
				</h2>
			</div>

			<div class="myMatch-categorySelect">
				<div class="sport-button-container">
					<button class="sport-btn active" data-category="soccer">축구</button>
					<button class="sport-btn" data-category="futsal">풋살</button>
					<button class="sport-btn" data-category="baseball">야구</button>
					<button class="sport-btn" data-category="basketball">농구</button>
				</div>
			</div>

			<div class="myMatchRecord">
				<table class="team-match-matchedRecord">
					<thead style="text-align: center;">
						<tr>
							<th>포인트</th>
							<th>내 구단</th>
							<th>점수</th>
							<th></th>
							<th>점수</th>
							<th>상대 구단</th>
							<th>포인트</th>
						</tr>
					</thead>
					<tbody id="match-table-body">
					</tbody>
				</table>
			</div>
		</div>
		
		<br>
		<div class="add-btn" onclick="loadMoreMatches()">더보기</div>
		<!-- class="myMatch" 끝 -->

		<br>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/myPage/myMatch.js"></script>
</body>
</html>