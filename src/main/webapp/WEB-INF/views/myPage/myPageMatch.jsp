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
				    <button class="sport-btn ${category eq 'soccer' ? 'active' : ''}" data-category="soccer" onClick="location.href='myMatch.mp?category=soccer&cpage=${page}'">축구</button>
				    <button class="sport-btn ${category eq 'futsal' ? 'active' : ''}" data-category="futsal" onClick="location.href='myMatch.mp?category=futsal&cpage=${page}'">풋살</button>
				    <button class="sport-btn ${category eq 'baseball' ? 'active' : ''}" data-category="baseball" onClick="location.href='myMatch.mp?category=baseball&cpage=${page}'">야구</button>
				    <button class="sport-btn ${category eq 'basketball' ? 'active' : ''}" data-category="basketball" onClick="location.href='myMatch.mp?category=basketball&cpage=${page}'">농구</button>
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
						<c:forEach var="mi" items="${matchInfo}">
							<tr
								style="background-color : 
								<c:choose>
									<c:when test='${mi.myScore > mi.enemyScore}'>
										#f2f9ff
									</c:when>
									<c:when test='${mi.myScore < mi.enemyScore}'>								
										#fff7f7
									</c:when>
									<c:otherwise>
										#f2f2f2
									</c:otherwise>
								</c:choose>
															;">
								<td>${mi.myTeamPoint}</td>
								<td>
									<div class="team-cell">
										<img
											src="<c:choose>
										            <c:when test='${mi.myTeamProfile != null}'>
										                ${pageContext.request.contextPath}/resources/images/userProFile/${mi.myTeamProfile}
										            </c:when>
										            <c:otherwise>
										                ${pageContext.request.contextPath}/resources/images/user_default_profile.png
										            </c:otherwise>
										         </c:choose>"
											alt="" class="team-logo"> <span>${mi.myTeamName}</span>
									</div>
								</td>
								<td><b>${mi.myScore}</b></td>
								<td>VS</td>
								<td><b>${mi.enemyScore}</b></td>
								<td>
									<div class="team-cell">
										<img
											src="<c:choose>
										            <c:when test='${mi.enemyTeamProfile != null}'>
										                ${pageContext.request.contextPath}/resources/images/userProFile/${mi.enemyTeamProfile}
										            </c:when>
										            <c:otherwise>
										                ${pageContext.request.contextPath}/resources/images/user_default_profile.png
										            </c:otherwise>
										         </c:choose>"
											alt="" class="team-logo"> <span>${mi.enemyTeamName}</span>
									</div>
								</td>
								<td>${mi.enemyTeamPoint}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<br>

		<div id="pagenation">
			<nav>
				<ul class="pagination">
					<c:choose>
						<c:when
							test="${pi.currentPage != 1 || (pi.startPage / pi.boardLimit)  > 1}">
							<li class="page-item"><a
								href="myMatch.mp?category=${category}&cpage=1"
								class="page-link"> <span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a href="#" class="page-link">
									<span aria-hidden="true">&laquo;</span>
							</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${pi.currentPage > 1}">
							<li class="page-item"><a
								href="myMatch.mp?category=${category}&cpage=${pi.currentPage - 1}"
								class="page-link"> <span aria-hidden="true">&lt;</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a href="#" class="page-link">
									<span aria-hidden="true">&lt;</span>
							</a></li>
						</c:otherwise>
					</c:choose>

					<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}"
						step="1">
						<c:choose>
							<c:when test="${page == pi.currentPage}">
								<li class="page-item active"><a class="page-link" href="#">${page}</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="myMatch.mp?category=${category}&cpage=${page}">${page}</a>
								</li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pi.currentPage < pi.maxPage}">
							<li class="page-item"><a
								href="myMatch.mp?category=${category}&cpage=${pi.currentPage + 1}"
								class="page-link"> <span aria-hidden="true">&gt;</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a href="#" class="page-link">
									<span aria-hidden="true">&gt;</span>
							</a></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${pi.currentPage eq pi.maxPage}">
							<li class="page-item disabled"><a href="#" class="page-link">
									<span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:when>
						<c:when test="${pi.currentPage  < pi.maxPage and pi.maxPage > 1}">
							<li class="page-item"><a
								href="myMatch.mp?category=${category}&cpage=${pi.maxPage}"
								class="page-link"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:when>
						<c:when test="${(pi.endPage / boardLimit)  < pi.maxPage}">
							<li class="page-item"><a
								href="myMatch.mp?category=${category}&cpage=${pi.endPage + 1}"
								class="page-link"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item disabled"><a href="#" class="page-link">
									<span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>

		<!-- class="myMatch" 끝 -->

		<br>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/myPage/myMatch.js"></script>
</body>
</html>