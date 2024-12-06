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

			<div id="pagenation">
				<nav>
					<ul class="pagination">
						<c:choose>
							<c:when
								test="${pi.currentPage != 1 || (pi.startPage / pi.boardLimit)  > 1}">
								<li class="page-item"><a
									href="myMatch.mp?page=1"
									class="page-link"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a href="#"
									class="page-link"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pi.currentPage > 1}">
								<li class="page-item"><a
									href="myMatch.mp?page=${pi.currentPage - 1}"
									class="page-link"> <span aria-hidden="true">&lt;</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a href="#"
									class="page-link"> <span aria-hidden="true">&lt;</span>
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
										href="myMatch.mp?page=${page}">${page}</a>
									</li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pi.currentPage < pi.maxPage}">
								<li class="page-item"><a
									href="myMatch.mp?page=${pi.currentPage + 1}"
									class="page-link"> <span aria-hidden="true">&gt;</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a href="#"
									class="page-link"> <span aria-hidden="true">&gt;</span>
								</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${pi.currentPage eq pi.maxPage}">
								<li class="page-item disabled"><a href="#"
									class="page-link"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:when>
							<c:when test="${pi.currentPage  < pi.maxPage and pi.maxPage > 1}">
								<li class="page-item"><a
									href="myMatch.mp?page=${pi.maxPage}"
									class="page-link"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:when>
							<c:when test="${(pi.endPage / boardLimit)  < pi.maxPage}">
								<li class="page-item"><a
									href="myMatch.mp?page=${pi.endPage + 1}"
									class="page-link"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item disabled"><a href="#"
									class="page-link"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>

		</div>
		<!-- class="myMatch" 끝 -->

		<br>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/myPage/myMatch.js"></script>
</body>
</html>