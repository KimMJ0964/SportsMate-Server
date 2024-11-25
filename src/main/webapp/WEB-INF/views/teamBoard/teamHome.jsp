<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구단 미니 홈피</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link href="resources/css/board/board.css" rel="stylesheet">
<link href="resources/css/teamBoard/teamHome.css" rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/default.css">
<style>
</style>
</head>
<body>
	<div class="wrap">

		<jsp:include page="/WEB-INF/views/common/header.jsp" />

		<br>

		<jsp:include page="/WEB-INF/views/common/nav.jsp" />

		<div class="board-banner">
			<c:choose>
			    <c:when test="${teamBanner == null}">
			        <img src="${pageContext.request.contextPath}/resources/images/team_board_banner.png" />
			    </c:when>
			    <c:otherwise>
			        <img src="${pageContext.request.contextPath}/resources/images/userProFile/${teamBanner.changeName}" alt="팀 배너 이미지" />
			    </c:otherwise>
			</c:choose>
			<div class="banner-text">구단 미니 홈피</div>
		</div>

		<div class="board-app-banner" style="padding-bottom: 20px;">
			<h4>구단 미니 홈피</h4>
		</div>

		<div class="teamcomu-container">
			<div class="teamcomu-work-container">
				<div class="teamcomu-work">
					<h4 class="teamcomu-title-name">구단</h4>
					<div class="teamcomu-work-three">
						<div class="teamcomu-work-vote" data-bs-toggle="modal"
							data-bs-target="#voteModal">
							<img class="teamcomu-wrok-vote-img"
								src="${pageContext.request.contextPath}/resources/images/team_board_vote.png">
							<div class="teamcomu-center-word">투표</div>
						</div>
						<div class="teamcomu-work-vote-desktop" data-bs-toggle="modal"
							data-bs-target="#voteModalDeskTop">
							<img class="teamcomu-wrok-vote-img"
								src="${pageContext.request.contextPath}/resources/images/team_board_vote.png">
							<div class="teamcomu-center-word">투표</div>
						</div>
						<c:if test="${memNo != null && memNo == leaderNo}">
							<div class="teamcomu-work-join">
								<img class="teamcomu-wrok-join-img"
									src="${pageContext.request.contextPath}/resources/images/team_board_join.png">
								<div class="teamcomu-center-word">모집</div>
							</div>
							<div class="teamcomu-work-modify"
								onclick="location.href = 'teamManagement.tm?tno=${tno}'">
								<img class="teamcomu-wrok-modify-img"
									src="${pageContext.request.contextPath}/resources/images/team_board_modify.png">
								<div class="teamcomu-center-word">관리</div>
							</div>
						</c:if>
					</div>
				</div>

				<!-- 데스크탑 투표 모달 -->
				<div class="modal fade" id="voteModalDeskTop" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-xl">
						<div class="modal-content">
							<!-- 모달 헤더 -->
							<div class="modal-header">
								<p class="modal-title fs-5" id="exampleModalLabel">투표</p>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- 진행중인 투표 -->
								<div class="vote-desktop-topContainer">
									<div class="bd-report-title">
										<form id="ongoingVoteForm" action="voting.tm" method="post">
											 <input type="hidden" id="tno" name="tno" value="${tno}" />
											 <input type="hidden" id="tno" name="vno" value="${voting.voteNo}" />
												<h4 style="text-align:center;">진행중인 투표</h4>
													<hr>
													<div style="margin-left: 20px;">
														<p><b>투표 제목: ${voting.voteTitle }</b></p>
														<div>
															<input type="checkbox" id="option1" name="voteOption" value="1" onclick="selectOnlyOne(this)" />
															<label for="option1">${voting.voteOne }</label>
														</div>
														<div>
															<input type="checkbox" id="option2" name="voteOption" value="2" onclick="selectOnlyOne(this)" />
															<label for="option2">${voting.voteTwo }</label>
														</div>
														<div>
															<input type="checkbox" id="option3" name="voteOption" value="3" onclick="selectOnlyOne(this)" />
															<label for="option3">${voting.voteThree }</label>
														</div>
														<div>
															<input type="checkbox" id="option4" name="voteOption" value="4" onclick="selectOnlyOne(this)" />
															<label for="option4">${voting.voteFour }</label>
														</div>
														<div>
															<input type="checkbox" id="option5" name="voteOption" value="5" onclick="selectOnlyOne(this)" />
															<label for="option5">${voting.voteFive }</label>
														</div>
													</div>
												<div class="vote-desktop-btn" style="text-align: center;">
													<button type="submit" class="btn btn-primary mt-3">투표 제출</button>
												</div>
										</form>
									</div>
									<!-- 지금까지 투표 -->
									<div class="bd-report-title">
										<h4 style="text-align:center;">지금까지 투표</h4>
										<hr>
										<table class="table table-bordered">
											<thead style="text-align: center;">
												<tr>
													<th>투표 제목</th>
													<th>최종 결과</th>
												</tr>
											</thead>
											<tbody>
											 <c:forEach var="vl" items="${voteList}">
							               		<tr>
							               			<td>${vl.voteTitle}</td>
							               			<td>${vl.voteContent}</td>
							               		</tr>
							               	  </c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<br>
								<br>
								<c:if test="${memNo != null && memNo == leaderNo}">
								<br />
								<!-- 투표 생성 -->
								<form id="createVoteForm" action="createVote.tm" method="post">
									 <input type="hidden" id="teamNo" name="teamNo" value="${tno}" />
									<div class="bd-report-title">
										<h4>투표 생성</h4>
										<hr>
										<div>
											<label for="voteTitle">투표 제목:</label> <input type="text"
												id="voteTitle" name="voteTitle" class="form-control"
												placeholder="투표 제목 입력" required />
											<div class="mt-3">
												<label for="optionInput1">옵션 1:</label> <input type="text"
													id="voteOne" name="voteOne" class="form-control"
													placeholder="옵션 이름 입력" />
											</div>
											<div class="mt-2">
												<label for="optionInput2">옵션 2:</label> <input type="text"
													id="voteTwo" name="voteTwo" class="form-control"
													placeholder="옵션 이름 입력" />
											</div>
											<div class="mt-2">
												<label for="optionInput3">옵션 3:</label> <input type="text"
													id="voteThree" name="voteThree" class="form-control"
													placeholder="옵션 이름 입력" />
											</div>
											<div class="mt-2">
												<label for="optionInput4">옵션 4:</label> <input type="text"
													id="voteFour" name="voteFour" class="form-control"
													placeholder="옵션 이름 입력" />
											</div>
											<div class="mt-2">
												<label for="optionInput5">옵션 5:</label> <input type="text"
													id="voteFive" name="voteFive" class="form-control"
													placeholder="옵션 이름 입력" />
											</div>
										</div>
										<button type="submit" class="btn btn-primary mt-3">투표
											생성</button>
									</div>
								</form>
								</c:if>
							</div>
							<!-- 모달 푸터 -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<c:if test="${memNo != null && memNo == leaderNo}">
									<button type="button" class="btn btn-secondary" onclick="location.href = 'voteComplete.tm?vno=${voting.voteNo}&tno=${tno}'">투표 완료</button>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 모바일 투표 모달 -->
				<div class="modal fade" id="voteModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- 모달 헤더 -->
							<div class="modal-header">
								<p class="modal-title fs-5" id="exampleModalLabel">투표</p>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<!-- 진행중인 투표 -->
								<form id="ongoingVoteForm" action="voting.tm" method="post">
									 <input type="hidden" id="tno" name="tno" value="${tno}" />
									 <input type="hidden" id="tno" name="vno" value="${voting.voteNo}" />
									<div class="bd-report-title">
										<h4>진행중인 투표</h4>
											<hr>
											<div>
												<p><b>투표 제목: ${voting.voteTitle }</b></p>
												<div>
													<input type="checkbox" id="option1" name="voteOption" value="1" onclick="selectOnlyOne(this)" />
													<label for="option1">${voting.voteOne }</label>
												</div>
												<div>
													<input type="checkbox" id="option2" name="voteOption" value="2" onclick="selectOnlyOne(this)" />
													<label for="option2">${voting.voteTwo }</label>
												</div>
												<div>
													<input type="checkbox" id="option3" name="voteOption" value="3" onclick="selectOnlyOne(this)" />
													<label for="option3">${voting.voteThree }</label>
												</div>
												<div>
													<input type="checkbox" id="option4" name="voteOption" value="4" onclick="selectOnlyOne(this)" />
													<label for="option4">${voting.voteFour }</label>
												</div>
												<div>
													<input type="checkbox" id="option5" name="voteOption" value="5" onclick="selectOnlyOne(this)" />
													<label for="option5">${voting.voteFive }</label>
												</div>
											</div>
										<button type="submit" class="btn btn-primary mt-3">투표
											제출</button>
									</div>
								</form>
								 <c:if test="${memNo != null && memNo == leaderNo}">
								<br />
								<!-- 투표 생성 -->
								<form id="createVoteForm" action="createVote.tm" method="post">
									 <input type="hidden" id="teamNo" name="teamNo" value="${tno}" />
									<div class="bd-report-title">
										<h4>투표 생성</h4>
										<hr>
										<div>
											<label for="voteTitle">투표 제목:</label> <input type="text"
												id="voteTitle" name="voteTitle" class="form-control"
												placeholder="투표 제목 입력" required />
											<div class="mt-3">
												<label for="optionInput1">옵션 1:</label> <input type="text"
													id="voteOne" name="voteOne" class="form-control"
													placeholder="옵션 이름 입력" />
											</div>
											<div class="mt-2">
												<label for="optionInput2">옵션 2:</label> <input type="text"
													id="voteTwo" name="voteTwo" class="form-control"
													placeholder="옵션 이름 입력" />
											</div>
											<div class="mt-2">
												<label for="optionInput3">옵션 3:</label> <input type="text"
													id="voteThree" name="voteThree" class="form-control"
													placeholder="옵션 이름 입력" />
											</div>
											<div class="mt-2">
												<label for="optionInput4">옵션 4:</label> <input type="text"
													id="voteFour" name="voteFour" class="form-control"
													placeholder="옵션 이름 입력" />
											</div>
											<div class="mt-2">
												<label for="optionInput5">옵션 5:</label> <input type="text"
													id="voteFive" name="voteFive" class="form-control"
													placeholder="옵션 이름 입력" />
											</div>
										</div>
										<button type="submit" class="btn btn-primary mt-3">투표
											생성</button>
									</div>
								</form>
								</c:if>
								<br />
								<!-- 지금까지 투표 -->
								<div class="bd-report-title">
									<h4>지금까지 투표</h4>
									<hr>
									<table class="table table-bordered">
										<thead style="text-align: center;">
											<tr>
												<th>투표 제목</th>
												<th>최종 결과</th>
											</tr>
										</thead>
										<tbody>
										 <c:forEach var="vl" items="${voteList}">
						               		<tr>
						               			<td>${vl.voteTitle}</td>
						               			<td>${vl.voteContent}</td>
						               		</tr>
						               	  </c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- 모달 푸터 -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">닫기</button>
								<c:if test="${memNo != null && memNo == leaderNo}">
									<button type="button" class="btn btn-secondary" onclick="location.href = 'voteComplete.tm?vno=${voting.voteNo}&tno=${tno}'">투표 완료</button>
								</c:if>
							</div>
						</div>
					</div>
				</div>
				

				<div class="teamcomu-member">
					<h4 class="teamcomu-title-name">팀원 목록</h4>
					<c:forEach var="ml" items="${memberList}">
						<table class="teamcomu-table">
							<tr>
								<td rowspan="3" class="teamcomu-table-profile">
									<c:choose>
									    <c:when test="${ml.changeName == null}">
									        <img class="teamcomu-table-profile-img" src="${pageContext.request.contextPath}/resources/images/user_default_profile.png" />
									    </c:when>
									    <c:otherwise>
									        <img class="teamcomu-table-profile-img" src="${pageContext.request.contextPath}/resources/images/userProFile/${ml.changeName}" alt="팀 배너 이미지" />
									    </c:otherwise>
									</c:choose>
								</td>
								<td class="teamcomu-table-name" style="width: 100%;">이름 :
									${ml.memName }</td>
							</tr>
							<tr>
								<td class="teamcomu-table-position">포지션 : ${ml.position }</td>
							</tr>
							<tr>
								<td class="teamcomu-table-point">숙련도 : ${ml.ability }</td>
							</tr>
						</table>
					</c:forEach>
				</div>

				<!-- 팀 탈퇴 -->
				<div class="teamcomu-teamOut">
					<button class="teamcomu-teamOutBtn"
						onclick="confirmTeamOut(${tno})">구단 탈퇴</button>
				</div>

				<div class="teamcomu-app-board-container">
					<div class="board-app-table-container">
						<!-- 앱일 때 출력 -->
						<h4 class="teamcomu-title-name">구단 커뮤니티</h4>
						<c:forEach var="b" items="${list}">
							<table>
								<tr onclick="location.href = 'detailMoveBd.tm?bno=${b.boardNo}'">
									<td rowspan="3" class="board-app-table-num">${b.boardNo}</td>
									<td class="board-app-table-title" colspan="2">${b.title}</td>
								</tr>
								<tr onclick="location.href = 'detailMoveBd.tm?bno=${b.boardNo}'">
									<td class="board-app-table-view" colspan="2"><img
										src="${pageContext.request.contextPath}/resources/images/board_view.png" />
										${b.view }</td>
								</tr>
								<tr onclick="location.href = 'detailMoveBd.tm?bno=${b.boardNo}'">
									<td class="board-app-table-type">${b.type }</td>
									<td class="board-app-table-date">${b.createDate}</td>
								</tr>

							</table>
						</c:forEach>
					</div>

					<!-- 페이지네이션 -->
					<div id="pagenation">
						<nav>
							<ul class="pagination">
								<c:choose>
									<c:when
										test="${pi.currentPage != 1 || (pi.startPage / pi.boardLimit)  > 1}">
										<li class="page-item"><a
											href="boardList.tm?cpage=1&tno=${tno }" class="page-link">
												<span aria-hidden="true">&laquo;</span>
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
											href="boardList.tm?cpage=${pi.currentPage - 1}&tno=${tno }"
											class="page-link"> <span aria-hidden="true">&lt;</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a href="#"
											class="page-link"> <span aria-hidden="true">&lt;</span>
										</a></li>
									</c:otherwise>
								</c:choose>

								<c:forEach var="page" begin="${pi.startPage}"
									end="${pi.endPage}" step="1">
									<c:choose>
										<c:when test="${page == pi.currentPage}">
											<li class="page-item active"><a class="page-link"
												href="#">${page}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item"><a class="page-link"
												href="boardList.tm?cpage=${page}&tno=${tno }">${page}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${pi.currentPage < pi.maxPage}">
										<li class="page-item"><a
											href="boardList.tm?cpage=${pi.currentPage + 1}&tno=${tno }"
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
									<c:when
										test="${pi.currentPage  < pi.maxPage and pi.maxPage > 1}">
										<li class="page-item"><a
											href="boardList.tm?cpage=${pi.maxPage}&tno=${tno }"
											class="page-link"> <span aria-hidden="true">&raquo;</span>
										</a></li>
									</c:when>
									<c:when test="${(pi.endPage / boardLimit)  < pi.maxPage}">
										<li class="page-item"><a
											href="boardList.tm?cpage=${pi.currentPage + 1}&tno=${tno }"
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


					<!-- 글쓰기 버튼 -->
					<div class="board-createMove-btn-container">
						<Button class="board-app-createMove-btn">글쓰기</Button>
					</div>
				</div>
			</div>

			<div class="teamcomu-board-container">
				<div class="teamcomu-board">
					<form method="get" action="searchBoard.tm">
						<input type="hidden" name="tno" value="${tno}">
						<div class="board-search-container">
							<select class="board-search-option" name="category" id="category">
								<option value="" selected>선택</option>
								<option value="자유">자유</option>
								<option value="응원">응원</option>
								<option value="응원">질문</option>
								<option value="공지">공지</option>
								<option value="후기">후기</option>
							</select> <input type="text" class="board-search-input"
								placeholder="검색어 입력" name="keyword" id="keyword" />

							<button type="submit" class="board-search-btn">검색</button>
						</div>
					</form>
					<!-- 게시글 목록 -->
					<div class="board-table-container">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th style="width: 50%;">제목</th>
									<th>닉네임</th>
									<th>게시일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="b" items="${list}">
									<tr
										onclick="location.href = 'detailMoveBd.tm?bno=${b.boardNo}'">
										<td>${b.boardNo}</td>
										<td>${b.title}</td>
										<td>${b.memName}</td>
										<td>${b.createDate}</td>
										<td>${b.view}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<!-- 페이지네이션 -->
						<div id="pagenation">
							<nav>
								<ul class="pagination">
									<c:choose>
										<c:when
											test="${pi.currentPage != 1 || (pi.startPage / pi.boardLimit)  > 1}">
											<li class="page-item"><a
												href="boardList.tm?cpage=1&tno=${tno }" class="page-link">
													<span aria-hidden="true">&laquo;</span>
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
												href="boardList.tm?cpage=${pi.currentPage - 1}&tno=${tno }"
												class="page-link"> <span aria-hidden="true">&lt;</span>
											</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item disabled"><a href="#"
												class="page-link"> <span aria-hidden="true">&lt;</span>
											</a></li>
										</c:otherwise>
									</c:choose>

									<c:forEach var="page" begin="${pi.startPage}"
										end="${pi.endPage}" step="1">
										<c:choose>
											<c:when test="${page == pi.currentPage}">
												<li class="page-item active"><a class="page-link"
													href="#">${page}</a></li>
											</c:when>
											<c:otherwise>
												<li class="page-item"><a class="page-link"
													href="boardList.tm?cpage=${page}&tno=${tno }">${page}</a></li>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									<c:choose>
										<c:when test="${pi.currentPage < pi.maxPage}">
											<li class="page-item"><a
												href="boardList.tm?cpage=${pi.currentPage + 1}&tno=${tno }"
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
										<c:when
											test="${pi.currentPage  < pi.maxPage and pi.maxPage > 1}">
											<li class="page-item"><a
												href="boardList.tm?cpage=${pi.maxPage}&tno=${tno }"
												class="page-link"> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</c:when>
										<c:when test="${(pi.endPage / boardLimit)  < pi.maxPage}">
											<li class="page-item"><a
												href="boardList.tm?cpage=${pi.currentPage + 1}&tno=${tno }"
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
					<!-- 글쓰기 버튼 -->
					<div class="board-createMove-btn-container">
						<Button class="board-createMove-btn"
							onclick="location.href = 'createMoveBd.tm?tno=${tno}'">글쓰기</Button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	<script
		src="${pageContext.request.contextPath}/resources/js/teamBoard/teamHome.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	</div>
</body>
</html>