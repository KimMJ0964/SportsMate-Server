<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
<style>
</style>
</head>
<body>

	<div class="wrap">
		<jsp:include page="/WEB-INF/views/common/jsp/header.jsp" />
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
				<div class="record-container">
					<h4>내 전적</h4>
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
						<img src="resources/img/User_vote.png" />
						<!-- 베스트플레이어 투표  -->
					</div>
					<div class="PlusMinusButton"></div>
				</div>
			</div>

			<!-- 소속 구단 -->
			<div class="myTeamContainer">
				<div class="my-club">
					<h4>소속 구단</h4>
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
												<img src="resources/img/fill_star.png" />
												<img src="resources/img/half_star.png" />
												<img src="resources/img/empty_star.png" />
												<img src="resources/img/empty_star.png" />
												<img src="resources/img/empty_star.png" />
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
					</div>
				</div>
			</div>

			<!-- 구단 입단 신청 명단 -->
			<div class="joinTeamPeopleContainer">
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
						<Button class="view-btn">입단자 정보</Button>
						<Button class="approve-btn">승인</Button>
						<Button class="reject-btn">거절</Button>
					</div>
				</div>
			</div>
		</div>
		<!-- myPage-container 끝 -->
	</div>
	<!-- warp 끝 -->

	<jsp:include page="/WEB-INF/views/common/jsp/footer.jsp" />
	<!-- 푸터 -->
</body>
</html>