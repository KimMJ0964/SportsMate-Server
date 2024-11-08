<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>구단 미니 홈피</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="resources/css/board/board.css" rel="stylesheet">
<link href="resources/css/teamBoard/teamHome.css" rel="stylesheet" >
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/default.css">
<style>
</style>
</head>
<body>
	<div class="wrap">

		<jsp:include page="/WEB-INF/views/header.jsp" />

		<br>

		<jsp:include page="/WEB-INF/views/nav.jsp" />

		<div class="board-banner" style="background-color: #D9D9D9;">
			<img
				src="${pageContext.request.contextPath}/resources/images/team_board_banner.png" />
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
						<div class="teamcomu-work-vote" data-bs-toggle="modal" data-bs-target="#voteModal">
							<img class="teamcomu-wrok-vote-img"
								src="${pageContext.request.contextPath}/resources/images/team_board_vote.png">
							<div class="teamcomu-center-word">투표</div>
						</div>
						<div class="teamcomu-work-join">
							<img class="teamcomu-wrok-join-img"
								src="${pageContext.request.contextPath}/resources/images/team_board_join.png">
							<div class="teamcomu-center-word">모집</div>
						</div>
						<div class="teamcomu-work-modify">
							<img class="teamcomu-wrok-modify-img"
								src="${pageContext.request.contextPath}/resources/images/team_board_modify.png">
							<div class="teamcomu-center-word">수정</div>
						</div>
					</div>
				</div>
		        
		        <!-- 모달 -->
		        <div class="modal fade" id="voteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <p class="modal-title fs-5" id="exampleModalLabel">투표</p>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <div class="bd-report-title">
				        	<h6>현재 비밀번호</h6>
				        </div>
				        <div class="bd-report-content">
				        	<input type="password" class="mp-modal-input-form before" placeholder="현재 비밀번호를 입력하세요.">
				        </div>
				        <br>
				        <div class="bd-report-title">
				        	<h6>비밀번호 재입력</h6>
				        </div>
				        <div class="bd-report-content">
				        	<input type="password" class="mp-modal-input-form reBefore" placeholder="현재 비밀번호를 다시 입력하세요.">
				        </div>
				        <br>
				        <div class="bd-report-title">
				        	<h6>비밀번호 변경</h6>
				        </div>
				        <div class="bd-report-content">
				        	<input type="password" class="mp-modal-input-form after" placeholder="변경할 비밀번호를 입력하세요.">
				        </div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				        <button type="button" class="btn btn-primary">수정 완료</button>
				      </div>
				    </div>
				  </div>
				</div>
				

				<div class="teamcomu-member">
					<h4 class="teamcomu-title-name">팀원 목록</h4>
					<table class="teamcomu-table">
						<tr>
							<td rowspan="3" class="teamcomu-table-profile"><img
								class="teamcomu-table-profile-img"
								src="${pageContext.request.contextPath}/resources/images/team_board_modify.png">
							</td>
							<td class="teamcomu-table-name" style="width: 100%;">이름 :
								김김김</td>
						</tr>
						<tr>
							<td class="teamcomu-table-position">포지션 : 공격수</td>
						</tr>
						<tr>
							<td class="teamcomu-table-point">평점 : 4.5</td>
						</tr>
					</table>

					<table class="teamcomu-table">
						<tr>
							<td rowspan="3" class="teamcomu-table-profile"><img
								class="teamcomu-table-profile-img"
								src="${pageContext.request.contextPath}/resources/images/team_board_modify.png">
							</td>
							<td class="teamcomu-table-name" style="width: 100%;">이름 :
								김김김</td>
						</tr>
						<tr>
							<td class="teamcomu-table-position">포지션 : 공격수</td>
						</tr>
						<tr>
							<td class="teamcomu-table-point">평점 : 4.5</td>
						</tr>
					</table>

					<table class="teamcomu-table">
						<tr>
							<td rowspan="3" class="teamcomu-table-profile"><img
								class="teamcomu-table-profile-img"
								src="${pageContext.request.contextPath}/resources/images/team_board_modify.png">
							</td>
							<td class="teamcomu-table-name" style="width: 100%;">이름 :
								김김김</td>
						</tr>
						<tr>
							<td class="teamcomu-table-position">포지션 : 공격수</td>
						</tr>
						<tr>
							<td class="teamcomu-table-point">평점 : 4.5</td>
						</tr>
					</table>

					<table class="teamcomu-table">
						<tr>
							<td rowspan="3" class="teamcomu-table-profile"><img
								class="teamcomu-table-profile-img"
								src="${pageContext.request.contextPath}/resources/images/team_board_modify.png">
							</td>
							<td class="teamcomu-table-name" style="width: 100%;">이름 :
								김김김</td>
						</tr>
						<tr>
							<td class="teamcomu-table-position">포지션 : 공격수</td>
						</tr>
						<tr>
							<td class="teamcomu-table-point">평점 : 4.5</td>
						</tr>
					</table>

					<table class="teamcomu-table">
						<tr>
							<td rowspan="3" class="teamcomu-table-profile"><img
								class="teamcomu-table-profile-img"
								src="${pageContext.request.contextPath}/resources/images/team_board_modify.png">
							</td>
							<td class="teamcomu-table-name" style="width: 100%;">이름 :
								김김김</td>
						</tr>
						<tr>
							<td class="teamcomu-table-position">포지션 : 공격수</td>
						</tr>
						<tr>
							<td class="teamcomu-table-point">평점 : 4.5</td>
						</tr>
					</table>

					<table class="teamcomu-table">
						<tr>
							<td rowspan="3" class="teamcomu-table-profile"><img
								class="teamcomu-table-profile-img"
								src="${pageContext.request.contextPath}/resources/images/team_board_modify.png">
							</td>
							<td class="teamcomu-table-name" style="width: 100%;">이름 :
								김김김</td>
						</tr>
						<tr>
							<td class="teamcomu-table-position">포지션 : 공격수</td>
						</tr>
						<tr>
							<td class="teamcomu-table-point">평점 : 4.5</td>
						</tr>
					</table>

					<table class="teamcomu-table">
						<tr>
							<td rowspan="3" class="teamcomu-table-profile"><img
								class="teamcomu-table-profile-img"
								src="${pageContext.request.contextPath}/resources/images/team_board_modify.png">
							</td>
							<td class="teamcomu-table-name" style="width: 100%;">이름 :
								김김김</td>
						</tr>
						<tr>
							<td class="teamcomu-table-position">포지션 : 공격수</td>
						</tr>
						<tr>
							<td class="teamcomu-table-point">평점 : 4.5</td>
						</tr>
					</table>
				</div>

				<div class="teamcomu-app-board-container">
					<div class="board-app-table-container">
						<!-- 앱일 때 출력 -->
						<h4 class="teamcomu-title-name">구단 커뮤니티</h4>
						<table>
							<tr>
								<td rowspan="3" class="board-app-table-num">5</td>
								<td class="board-app-table-title" colspan="2">제목</td>
							</tr>
							<tr>
								<td class="board-app-table-view" colspan="2"><img
									src="resources/img/board_view.png" /> 3</td>
							</tr>
							<tr>
								<td class="board-app-table-type">농구</td>
								<td class="board-app-table-date">2024/11/05</td>
							</tr>
						</table>
						<table>
							<tr>
								<td rowspan="3" class="board-app-table-num">4</td>
								<td class="board-app-table-title" colspan="2">제목 제목</td>
							</tr>
							<tr>
								<td class="board-app-table-view" colspan="2"><img
									src="resources/img/board_view.png" /> 32</td>
							</tr>
							<tr>
								<td class="board-app-table-type">풋살</td>
								<td class="board-app-table-date">2024/11/03</td>
							</tr>
						</table>
						<table>
							<tr>
								<td rowspan="3" class="board-app-table-num">3</td>
								<td class="board-app-table-title" colspan="2">제목 제목 제목</td>
							</tr>
							<tr>
								<td class="board-app-table-view" colspan="2"><img
									src="resources/img/board_view.png" /> 28</td>
							</tr>
							<tr>
								<td class="board-app-table-type">후기</td>
								<td class="board-app-table-date">2024/10/30</td>
							</tr>
						</table>
						<table>
							<tr>
								<td rowspan="3" class="board-app-table-num">2</td>
								<td class="board-app-table-title" colspan="2">제목 제목 제목 제목</td>
							</tr>
							<tr>
								<td class="board-app-table-view" colspan="2"><img
									src="resources/img/board_view.png" /> 67</td>
							</tr>
							<tr>
								<td class="board-app-table-type">야구</td>
								<td class="board-app-table-date">2024/10/29</td>
							</tr>
						</table>
						<table>
							<tr>
								<td rowspan="3" class="board-app-table-num">1</td>
								<td class="board-app-table-title" colspan="2">제목 제목 제목 제목
									제목</td>
							</tr>
							<tr>
								<td class="board-app-table-view" colspan="2"><img
									src="resources/img/board_view.png" /> 103</td>
							</tr>
							<tr>
								<td class="board-app-table-type">축구</td>
								<td class="board-app-table-date">2024/10/29</td>
							</tr>
						</table>

					</div>

					<!-- 글쓰기 버튼 -->
					<div class="board-createMove-btn-container">
						<Button class="board-plus-btn">➖</Button>
						<Button class="board-minus-btn">➕</Button>
						<Button class="board-app-createMove-btn">글쓰기</Button>
					</div>
				</div>
			</div>

			<div class="teamcomu-board-container">
				<div class="teamcomu-board">
					<div class="board-search-container">
						<select class="board-search-option">
							<option value="" selected>선택</option>
						    <option value="soccer">축구</option>
						    <option value="baksetball">농구</option>
						    <option value="footsal">풋살</option>
						    <option value="baseball">야구</option>
						    <option value="review">후기</option>
						</select> <input type="text" class="board-search-input"
							placeholder="검색어 입력" />

						<button type="submit" class="board-search-btn">검색</button>
					</div>

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
								<tr>
									<td>10</td>
									<td>게시글</td>
									<td>닉네임1</td>
									<td>2024-01-01</td>
									<td>100</td>
								</tr>
								<tr>
									<td>9</td>
									<td>게시글 게시글</td>
									<td>닉네임1</td>
									<td>2024-01-01</td>
									<td>100</td>
								</tr>
								<tr>
									<td>8</td>
									<td>게시글 게시글 게시글</td>
									<td>닉네임1</td>
									<td>2024-01-01</td>
									<td>100</td>
								</tr>
								<tr>
									<td>7</td>
									<td>게시글 게시글 게시글 게시글</td>
									<td>닉네임1</td>
									<td>2024-01-01</td>
									<td>100</td>
								</tr>
								<tr>
									<td>6</td>
									<td>게시글 게시글 게시글 게시글 게시글</td>
									<td>닉네임1</td>
									<td>2024-01-01</td>
									<td>100</td>
								</tr>
								<tr>
									<td>5</td>
									<td>게시글 게시글 게시글 게시글 게시글</td>
									<td>닉네임1</td>
									<td>2024-01-01</td>
									<td>100</td>
								</tr>
								<tr>
									<td>4</td>
									<td>게시글 게시글 게시글 게시글 게시글</td>
									<td>닉네임1</td>
									<td>2024-01-01</td>
									<td>100</td>
								</tr>
								<tr>
									<td>3</td>
									<td>게시글 게시글 게시글 게시글 게시글</td>
									<td>닉네임1</td>
									<td>2024-01-01</td>
									<td>100</td>
								</tr>
								<tr>
									<td>2</td>
									<td>게시글 게시글 게시글 게시글 게시글</td>
									<td>닉네임1</td>
									<td>2024-01-01</td>
									<td>100</td>
								</tr>
								<tr>
									<td>1</td>
									<td>게시글 게시글 게시글 게시글 게시글</td>
									<td>닉네임1</td>
									<td>2024-01-01</td>
									<td>100</td>
								</tr>
							</tbody>
						</table>

						<!-- 페이지네이션 -->
						<div class="board-pagination">
							<button class="board-page-btn">&laquo;</button>
							<button class="board-page-btn">1</button>
							<button class="board-page-btn">2</button>
							<button class="board-page-btn">3</button>
							<button class="board-page-btn">4</button>
							<button class="board-page-btn">5</button>
							<button class="board-page-btn">&raquo;</button>
						</div>
						<!-- 글쓰기 버튼 -->
						<div class="board-createMove-btn-container">
							<Button class="board-plus-btn">➖</Button>
							<Button class="board-minus-btn">➕</Button>
							<Button class="board-createMove-btn">글쓰기</Button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<jsp:include page="/WEB-INF/views/footer.jsp" />
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	</div>
</body>
</html>