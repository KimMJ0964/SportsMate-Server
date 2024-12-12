<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
          rel="stylesheet">
    <link
            href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
            rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="${pageContext.request.contextPath}/resources/css/common/header.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/modal.css">
    <style>
    </style>
</head>
<body>
    <c:if test="${not empty alertMsg}">
        <script>
            alert("${alertMsg}");
        </script>
        <c:remove var="alertMsg" scope="session"/>
    </c:if>
    <div class="header-div">
        <div class="logo-div" onclick="location.href = '${pageContext.request.contextPath}'">
            <img src="${pageContext.request.contextPath}/resources/images/Logo.png" class="logo-img" alt=""
                 onclick="location.href = '/'">
            SportMate
        </div>

        <div class="search-bar" data-bs-toggle="modal" data-bs-target="#find">
            <form action="" id="search-bar-form">
                <input type="text" placeholder="구장명을 입력하세요.">
                <button><img src="${pageContext.request.contextPath}/resources/images/search-btn.png" class="search-btn"></button>
            </form>
        </div>
        <div class="user-icon">
            <c:choose>
                <c:when test="${loginMember.memStatus.equals('A')}">
                    <img src="${pageContext.request.contextPath}/resources/images/user_profile.png" class="user-img"
                         alt="" onclick="location.href = '${pageContext.request.contextPath}/adminPage.me'">
                </c:when>
                <c:when test="${loginMember.memStatus.equals('M')}">
                    <img src="${pageContext.request.contextPath}/resources/images/user_profile.png" class="user-img"
                         alt="" onclick="location.href = '${pageContext.request.contextPath}/managermypage.me'">
                </c:when>
                <c:when test="${loginMember.memStatus.equals('Y')}">
                    <img src="${pageContext.request.contextPath}/resources/images/user_profile.png" class="user-img"
                         alt="" onclick="location.href = '${pageContext.request.contextPath}/myPageInfo.mp'">
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/resources/images/user_profile.png" class="user-img"
                         alt="" onclick="location.href = '${pageContext.request.contextPath}/loginForm.me'">
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <div class="search-bar-m" data-bs-toggle="modal" data-bs-target="#find">
        <form action="" id="search-bar-form">
            <input type="text" placeholder="구장명을 입력하세요.">
            <button><img src="${pageContext.request.contextPath}/resources/images/search-btn.png" class="search-btn">
            </button>
        </form>
    </div>
   	<!-- 검색 창 모달 -->
   	<div class="modal fade" id="find" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
   		<div class="modal-dialog modal-lg">
   			<div class="modal-content">
   				
   				<!-- Modal Header -->
   				<div>
   					<div class="modal-header">
   						<h4 class="modal-title">구장 찾기</h4>
   						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
   					</div>
   					<!-- Modal body -->
   					<div class="modal-body">
   						<form action="searchStadium.st" method="post" class="modal-form">
							<!-- 검색창 박스 -->
                            <div class="input-box">
                                <!-- 첫번째 줄 : 구장명 검색 및 종류 선택 -->
                                <div class="row-group">
                                    <!-- 구장명 검색 -->
                                    <div class="search-group">
                                        <img src="${pageContext.request.contextPath}/resources/images/search-btn.png" alt="검색아이콘" class="icon">
                                        <input type="text" class="form-control" placeholder="구장명을 입력해주세요." name="stadiumName">
                                    </div>
                                    <div class="type-select-group">
                                    	<select class="form-select" name="activityArea">
                                        	<option value="전체" ${activityArea == '전체' ? 'selected' : ''}>전체</option>
						                    <option value="000-001" ${activityArea == '000-001' ? 'selected' : ''}>서울시 강남구</option>
						                    <option value="000-002" ${activityArea == '000-002' ? 'selected' : ''}>서울시 강북구</option>
						                    <option value="000-003" ${activityArea == '000-003' ? 'selected' : ''}>서울시 종로구</option>
						                    <option value="000-004" ${activityArea == '000-004' ? 'selected' : ''}>서울시 중구</option>
						                    <option value="000-005" ${activityArea == '000-005' ? 'selected' : ''}>서울시 용산구</option>
						                    <option value="000-006" ${activityArea == '000-006' ? 'selected' : ''}>서울시 성동구</option>
						                    <option value="000-007" ${activityArea == '000-007' ? 'selected' : ''}>서울시 광진구</option>
						                    <option value="000-008" ${activityArea == '000-008' ? 'selected' : ''}>서울시 동대문구</option>
						                    <option value="000-009" ${activityArea == '000-009' ? 'selected' : ''}>서울시 중랑구</option>
						                    <option value="000-010" ${activityArea == '000-010' ? 'selected' : ''}>서울시 성북구</option>
						                    <option value="000-011" ${activityArea == '000-011' ? 'selected' : ''}>서울시 도봉구</option>
						                    <option value="000-012" ${activityArea == '000-012' ? 'selected' : ''}>서울시 노원구</option>
						                    <option value="000-013" ${activityArea == '000-013' ? 'selected' : ''}>서울시 노원구</option>
						                    <option value="000-014" ${activityArea == '000-014' ? 'selected' : ''}>서울시 은평구</option>
						                    <option value="000-015" ${activityArea == '000-015' ? 'selected' : ''}>서울시 서대문구</option>
						                    <option value="000-016" ${activityArea == '000-016' ? 'selected' : ''}>서울시 마포구</option>
						                    <option value="000-017" ${activityArea == '000-017' ? 'selected' : ''}>서울시 양천구</option>
						                    <option value="000-018" ${activityArea == '000-018' ? 'selected' : ''}>서울시 구로구</option>
						                    <option value="000-019" ${activityArea == '000-019' ? 'selected' : ''}>서울시 금천구</option>
						                    <option value="000-020" ${activityArea == '000-020' ? 'selected' : ''}>서울시 영등포구</option>
						                    <option value="000-021" ${activityArea == '000-021' ? 'selected' : ''}>서울시 동작구</option>
						                    <option value="000-022" ${activityArea == '000-022' ? 'selected' : ''}>서울시 관악구</option>
						                    <option value="000-023" ${activityArea == '000-023' ? 'selected' : ''}>서울시 서초구</option>
						                    <option value="000-024" ${activityArea == '000-024' ? 'selected' : ''}>서울시 송파구</option>
						                    <option value="000-025" ${activityArea == '000-025' ? 'selected' : ''}>서울시 강동구</option>
                                        </select>
                                    </div>
                                    <!-- 스포츠 종류 선택 -->
                                    <div class="type-select-group">
                                        <select class="form-select" name="stadiumCategory">
                                        	<option value="전체" ${stadiumCategory == '전체' ? 'selected' : ''}>전체</option>
                                            <option value="soccer" ${stadiumCategory == 'soccer' ? 'active' : ''}>축구</option>
                                            <option value="futsal" ${stadiumCategory == 'futsal' ? 'active' : ''}>풋살</option>
                                            <option value="baseball" ${stadiumCategory == 'baseball' ? 'active' : ''}>야구</option>
                                            <option value="basketball" ${stadiumCategory == 'basketball' ? 'active' : ''}>농구</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- 두번째 줄 : 날짜 선택 및 시간 선택 -->
                                <div class="row-group">
                                    <!-- 날짜 선택 -->
                                    <div class="date-group" id="date-selector" style="cursor: pointer;">
                                        <img src="${pageContext.request.contextPath}/resources/images/calendar.png" alt="달력아이콘" class="icon">
                                        <span id="selected-date">날짜를 선택하세요.</span>
                                        <!-- 숨겨진 input 필드 -->
                                        <input type="hidden" name="selectedDate" id="hidden-selected-date">
                                    </div>
                                    <!-- 시간 선택 -->
                                    <div class="time-group">
                                        <img src="${pageContext.request.contextPath}/resources/images/time.png" alt="시간 아이콘" class="icon">
                                        <select class="form-select" name="stadiumStartTime">
                                            <option value="" disabled selected>시간을 선택해주세요.</option>
                                            <option value="05:00:00" ${stadiumStartTime == '05:00:00' ? 'selected' : ''}>05:00</option>
                                            <option value="06:00:00" ${stadiumStartTime == '06:00:00' ? 'selected' : ''}>06:00</option>
                                            <option value="07:00:00" ${stadiumStartTime == '07:00:00' ? 'selected' : ''}>07:00</option>
                                            <option value="08:00:00" ${stadiumStartTime == '08:00:00' ? 'selected' : ''}>08:00</option>
                                            <option value="09:00:00" ${stadiumStartTime == '09:00:00' ? 'selected' : ''}>09:00</option>
                                            <option value="10:00:00" ${stadiumStartTime == '10:00:00' ? 'selected' : ''}>10:00</option>
                                            <option value="11:00:00" ${stadiumStartTime == '11:00:00' ? 'selected' : ''}>11:00</option>
                                            <option value="12:00:00" ${stadiumStartTime == '12:00:00' ? 'selected' : ''}>12:00</option>
                                        </select>
                                        <select class="form-select" name="stadiumEndTime">
                                        	<option value="" disabled selected>시간을 선택해주세요.</option>
                                            <option value="13:00:00" ${stadiumEndTime == '13:00:00' ? 'selected' : ''}>13:00</option>
                                            <option value="14:00:00" ${stadiumEndTime == '14:00:00' ? 'selected' : ''}>14:00</option>
                                            <option value="15:00:00" ${stadiumEndTime == '15:00:00' ? 'selected' : ''}>15:00</option>
                                            <option value="16:00:00" ${stadiumEndTime == '16:00:00' ? 'selected' : ''}>16:00</option>
                                            <option value="17:00:00" ${stadiumEndTime == '17:00:00' ? 'selected' : ''}>17:00</option>
                                            <option value="18:00:00" ${stadiumEndTime == '18:00:00' ? 'selected' : ''}>18:00</option>
                                            <option value="19:00:00" ${stadiumEndTime == '19:00:00' ? 'selected' : ''}>19:00</option>
                                            <option value="20:00:00" ${stadiumEndTime == '20:00:00' ? 'selected' : ''}>20:00</option>
                                            <option value="21:00:00" ${stadiumEndTime == '21:00:00' ? 'selected' : ''}>21:00</option>
						                    <option value="22:00:00" ${stadiumEndTime == '22:00:00' ? 'selected' : ''}>22:00</option>
						                    <option value="23:00:00" ${stadiumEndTime == '23:00:00' ? 'selected' : ''}>23:00</option>
						                    <option value="24:00:00" ${stadiumEndTime == '24:00:00' ? 'selected' : ''}>24:00</option>
                                        </select>
                                    </div>
                                </div>
                                 <!-- 달력 내용 연결 -->
                                 <div class="calendar hidden" id="calendar-container">
                                 	<jsp:include page="/WEB-INF/views/common/calendar_header.jsp" />
                                 </div>
                            </div>
                            <div class="modal-footer">
                    			<button type="submit" class="btn btn-primary">검색하기</button>
                			</div>	
   						</form>
   					</div>
   				</div>
   			</div>
   		</div>
   	</div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script>
		document.addEventListener("DOMContentLoaded", function () {
	        const dateSelector = document.getElementById("date-selector");
	        const calendarContainer = document.getElementById("calendar-container");
	
	        dateSelector.addEventListener("click", function () {
	            // hidden 클래스 토글
	            calendarContainer.classList.toggle("hidden");
	        });
	
	        // 달력에서 날짜를 클릭하면 선택된 날짜를 텍스트에 반영
	        calendarContainer.addEventListener("click", function (e) {
	            if (e.target.tagName === "LI" && !e.target.classList.contains("inactive")) {
	                const selectedDate = e.target.dataset.date;
	                document.getElementById("selected-date").innerText = selectedDate;
	
	                // 달력 숨기기
	                calendarContainer.classList.add("hidden");
	            }
	        });
	    });
    </script>
</body>
</html>