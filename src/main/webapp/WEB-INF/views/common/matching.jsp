<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common/default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/common/matching.css">
</head>
<body>
	<div class="wrap">
		<div class="matching-container">
			<div class="matching-img">
				<div class="matching-img-box">
					<div class="matching-write">현재 진행중인 매칭</div>
					<img
						src="${pageContext.request.contextPath}/resources/images/matching.png"
						alt="매칭 이미지" class="matchingimg" />
				</div>
			</div>
		</div>
		
		 <!-- Swiper 컨테이너 -->
		<div class="swiper-container">
		    <div class="swiper-wrapper" id="weekdaySelector">
		        <!-- JavaScript에서 요일과 날짜가 동적으로 생성됩니다 -->
		    </div>
		</div>
		
		<div class="choice">
			<div class="mt-region-container">
				<select name="activityAreaTwo" id="activityAreaTwo"
					id="mt-regionTwo">
					<option disabled hidden>활동 지역을 선택하세요.</option>
					<option value="000-001" selected>서울시 강남구</option>
					<option value="000-002">서울시 강북구</option>
					<option value="000-003">서울시 종로구</option>
					<option value="000-004">서울시 중구</option>
					<option value="000-005">서울시 용산구</option>
					<option value="000-006">서울시 성동구</option>
					<option value="000-007">서울시 광진구</option>
					<option value="000-008">서울시 동대문구</option>
					<option value="000-009">서울시 중랑구</option>
					<option value="000-010">서울시 성북구</option>
					<option value="000-011">서울시 도봉구</option>
					<option value="000-012">서울시 노원구</option>
					<option value="000-013">서울시 노원구</option>
					<option value="000-014">서울시 은평구</option>
					<option value="000-015">서울시 서대문구</option>
					<option value="000-016">서울시 마포구</option>
					<option value="000-017">서울시 양천구</option>
					<option value="000-018">서울시 구로구</option>
					<option value="000-019">서울시 금천구</option>
					<option value="000-020">서울시 영등포구</option>
					<option value="000-021">서울시 동작구</option>
					<option value="000-022">서울시 관악구</option>
					<option value="000-023">서울시 서초구</option>
					<option value="000-024">서울시 송파구</option>
					<option value="000-025">서울시 강동구</option>
				</select>
			</div>
			<div class="mt-start-container">
				<select class="mt-starttime">
					<option value="05:00:00" selected>05:00</option>
					<option value="06:00:00">06:00</option>
					<option value="07:00:00">07:00</option>
					<option value="08:00:00">08:00</option>
					<option value="09:00:00">09:00</option>
					<option value="10:00:00">10:00</option>
					<option value="11:00:00">11:00</option>
					<option value="12:00:00">12:00</option>
					<option value="13:00:00">13:00</option>
					<option value="14:00:00">14:00</option>
					<option value="15:00:00">15:00</option>
					<option value="16:00:00">16:00</option>
					<option value="17:00:00">17:00</option>
					<option value="18:00:00">18:00</option>
					<option value="19:00:00">19:00</option>
					<option value="20:00:00">20:00</option>
					<option value="21:00:00">21:00</option>
					<option value="22:00:00">22:00</option>
					<option value="23:00:00">23:00</option>
					<option value="24:00:00">24:00</option>
				</select>
			</div>
			<p>~</p>
			<div class="mt-end-container">
				<select class="mt-endtime">
					<option value="23:00:00" selected>23:00</option>
					<option value="06:00:00">06:00</option>
					<option value="07:00:00">07:00</option>
					<option value="08:00:00">08:00</option>
					<option value="09:00:00">09:00</option>
					<option value="10:00:00">10:00</option>
					<option value="11:00:00">11:00</option>
					<option value="12:00:00">12:00</option>
					<option value="13:00:00">13:00</option>
					<option value="14:00:00">14:00</option>
					<option value="15:00:00">15:00</option>
					<option value="16:00:00">16:00</option>
					<option value="17:00:00">17:00</option>
					<option value="18:00:00">18:00</option>
					<option value="19:00:00">19:00</option>
					<option value="20:00:00">20:00</option>
					<option value="21:00:00">21:00</option>
					<option value="22:00:00">22:00</option>
					<option value="23:00:00">23:00</option>
					<option value="24:00:00">24:00</option>
				</select>
			</div>
		</div>
		<div class="tableContainer">

			<div class="table-row">
				<div class="table-cell time">18 : 00</div>
				<div class="table-cell location">서울 영등포 EA SPORTS FC B구장</div>
				<div class="table-cell">
					<button class="match-btn">매칭하기</button>
				</div>
			</div>
			<div class="table-row">
				<div class="table-cell time">19 : 00</div>
				<div class="table-cell location">부산 해운대 EA SPORTS FC A구장</div>
				<div class="table-cell">
					<button class="match-btn">매칭하기</button>
				</div>
			</div>
			<div class="table-row"></div>
		</div>
	</div>
	<script
		src="${pageContext.request.contextPath}/resources/js/mainPage/mainPage.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
</body>
</html>