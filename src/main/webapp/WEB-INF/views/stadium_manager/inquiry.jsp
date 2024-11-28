<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 페이지</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/stadium_manager/inquiry.css">

<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
	rel="stylesheet">

</head>
<body>

	<div class="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<br>

		<jsp:include page="/WEB-INF/views/common/nav.jsp" />

		<div class="inquiry-container">
			<div class="headname-container">
				<div class="inquiry-row">
					<div class="team-info">
						<img
							src="${pageContext.request.contextPath}/resources/images/inquiry.png"
							alt="문의" class="inquiry-logo">
						<div class="team-details">
							<h4 class="head-name">문의</h4>
						</div>
					</div>
				</div>
			</div>
		</div>

		<c:forEach var="mi" items="${myInquiry}">
			<div class="inquiry-container">
				<div class="inquirycontents-container">
					<div class="inquiry-row">
						<div class="team-info">
							<ul>
								<li><h5>${mi.matchQTitle }</h5></li>
								<li><p>문의 내용 : ${mi.matchQDetail }</p></li>
								<li><p>문의 답장 : ${mi.matchA }</p></li>
							</ul>
						</div>
					</div>
					<div class="inquiry-btn-container">
						<hr>
						<button class="answer-btn" data-bs-toggle="modal"
											data-bs-target="#inquiryModal" onclick="setMatchQnaNo(${mi.matchQnaNo})">답변하기</button>
					</div>
				</div>
			</div>
		</c:forEach>

		<!-- 등록 버튼 -->
		<button class="registration-button"
			onclick="location.href = 'managermypage.me'" alt=""
			onclick="location.href = '${pageContext.request.contextPath}/managermypage.me'">뒤로가기</button>

		<div class="modal fade" id="inquiryModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">문의</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<form method="post" action="inquiryUpdate.me">
						<div class="modal-body">
							<div class="bd-inquiry-title">
								<h5>답변</h5>
							</div>
							<br>
							<div class="bd-inquiry-content">
								<textarea class="bd-inquiry-content-textarea" id="inquiry-content"
									name="matchA" class="refund-content"
									style="width: 100%; height: 300px; border: 2px solid #307DFA; resize: none; padding: 10px; font-size: 16px; box-sizing: border-box; border-radius: 8px;"></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<!-- 숨겨진 input으로 boardNo와 comNo 값을 전달 -->
							<input type="hidden" id="inquiry-matchQnaNo" name="matchQnaNo">
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
	<script src="${pageContext.request.contextPath}/resources/js/stadium_manager/inquiry.js"></script>
</body>
</html>