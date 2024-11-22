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
                                    <!-- 구장명 검색(80%) -->
                                    <div class="search-group">
                                        <img src="${pageContext.request.contextPath}/resources/images/search-btn.png" alt="검색아이콘" class="icon">
                                        <input type="text" class="form-control" placeholder="구장명을 입력해주세요." name="stadiumName">
                                    </div>
                                    <!-- 스포츠 종류 선택(20%) -->
                                    <div class="type-select-group">
                                        <select class="form-select" name="stadiumCategory">
                                        	<option value="전체">전체</option>
                                            <option value="축구">축구</option>
                                            <option value="풋살">풋살</option>
                                            <option value="야구">야구</option>
                                            <option value="농구">농구</option>
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
                                            <option>시간을 선택해주세요.</option>
                                            <option value="08:00:00" ${stadiumStartTime == '08:00:00' ? 'selected' : ''}>08:00</option>
                                            <option value="10:00:00" ${stadiumStartTime == '10:00:00' ? 'selected' : ''}>10:00</option>
                                            <option value="12:00:00" ${stadiumStartTime == '12:00:00' ? 'selected' : ''}>12:00</option>
                                            <option value="14:00:00" ${stadiumStartTime == '14:00:00' ? 'selected' : ''}>14:00</option>
                                            <option value="16:00:00" ${stadiumStartTime == '16:00:00' ? 'selected' : ''}>16:00</option>
                                            <option value="18:00:00" ${stadiumStartTime == '18:00:00' ? 'selected' : ''}>18:00</option>
                                            <option value="20:00:00" ${stadiumStartTime == '20:00:00' ? 'selected' : ''}>20:00</option>
                                            <option value="22:00:00" ${stadiumStartTime == '22:00:00' ? 'selected' : ''}>22:00</option>
                                        </select>
                                        <select class="form-select" name="stadiumEndTime">
                                        	<option>시간을 선택해주세요.</option>
                                            <option value="10:00:00" ${stadiumEndTime == '10:00:00' ? 'selected' : ''}>10:00</option>
                                            <option value="12:00:00" ${stadiumEndTime == '12:00:00' ? 'selected' : ''}>12:00</option>
                                            <option value="14:00:00" ${stadiumEndTime == '14:00:00' ? 'selected' : ''}>14:00</option>
                                            <option value="16:00:00" ${stadiumEndTime == '16:00:00' ? 'selected' : ''}>16:00</option>
                                            <option value="18:00:00" ${stadiumEndTime == '18:00:00' ? 'selected' : ''}>18:00</option>
                                            <option value="20:00:00" ${stadiumEndTime == '20:00:00' ? 'selected' : ''}>20:00</option>
                                            <option value="22:00:00" ${stadiumEndTime == '22:00:00' ? 'selected' : ''}>22:00</option>
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