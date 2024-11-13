<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<p>이름 : ${myInfo.memName }</p>
					<p>주소 : ${myInfo.memAdd }</p>
					<p>성별 : 
					    <c:choose>
					        <c:when test="${myInfo.memGender == 'M'}">남자</c:when>
					        <c:otherwise>여자</c:otherwise>
					    </c:choose>
					</p>
					<p>나이 : ${myInfo.memAge }</p>
					<p>점수 : ${myInfo.memRank }</p>
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
							<div class="all_count">${myMatchCount}번</div>
						</div>
						<div class="VictoryCountBox">
							<div class="victory">승리 횟수</div>
							<div class="victory_count">${myMatchWinCount}번</div>
						</div>
					</div>
					<c:forEach var="mm" items="${myMatch}">
						<div class="match-info">
							<div class="team red">
								<span>${mm.teamAName }</span>
								<p>${mm.teamAName }</p>
							</div>
							<div class="score">${mm.scoreA} : ${mm.scoreB}</div>
							<div class="team blue">
								<span>${mm.teamBName }</span>
								<p>${mm.teamBName }</p>
							</div>
							<img class="bestplayer-btn" src="resources/images/User_vote.png" style="cursor: pointer;"
								data-bs-toggle="modal" data-bs-target="#exampleModal" data-placeno="${mm.placeNo}"
								data-matchno="${mm.matchNo}">
						</div>
					</c:forEach>
				</div>
			</div>

			<!-- 모달 -->
			<div class="modal fade" id="exampleModal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<form>
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
							
							<input id="applicantPlaceNo" >
							
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
					</form>
				</div>
			</div>

			<!-- 소속 구단 -->
			<div class="myTeamContainer">
				<i class="bi bi-caret-down-fill toggle-button" onclick="teamtoggleHeight(event)"></i>
				<div class="my-club">
					<h4 class="joinTitle">소속 구단</h4>
					<!-- 모바일 -->
					<div class="app-club-container">
						<c:forEach var="mt" items="${myTeam}">
					<div class="club-container">
						<div class="clubInfoContainer">
							<div class="club-info">
								<!-- 야구 구단 -->
								<div class="baseball">
									<div class="club-head">
										<p>${mt.teamType }</p>
										<div class="profile">
											<div class="profile-img-container">
												<div class="profile-circle"></div>
											</div>
											<p class="profile-name">${mt.teamName }</p>
											<div class="star-rating">
												<c:forEach var="i" begin="1" end="5">
											        <c:choose>
											            <c:when test="${mt.score >= i}">
											                <img src="${pageContext.request.contextPath}/resources/images/fill_star.png" />
											            </c:when>
											            <c:when test="${mt.score >= (i - 0.5) && mt.score < i}">
											                <img src="${pageContext.request.contextPath}/resources/images/half_star.png" />
											            </c:when>
											            <c:otherwise>
											                <img src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
											            </c:otherwise>
											        </c:choose>
											    </c:forEach>
											</div>
										</div>
									</div>
								</div>
								<div class="club-body">
									<h5>구단 정보</h5>
									<p>point : ${mt.teamPoint }</p>
									<p>인원수 : ${mt.teamMemberCount} / ${mt.teamMaxPerson } </p>
									<p>창설일 : ${mt.teamEnrollDate }</p>
									<p>구단장 : ${mt.memName }</p>
								</div>
								<hr></hr>
							</div>
						</div>
					</div>
					</c:forEach>

						
					</div>
				</div>
				<!-- 모바일 -->

				<!-- 데스크탑 -->
				<div class="desktop-club-container">
				<c:forEach var="mt" items="${myTeam}">
					<div class="club-container" onclick="location.href = 'boardList.tm?tno=${mt.teamNo}'">
						<div class="clubInfoContainer">
							<div class="club-info">
								<!-- 야구 구단 -->
								<div class="baseball">
									<div class="club-head">
										<p>${mt.teamType }</p>
										<div class="profile">
											<div class="profile-img-container">
												<div class="profile-circle"></div>
											</div>
											<p class="profile-name">${mt.teamName }</p>
											<div class="star-rating">
												<c:forEach var="i" begin="1" end="5">
											        <c:choose>
											            <c:when test="${mt.score >= i}">
											                <img src="${pageContext.request.contextPath}/resources/images/fill_star.png" />
											            </c:when>
											            <c:when test="${mt.score >= (i - 0.5) && mt.score < i}">
											                <img src="${pageContext.request.contextPath}/resources/images/half_star.png" />
											            </c:when>
											            <c:otherwise>
											                <img src="${pageContext.request.contextPath}/resources/images/empty_star.png" />
											            </c:otherwise>
											        </c:choose>
											    </c:forEach>
											</div>
										</div>
									</div>
								</div>
								<div class="club-body">
									<h5>구단 정보</h5>
									<p>point : ${mt.teamPoint }</p>
									<p>인원수 : ${mt.teamMemberCount} / ${mt.teamMaxPerson } </p>
									<p>창설일 : ${mt.teamEnrollDate }</p>
									<p>구단장 : ${mt.memName }</p>
								</div>
								<hr></hr>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>

			</div>

			<!-- 구단 입단 신청 명단 -->
			<div class="joinTeamPeopleContainer">
			<i class="bi bi-caret-down-fill toggle-button" onclick="jointoggleHeight(event)"></i>
				<div class="joinTitle">구단 입단 신청 목록</div>
				<c:forEach var="mr" items="${myRecruit}">
					<div class="joinBox">
						<div class="joinProfile">
							<img src="" alt="" /> <br />
							<div class="profile-text">${mr.memName }</div>
						</div>
						<div class="profile team-name">
							<img src="" alt="" /> <br />
							<div class="profile-text">${mr.teamName }</div>
						</div>
						<div class="buttons">
							<Button class="view-btn" data-bs-toggle="modal"
								data-bs-target="#exampleModaltwo"
								data-name="${mr.memName}"
		                        data-age="${mr.memAge}"
								data-gender="${mr.memGender}"
								data-rank="${mr.memRank}"
								data-abl="${mr.ability}"
								data-posi="${mr.position}"
								data-intro="${mr.introduce }"
		                        	>입단자 정보</Button>
							<Button class="approve-btn" onclick="location.href = 'approveJoin.tm?mno=${mr.memNo}&tno=${mr.teamNo }'">승인</Button>
							<Button class="reject-btn" onclick="location.href = 'rejectJoin.tm?mno=${mr.memNo}'">거절</Button>
						</div>
					</div>
					<br>
				</c:forEach>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/footer.jsp" />
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
						 <h4 id="applicantName"></h4>
					</div>
					<br>
					<div class="my-modal-join-profile-info">
						<p>포지션 : <span id="applicantPosi"></span></p>
						<p>실력 : <span id="applicantAbl"></span></p>
						<p>평점 : <span id="applicantRank"></span></p>
						<p>나이 : <span id="applicantAge"></span></p>
						<p>성별 : <span id="applicantGender"></span></p>
						<hr>
						<p>소개 : <span id="applicantIntro"></span></p>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- myPage-container 끝 -->
	<!-- warp 끝 -->
	<!-- 푸터 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/myPage/myPage.js"></script>
	<script>
	 const viewButtons = document.querySelectorAll('.view-btn');
	 const bestPlayerButtons = document.querySelectorAll('.bestplayer-btn');
	 
	    viewButtons.forEach(button => {
	        button.addEventListener('click', function() {
	            // 클릭된 버튼에서 data-* 속성 값을 가져옴
	            const name = this.getAttribute('data-name');
	            const age = this.getAttribute('data-age');
	            const gender = this.getAttribute('data-gender');
	            const rank = this.getAttribute('data-rank');
	            const abl = this.getAttribute('data-abl');
	            const posi = this.getAttribute('data-posi');
	            const intro = this.getAttribute('data-intro');
	            
	            const genderText = gender === 'M' ? '남자' : gender === 'F' ? '여자' : gender;
	            
	            // 모달 내용 업데이트
	            document.getElementById('applicantName').textContent = name;
	            document.getElementById('applicantAge').textContent = age;
	            document.getElementById('applicantGender').textContent = genderText;
	            document.getElementById('applicantRank').textContent = rank;
	            document.getElementById('applicantAbl').textContent = abl;
	            document.getElementById('applicantPosi').textContent = posi;
	            document.getElementById('applicantIntro').textContent = intro;
	        });
	    });
	    
	    bestPlayerButtons.forEach(img => {
	        img.addEventListener('click', function() {
	            // 클릭된 버튼에서 data-* 속성 값을 가져옴
	            const placeNo = this.getAttribute('data-placeno');
	            const matchNo = this.getAttribute('data-matchno');
	            
	            document.getElementById('applicantPlacNo').textContent = placeNo;
	            document.getElementById('applicantMatchNo').textContent = matchNo;
	        });
	    });
	</script>
</body>
</html>