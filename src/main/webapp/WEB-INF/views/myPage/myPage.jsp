<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
	 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <!-- Bootstrap Icons -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css" rel="stylesheet">
	
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/myPage/myPage.css?after">
<style>
@media (max-width: 480px) {
		
		.joinTeamPeopleContainer {
			overflow-y: hidden;
		}
}
</style>
</head>
<body>

	<div class="wrap">
		<jsp:include page="/WEB-INF/views/header.jsp" />
		<br>
		<jsp:include page="/WEB-INF/views/nav.jsp" />
		<!-- 헤더 -->

		<div class="myPage-container">
			<!-- 사용자 프로필 -->
			<div class="MyInfoContainer">
				<img src="your-image-url.jpg" alt="User Profile" /> <br />
				<div class="userInfo">
					<p>이름 : 사용자 이름</p>
					<p>주소 : 서울특별시 강남</p>
					<p>성별 : 남</p>
					<p>나이 : 28</p>
					<p>점수 : 4.5</p>
				</div>
				<div class="profile-buttons">
					<Button class="modify-btn">프로필 수정</Button>
					<Button class="secession-btn">회원 탈퇴</Button>
				</div>
			</div>

			<!-- 내 전적 -->
			<div class="MyRecordContainer">
			<i class="bi bi-caret-down-fill toggle-button" onclick="toggleHeight(event)"></i>
				<div class="record-container">
					<h4 class="joinTitle" >내 전적</h4>
					<div class="stats-container">
						<div class="AllCountBox">
							<div class="all">총 경기 수</div>
							<div class="all_count">30번</div>
						</div>
						<div class="VictoryCountBox">
							<div class="victory">승리 횟수</div>
							<div class="victory_count">17번</div>
						</div>
					</div>
					<div class="match-info">
						<div class="team red">
							<span>레드팀</span>
							<p>a팀</p>
						</div>
						<div class="score">3 : 1</div>
						<div class="team blue">
							<span>블루팀</span>
							<p>b팀</p>
						</div>
						<img src="resources/images/User_vote.png" style="cursor: pointer;"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
						<!-- 베스트플레이어 투표  -->
					</div>

					<div class="match-info">
						<div class="team red">
							<span>레드팀</span>
							<p>a팀</p>
						</div>
						<div class="score">3 : 1</div>
						<div class="team blue">
							<span>블루팀</span>
							<p>b팀</p>
						</div>
						<img src="resources/images/User_vote.png" style="cursor: pointer;"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
						<!-- 베스트플레이어 투표  -->
					</div>

					<div class="match-info">
						<div class="team red">
							<span>레드팀</span>
							<p>a팀</p>
						</div>
						<div class="score">3 : 1</div>
						<div class="team blue">
							<span>블루팀</span>
							<p>b팀</p>
						</div>
						<img src="resources/images/User_vote.png" style="cursor: pointer;"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
						<!-- 베스트플레이어 투표  -->
					</div>

					<div class="match-info">
						<div class="team red">
							<span>레드팀</span>
							<p>a팀</p>
						</div>
						<div class="score">3 : 1</div>
						<div class="team blue">
							<span>블루팀</span>
							<p>b팀</p>
						</div>
						<img src="resources/images/User_vote.png" style="cursor: pointer;"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
						<!-- 베스트플레이어 투표  -->
					</div>

					<div class="match-info">
						<div class="team red">
							<span>레드팀</span>
							<p>a팀</p>
						</div>
						<div class="score">3 : 1</div>
						<div class="team blue">
							<span>블루팀</span>
							<p>b팀</p>
						</div>
						<img src="resources/images/User_vote.png" style="cursor: pointer;"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
						<!-- 베스트플레이어 투표  -->
					</div>

					<div class="match-info">
						<div class="team red">
							<span>레드팀</span>
							<p>a팀</p>
						</div>
						<div class="score">3 : 1</div>
						<div class="team blue">
							<span>블루팀</span>
							<p>b팀</p>
						</div>
						<img src="resources/images/User_vote.png" style="cursor: pointer;"
							data-bs-toggle="modal" data-bs-target="#exampleModal">
						<!-- 베스트플레이어 투표  -->
					</div>
				</div>
			</div>

			<!-- 모달 -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">베스트 플레이어
								투표</h1>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<div class="my-bestplayer-vote">
								<!-- a팀 -->
								<div class="my-bestplayer-vote-a">
									<div>
										<img
											src="${pageContext.request.contextPath}/resources/images/Logo.png"
											style="width: 60px;"> <span>a팀</span>
									</div>
									<br>
									<table class="modal-ateam-table"
										style="width: 100%; text-align: center;">
										<tr>
											<td><div class="modal-ateam-table-img">
													<img
														src="${pageContext.request.contextPath}/resources/images/Logo.png"
														style="width: 50px;">
												</div></td>
											<td><div class="modal-ateam-table-name">이름 / 포지션</div></td>
											<td><div class="modal-bteam-table-vote-btn">
													<img
														src="${pageContext.request.contextPath}/resources/images/my_uncheck_vote.png">
												</div></td>
										</tr>
									</table>
									<hr>
								</div>
								<hr style="height: 3px; background-color: black;">
								<!-- B팀 -->
								<div class="my-bestplayer-vote-b">
									<div>
										<img
											src="${pageContext.request.contextPath}/resources/images/Logo.png"
											style="width: 60px;"> <span>b팀</span>
									</div>
									<br>
									<table class="modal-bteam-table"
										style="width: 100%; text-align: center;">
										<tr>
											<td><div class="modal-bteam-table-img">
													<img
														src="${pageContext.request.contextPath}/resources/images/Logo.png"
														style="width: 50px;">
												</div></td>
											<td><div class="modal-bteam-table-name">이름 / 포지션</div></td>
											<td><div class="modal-bteam-table-vote-btn">
													<img
														src="${pageContext.request.contextPath}/resources/images/my_uncheck_vote.png">
												</div></td>
										</tr>
									</table>
									<hr>
								</div>
								<hr style="height: 3px; background-color: black;">
							</div>
						</div>
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">구장 리뷰</h1>
						</div>
						<div class="modal-body">
							<div class="my-place-review-textarea">
								<textarea class="my-place-review-textarea-content"></textarea>
							</div>
						</div>
						<div class="modal-header">
							<h1 class="modal-title fs-5" id="exampleModalLabel">구장 별점</h1>
						</div>
						<div class="modal-body">
							<label for="rating" style="font-weight: bold;">별점 선택:</label> <select
								id="my-modal-start-rating" class="form-select">
								<!-- 1부터 5까지 0.5 단위로 옵션 추가 -->
								<option value="1">1.0</option>
								<option value="1.5">1.5</option>
								<option value="2">2.0</option>
								<option value="2.5">2.5</option>
								<option value="3">3.0</option>
								<option value="3.5">3.5</option>
								<option value="4">4.0</option>
								<option value="4.5">4.5</option>
								<option value="5">5.0</option>
							</select>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-bs-dismiss="modal">닫기</button>
							<button type="button" class="btn btn-primary">완료</button>
						</div>
					</div>
				</div>
			</div>

			<!-- 소속 구단 -->
			<div class="myTeamContainer">
				<i class="bi bi-caret-down-fill toggle-button" onclick="teamtoggleHeight(event)"></i>
				<div class="my-club">
					<h4 class="joinTitle">소속 구단</h4>
					<!-- 모바일 -->
					<div class="app-club-container">
						<div class="club-container">
							<div class="clubInfoContainer">
								<div class="club-info">
									<!-- 야구 구단 -->
									<div class="baseball">
										<div class="club-head">
											<p>야구</p>
											<div class="profile">
												<div class="profile-img-container">
													<div class="profile-circle"></div>
												</div>
												<p class="profile-name">이름</p>
												<div class="star-rating">
													<img
														src="${pageContext.request.contextPath}/resources/images/fill_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/half_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
												</div>
											</div>
										</div>
									</div>
									<div class="club-body">
										<h4>구단 정보</h4>
										<p>point : 1000</p>
										<p>인원수 : 11 / 11</p>
										<p>창설일 : 2024 / 01 / 01</p>
										<p>구단장 : 김단장</p>
									</div>
									<hr></hr>
								</div>
							</div>
						</div>

						<div class="club-container">
							<div class="clubInfoContainer">
								<div class="club-info">
									<!-- 야구 구단 -->
									<div class="baseketball">
										<div class="club-head">
											<p>농구</p>
											<div class="profile">
												<div class="profile-img-container">
													<div class="profile-circle"></div>
												</div>
												<p class="profile-name">이름</p>
												<div class="star-rating">
													<img
														src="${pageContext.request.contextPath}/resources/images/fill_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/half_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
												</div>
											</div>
										</div>
									</div>
									<div class="club-body">
										<h4>구단 정보</h4>
										<p>point : 2341</p>
										<p>인원수 : 11 / 11</p>
										<p>창설일 : 2023 / 06 / 03</p>
										<p>구단장 : 이단장</p>
									</div>
									<hr></hr>
								</div>
							</div>
						</div>

						<div class="club-container">
							<div class="clubInfoContainer">
								<div class="club-info">
									<!-- 야구 구단 -->
									<div class="soccer">
										<div class="club-head">
											<p>축구</p>
											<div class="profile">
												<div class="profile-img-container">
													<div class="profile-circle"></div>
												</div>
												<p class="profile-name">이름</p>
												<div class="star-rating">
													<img
														src="${pageContext.request.contextPath}/resources/images/fill_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/half_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
												</div>
											</div>
										</div>
									</div>
									<div class="club-body">
										<h4>구단 정보</h4>
										<p>point : 1032</p>
										<p>인원수 : 11 / 11</p>
										<p>창설일 : 2020 / 05 / 10</p>
										<p>구단장 : 박단장</p>
									</div>
									<hr></hr>
								</div>
							</div>
						</div>

						<div class="club-container">
							<div class="clubInfoContainer">
								<div class="club-info">
									<!-- 야구 구단 -->
									<div class="footsal">
										<div class="club-head">
											<p>풋살</p>
											<div class="profile">
												<div class="profile-img-container">
													<div class="profile-circle"></div>
												</div>
												<p class="profile-name">이름</p>
												<div class="star-rating">
													<img
														src="${pageContext.request.contextPath}/resources/images/fill_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/half_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
													<img
														src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
												</div>
											</div>
										</div>
									</div>
									<div class="club-body">
										<h6>※ 무소속 ※</h6>
									</div>
									<hr></hr>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 모바일 -->

				<!-- 데스크탑 -->
				<div class="desktop-club-container">
					<div class="club-container">
						<div class="clubInfoContainer">
							<div class="club-info">
								<!-- 야구 구단 -->
								<div class="baseball">
									<div class="club-head">
										<p>야구</p>
										<div class="profile">
											<div class="profile-img-container">
												<div class="profile-circle"></div>
											</div>
											<p class="profile-name">이름</p>
											<div class="star-rating">
												<img
													src="${pageContext.request.contextPath}/resources/images/fill_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/half_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
											</div>
										</div>
									</div>
								</div>
								<div class="club-body">
									<h4>구단 정보</h4>
									<p>point : 1000</p>
									<p>인원수 : 11 / 11</p>
									<p>창설일 : 2024 / 01 / 01</p>
									<p>구단장 : 김단장</p>
								</div>
								<hr></hr>
							</div>
						</div>
					</div>

					<div class="club-container">
						<div class="clubInfoContainer">
							<div class="club-info">
								<!-- 야구 구단 -->
								<div class="baseketball">
									<div class="club-head">
										<p>농구</p>
										<div class="profile">
											<div class="profile-img-container">
												<div class="profile-circle"></div>
											</div>
											<p class="profile-name">이름</p>
											<div class="star-rating">
												<img
													src="${pageContext.request.contextPath}/resources/images/fill_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/half_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
											</div>
										</div>
									</div>
								</div>
								<div class="club-body">
									<h4>구단 정보</h4>
									<p>point : 2341</p>
									<p>인원수 : 11 / 11</p>
									<p>창설일 : 2023 / 06 / 03</p>
									<p>구단장 : 이단장</p>
								</div>
								<hr></hr>
							</div>
						</div>
					</div>

					<div class="club-container">
						<div class="clubInfoContainer">
							<div class="club-info">
								<!-- 야구 구단 -->
								<div class="soccer">
									<div class="club-head">
										<p>축구</p>
										<div class="profile">
											<div class="profile-img-container">
												<div class="profile-circle"></div>
											</div>
											<p class="profile-name">이름</p>
											<div class="star-rating">
												<img
													src="${pageContext.request.contextPath}/resources/images/fill_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/half_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
											</div>
										</div>
									</div>
								</div>
								<div class="club-body">
									<h4>구단 정보</h4>
									<p>point : 1032</p>
									<p>인원수 : 11 / 11</p>
									<p>창설일 : 2020 / 05 / 10</p>
									<p>구단장 : 박단장</p>
								</div>
								<hr></hr>
							</div>
						</div>
					</div>

					<div class="club-container">
						<div class="clubInfoContainer">
							<div class="club-info">
								<!-- 야구 구단 -->
								<div class="footsal">
									<div class="club-head">
										<p>풋살</p>
										<div class="profile">
											<div class="profile-img-container">
												<div class="profile-circle"></div>
											</div>
											<p class="profile-name">이름</p>
											<div class="star-rating">
												<img
													src="${pageContext.request.contextPath}/resources/images/fill_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/half_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
												<img
													src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
											</div>
										</div>
									</div>
								</div>
								<div class="club-body">
									<h6>※ 무소속 ※</h6>
								</div>
								<hr></hr>
							</div>
						</div>
					</div>
				</div>

			</div>

			<!-- 구단 입단 신청 명단 -->
			<div class="joinTeamPeopleContainer">
			<i class="bi bi-caret-down-fill toggle-button" onclick="jointoggleHeight(event)"></i>
				<div class="joinTitle">구단 입단 신청 목록</div>
				<div class="joinBox">
					<div class="joinProfile">
						<img src="" alt="" /> <br />
						<div class="profile-text">신청자 아이디</div>
					</div>
					<div class="profile team-name">
						<img src="" alt="" /> <br />
						<div class="profile-text">구단 명</div>
					</div>
					<div class="buttons">
						<Button class="view-btn" data-bs-toggle="modal"
							data-bs-target="#exampleModaltwo">입단자 정보</Button>
						<Button class="approve-btn">승인</Button>
						<Button class="reject-btn">거절</Button>
					</div>
				</div>
				<br>
				<div class="joinBox">
					<div class="joinProfile">
						<img src="" alt="" /> <br />
						<div class="profile-text">신청자 아이디</div>
					</div>
					<div class="profile team-name">
						<img src="" alt="" /> <br />
						<div class="profile-text">구단 명</div>
					</div>
					<div class="buttons">
						<Button class="view-btn" data-bs-toggle="modal"
							data-bs-target="#exampleModaltwo">입단자 정보</Button>
						<Button class="approve-btn">승인</Button>
						<Button class="reject-btn">거절</Button>
					</div>
				</div>
				<br>
				<div class="joinBox">
					<div class="joinProfile">
						<img src="" alt="" /> <br />
						<div class="profile-text">신청자 아이디</div>
					</div>
					<div class="profile team-name">
						<img src="" alt="" /> <br />
						<div class="profile-text">구단 명</div>
					</div>
					<div class="buttons">
						<Button class="view-btn" data-bs-toggle="modal"
							data-bs-target="#exampleModaltwo">입단자 정보</Button>
						<Button class="approve-btn">승인</Button>
						<Button class="reject-btn">거절</Button>
					</div>
				</div>
				<br>
				<div class="joinBox">
					<div class="joinProfile">
						<img src="" alt="" /> <br />
						<div class="profile-text">신청자 아이디</div>
					</div>
					<div class="profile team-name">
						<img src="" alt="" /> <br />
						<div class="profile-text">구단 명</div>
					</div>
					<div class="buttons">
						<Button class="view-btn" data-bs-toggle="modal"
							data-bs-target="#exampleModaltwo">입단자 정보</Button>
						<Button class="approve-btn">승인</Button>
						<Button class="reject-btn">거절</Button>
					</div>
				</div>
				<br>
			</div>

		</div>
	</div>


	<!-- 모달 -->
	<div class="modal fade" id="exampleModaltwo" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">입단자 정보 보기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="my-modal-join-profile-img">
						<img
							src="${pageContext.request.contextPath}/resources/images/Logo.png"
							style="width: 120px;">
					</div>
					<br>
					<div class="my-modal-join-profile-id">
						<h4>이름</h4>
					</div>
					<br>
					<div class="my-modal-join-profile-info">
						<p>포지션 :</p>
						<p>실력 :</p>
						<p>평점 :</p>
						<p>나이 :</p>
						<p>성별 :</p>
						<hr>
						<p>소개 :</p>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	</div>
	<!-- myPage-container 끝 -->
	<!-- warp 끝 -->
	<!-- 푸터 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script>
	function toggleHeight(event) {
	    const container = event.target.closest('.MyRecordContainer');
	    const currentHeight = container.style.height;

	    // Toggle height between '50px' and 'max-content'
	    container.style.height = currentHeight === '50px' ? 'max-content' : '50px';
	}
	
	function teamtoggleHeight(event) {
	    const container = event.target.closest('.myTeamContainer');
	    const appClubContainer = document.querySelector('.app-club-container');
	    const currentHeight = container.style.height;

	    // Toggle height between '50px' and 'max-content'
	      if (currentHeight === '50px') {
	        appClubContainer.style.display = 'block'; // Show app-club-container
	        container.style.height = '100%';
	    } else {
	        appClubContainer.style.display = 'none'; // Hide app-club-container
	        container.style.height = '50px';
	    }
	}
	
	function jointoggleHeight(event) {
	    const container = event.target.closest('.joinTeamPeopleContainer');
	    const currentHeight = container.style.height;

	    // Toggle height between '50px' and 'max-content'
	    container.style.height = currentHeight === '50px' ? 'max-content' : '50px';
	}
	

	</script>
</body>
</html>