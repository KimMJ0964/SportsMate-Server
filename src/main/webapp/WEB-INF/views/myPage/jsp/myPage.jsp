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

	.wrap {
		max-width: 1200px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.myPage-container {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		gap: 20px;
	}
	
	/* 내 프로필 */
	.MyInfoContainer {
		width: 25%;
		margin: 10px 0;
		padding: 10px;
		border-radius: 5px;
		background-color: white;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
		display: flex;
		flex-direction: column;
		align-items: center; /* 가운데 정렬 */
		justify-content: center; /* 세로 가운데 정렬 */
	}
	
	MyInfoContainer img {
		width: 150px;
		height: 150px;
		border-radius: 50%;
		object-fit: cover;
		margin-bottom: 10px;
		background-color: gray;
	}
	
	.profile-buttons {
		display: flex; /* 버튼을 가로로 배치 */
		justify-content: space-between; /* 버튼 간의 간격을 동일하게 유지 */
		width: 100%; /* 버튼들이 부모의 너비를 가지게 함 */
		margin-top: 10px; /* 버튼 위쪽에 간격을 추가 */
	}
	
	/* 내 전적 */
	.MyRecordContainer {
		width: 60%;
		margin: 10px 0;
		padding: 10px;
		border-radius: 5px;
		background-color: white;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
	}
	
	.record-container h3, .my-club h3 {
		margin: 0;
	}
	
	.stats-container {
		display: flex;
		justify-content: space-between;
		margin: 10px 0;
		gap: 30%;
	}
	
	.AllCountBox, .VictoryCountBox {
		flex: 1;
		padding: 10px;
		border: 3px solid #307DFA;
		border-radius: 5px;
		text-align: center;
		margin: 0 5px;
	}
	
	.modify-btn, .secession-btn {
		flex: 1;
		padding: 10px;
		border-radius: 5px;
		text-align: center;
		margin: 0 5px;
		color: white;
		border-style: none;
		font-weight: bold;
	}
	
	.modify-btn {
		background-color: #307DFA;
	}
	
	.secession-btn {
		background-color: #FA1D1D;
	}
	
	.modify-btn p, .secession-btn p {
		margin: 0;
		font-size: 14px;
		color: #333;
		flex: 1;
	}
	
	.all, .victory {
		font-weight: bold;
	}
	
	.match-info {
		display: flex;
		align-items: center;
		justify-content: space-around;
		padding: 15px;
		border: 3px solid #307DFA;
		border-radius: 5px;
		margin-top: 10px;
	}
	
	.team {
		display: flex;
		flex-direction: column;
		align-items: center;
		font-size: 14px;
	}
	
	.team span {
		width: 30px;
		height: 30px;
		border-radius: 50%;
		display: flex;
		align-items: center;
		justify-content: center;
		font-weight: bold;
		color: white;
	}
	
	.team.red span {
		background-color: #ff6b6b;
	}
	
	.team.blue span {
		background-color: #6bc5ff;
	}
	
	.score {
		font-size: 24px;
		font-weight: bold;
	}
	
	.match-info img {
		width: 35px;
	}
	
	/* 소속 구단 */
	.myTeamContainer {
		width: 60%;
		margin: 10px 0;
		padding: 10px;
		border-radius: 5px;
		background-color: white;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
	}
	
	.club-container {
		display: flex;
		align-items: center;
		justify-content: space-around;
		padding: 15px;
		margin-top: 10px;
	}
	
	.ClubInfoContainer {
		display: flex;
		justify-content: flex-end;
		margin-top: 10px;
	}
	
	.club-info {
		display: flex;
		flex-direction: column;
		padding-left: 35px;
		padding-right: 35px;
		padding-bottom: 15px;
		border: 3px solid #307DFA;
		border-radius: 5px;
		margin-top: 10px;
		
	}
	
	.club-head {
		margin-top: 10px;
	}
	
	.profile {
		margin-top: 10px;
	}
	
	.profile-image {
		width: 53px;
		height: 53px;
		border-radius: 50%; /* 원형으로 만들기 */
	}
	
	.profile-name {
		font-size: 14px;
		font-weight: bold;
		margin: 5px 0; /* 이름과 별 사이의 여백 */
		text-align: center;
	}
	
	.stars {
		display: flex;
		justify-content: center;
	}
	
	.star {
		width: 25px;
		height: 25px;
		margin: 0 2px; /* 별 사이의 간격 */
	}
	
	.profile-img-container {
		display: flex;
		justify-content: center;
	}
	
	.profile-circle {
		width: 53px;
		height: 53px;
		border-radius: 50%; /* 원형으로 만들기 */
		background-color: #007bff; /* 원하는 색상으로 변경 */
		display: inline-block; /* 프로필과 이름을 가로로 정렬 */
	}
	
	.club-body {
		padding: 5px 5px 5px 5px;
		border: 3px solid #307DFA;
		border-radius: 5px;
		margin-top: 10px;
		text-align: center;
	}
	
	.club-body p {
		margin: 0 2px;
		text-align: left;
	}
	
	.club-body h4 {
		margin-top: 5px;
		margin-bottom: 5px;
	}
	
	.star-rating {
	    display: flex;
	    justify-content: center; /* 별을 가운데 정렬 */
	    margin-top: 5px; /* 필요시 여백 추가 */
	}
	
	.star-rating img {
		width: 24px;
	}
	
	/* 구단 입단 명단 */
	.joinTeamPeopleContainer {
		width: 60%;
		margin: auto;
		padding: 20px;
		border: 1px solid #ccc;
		border-radius: 10px;
		box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
		margin-bottom: 100px;
	}
	
	.joinTitle {
		font-size: 1.2em;
		font-weight: bold;
		margin-bottom: 15px;
	}
	
	.joinBox {
		border: 2px solid #007bff;
		padding: 20px;
		display: flex;
		align-items: center;
		justify-content: space-between;
		border-radius: 8px;
	}
	
	.joinProfile {
		display: flex;
		flex-direction: column;
		align-items: center;
		text-align: center;
	}
	
	.joinProfile img {
		width: 50px;
		height: 50px;
		border-radius: 50%;
		background-color: #e0e0e0;
	}
	
	.profile-text {
		margin-top: 5px;
		font-weight: bold;
	}
	
	.team-name {
		border: 2px solid #007bff;
		border-radius: 8px;
		padding: 20px;
		display: flex;
		flex-direction: column;
		align-items: center;
  		text-align: center;
	}
	
	.buttons {
		width: 25%;
		display: flex;
		flex-direction: column;
		gap: 10px;
	}
	
	.buttons button {
		width: 100%;
		padding: 10px 15px;
		font-weight: bold;
		border: none;
		border-radius: 5px;
		color: white;
		cursor: pointer;
	}
	
	.view-btn {
		background-color: #007bff;
	}
	
	.approve-btn {
		background-color: #007bff;
	}
	
	.reject-btn {
		background-color: #dc3545;
	}
	
	.reject-btn: hover {
		background-color: #f50017;
	}
	
	@media (max-width: 430px) {
		.MyInfoContainer {
			width: 90%;
		}
		
		.MyRecordContainer {
			width: 90%;
		}
		
		.myTeamContainer {
			width: 90%;
		}
		
		.joinTeamPeopleContainer {
			width: 90%;
		}
		
		.view-btn {
			font-size: 12px;
		}
		
		.joinBox {
			padding: 5px;
		}
	}
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