<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구단 매치</title>
<link href="resources/css/teamBoard/teamMatch.css" rel="stylesheet">
<link href="resources/css/board/board.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/default.css">
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<br>
		<jsp:include page="/WEB-INF/views/common/nav.jsp" />
		<br>

		<div id="team-match-container">
			<!-- 진행 예정 매치 -->
			<div id="team-match-matchingList">
				<h3>진행 예정 매치</h3>
				<br>
				<table class="team-match-matchingRecord">
					<thead style="text-align: center;">
						<tr>
							<th>구장</th>
							<th>상대 구단</th>
							<th>포인트</th>
							<th>환불</th>
							<th>환불 여부</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="wm" items="${willMatch }">
							<tr>
								<td>${wm.stadiumName}</td>
								<td>${wm.enemyTeamName }</td>
								<td>${wm.enemyTeamPoint }</td>
								<td><c:if test="${memNo != null && memNo == leaderNo}">
										<button class="matchRefundBtn" data-bs-toggle="modal"
											data-bs-target="#refundModal"
											onclick="setMatchNo(${wm.matchNo})">환불하기</button>
									</c:if></td>
								<td><c:choose>
										<c:when test="${wm.status eq 'Y'}">
											<img
												src="${pageContext.request.contextPath}/resources/images/qnaCheck.png"
												alt="Checked" />
										</c:when>
										<c:when test="${wm.status eq 'N'}">
											<img
												src="${pageContext.request.contextPath}/resources/images/qnaUnCheck.png"
												alt="Checked" />
										</c:when>
										<c:otherwise>
											<img
												src="${pageContext.request.contextPath}/resources/images/noneCheck.png"
												alt="Checked" />
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<br> <br>

			<!-- 구단 전적 -->
			<div id="team-match-matchedList">
				<h3>구단 전적</h3>
				<br>
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
					<tbody>
						<c:forEach var="mi" items="${matchInfo }">
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
											alt="" class="team-logo" /> <span> ${mi.myTeamName}</span>
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
											alt="" class="team-logo" /> <span>
											${mi.enemyTeamName}</span>
									</div>
								</td>
								<td>${mi.enemyTeamPoint}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<!-- 페이지네이션 -->
		<div id="pagenation">
			<nav>
				<ul class="pagination">
					<c:choose>
						<c:when
							test="${pi.currentPage != 1 || (pi.startPage / pi.boardLimit)  > 1}">
							<li class="page-item"><a
								href="teamMatch.tm?cpage=1&tno=${tno}" class="page-link"> <span
									aria-hidden="true">&laquo;</span>
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
								href="teamMatch.tm?cpage=${pi.currentPage - 1}&tno=${tno}"
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
									href="teamMatch.tm?cpage=${page}&tno=${tno}">${page}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:choose>
						<c:when test="${pi.currentPage < pi.maxPage}">
							<li class="page-item"><a
								href="teamMatch.tm?cpage=${pi.currentPage + 1}&tno=${tno}"
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
								href="teamMatch.tm?cpage=${pi.maxPage}&tno=${tno}"
								class="page-link"> <span aria-hidden="true">&raquo;</span>
							</a></li>
						</c:when>
						<c:when test="${(pi.endPage / boardLimit)  < pi.maxPage}">
							<li class="page-item"><a
								href="teamMatch.tm?cpage=${pi.endPage + 1}&tno=${tno}"
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

		<!-- 환불 모달 -->
		<div class="modal fade" id="refundModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">환불</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form method="post" action="teamMatchRefund.tm">
						<div class="modal-body">
							<div class="bd-refund-title">
								<h5>사유</h5>
							</div>
							<br>
							<div class="bd-report-content">
								<textarea class="bd-refund-content-textarea" id="refund-content"
									name="refundContent" class="refund-content"
									style="width: 100%; height: 300px; border: 2px solid #307DFA; resize: none; padding: 10px; font-size: 16px; box-sizing: border-box; border-radius: 8px;"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<!-- 숨겨진 input으로 boardNo와 comNo 값을 전달 -->
							<input type="hidden" id="refund-matchQnaNo" name="matchNo">
							<input type="hidden" id="refund-tno" name="tno" value="${tno }">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<button type="submit" class="btn btn-primary">작성 완료</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/teamBoard/teamMatch.js"></script>
</body>
</html>