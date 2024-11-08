<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>header</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/common/header.css" rel="stylesheet" >
<link href="${pageContext.request.contextPath}/resources/css/common/modal.css" rel="stylesheet" >
<style>
</style>
</head>
<body>
	<!-- <div class="header-container">
		<div class="header-logo">
			<div>
				<a class="header-logo" href="index.jsp">
					<img src="${pageContext.request.contextPath}/resources/images/Logo.png" />
				</a>
			</div>
			<div>
				<p> SportMate </p>
			</div>
		</div>
		<div class="header-input">
			<form id="searchPlaceForm" action="List.sm" method="get">
				<input placeholder="구장명을 입력하시오." /> <img
					src="${pageContext.request.contextPath}/resources/images/search-btn.png" onclick="submitForm()" style="cursor: pointer;" />
			</form>
		</div>
		<div class="header-userImg">
			 <a href="login.me">
				<img src="${pageContext.request.contextPath}/resources/images/user_profile.png" />
			</a>
		</div>
	</div>

	<div class="additional-container">
		<div class="header-appTop">
			<div class="header-logo">
				<a class="header-logo" href="index.jsp">
					<img src="${pageContext.request.contextPath}/resources/images/Logo.png" />
				</a>
				<p> SportMate</p>
			</div>
			<div class="header-userImg">
				<a href="login.me">
					<img src="${pageContext.request.contextPath}/resources/images/user_profile.png" />
				</a>
			</div>
		</div>
		<div class="header-input">
			<form id="searchPlaceForm" action="List.sm" method="get">
				<input placeholder="구장명을 입력하시오." /> <img
					src="resources/img/search-btn.png" onclick="submitForm()" style="cursor: pointer;" />
			</form>
		</div>
	</div>
	
	<script>
	    function submitForm() {
	        document.getElementById("searchPlaceForm").submit(); // 폼 제출
	    }
	</script> -->

	<div class="header-div">
		<div class="logo-div">
			<img src="${pageContext.request.contextPath}/resources/images/Logo.png" class="logo-img" alt="">
			SportMate
		</div>

		<div class="search-bar" data-bs-toggle="modal" data-bs-target="#searchModal">
			<form action="" id="search-bar-form">
				<input type="text" placeholder="구장명을 입력하세요.">
				<button><img src="${pageContext.request.contextPath}/resources/images/search-btn.png" class="search-btn" ></button>
			</form>
		</div>

		<div class="user-icon">
			<img src="${pageContext.request.contextPath}/resources/images/user_profile.png" class="user-img" alt="">
		</div>
	</div>
	<div class="search-bar-m">
		<form action="" id="search-bar-form">
			<input type="text" placeholder="구장명을 입력하세요.">
			<button><img src="${pageContext.request.contextPath}/resources/images/search-btn.png" class="search-btn"></button>
		</form>
	</div>
	<!-- 모달 창 -->
    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">검색</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 상하좌우 테두리가 있는 박스 -->
                    <div class="input-box">
                        <!-- 첫 번째 줄: 구장명 검색 및 종류 선택 -->
                        <div class="row-group">
                            <!-- 구장명 검색 (80%) -->
                            <div class="search-group">
                                <img src="검색_아이콘_URL" alt="검색 아이콘" class="icon">
                                <input type="text" class="form-control" placeholder="구장명을 입력해주세요." aria-label="구장명">
                            </div>

                            <!-- 스포츠 종류 선택 (20%) -->
                            <div class="type-select-group">
                                <select class="form-select">
                                    <option>축구</option>
                                    <option>풋살</option>
                                    <option>야구</option>
                                    <option>농구</option>
                                </select>
                            </div>
                        </div>

                        <!-- 두 번째 줄: 날짜 선택 및 시간 선택 -->
                        <div class="row-group">
                            <!-- 날짜 선택 -->
                            <div class="date-time-group" id="date-selector" style="cursor: pointer;">
                                <img src="달력_아이콘_URL" alt="달력 아이콘" class="icon">
                                <span id="selected-date">날짜를 선택하세요</span>
                            </div>

                            <!-- 시간 선택 -->
                            <div class="date-time-group">
                                <img src="시간_아이콘_URL" alt="시간 아이콘" class="icon">
                                <select class="form-select">
                                    <option>07:00 ~ 11:00</option>
                                    <option>11:00 ~ 15:00</option>
                                    <option>15:00 ~ 19:00</option>
                                    <option>19:00 ~ 23:00</option>
                                </select>
                            </div>
                        </div>

                        <!-- 달력 내용 연결 -->
                        <div class="calendar-container" id="calendar-container">
                        <jsp:include page="/WEB-INF/views/calendar.jsp" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">검색하기</button>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script>
        const dateSelector = document.getElementById('date-selector');
        const selectedDateSpan = document.getElementById('selected-date');
        const calendarContainer = document.getElementById('calendar-container');

        dateSelector.addEventListener('click', () => {
            calendarContainer.style.display = (calendarContainer.style.display === 'none' || calendarContainer.style.display === '') ? 'flex' : 'none';
        });

        // 메시지 수신을 위한 이벤트 리스너 추가
        window.addEventListener('message', (event) => {
            if (event.origin === window.location.origin) { // 같은 출처에서 수신
                selectedDateSpan.innerText = event.data; // 선택한 날짜 표시
                calendarContainer.style.display = 'none'; // 달력 숨김
            }
        });
    </script>
</body>
</html>