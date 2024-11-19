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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
    <div class="search-bar-m">
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
   						<form action="" method="post" class="modal-form">
							<!-- 검색창 박스 -->
                            <div class="input-box">
                                <!-- 첫번째 줄 : 구장명 검색 및 종류 선택 -->
                                <div class="row-group">
                                    <!-- 구장명 검색(80%) -->
                                    <div class="search-group">
                                        <img src="" alt="검색아이콘" class="icon">
                                        <input type="text" class="form-control" placeholder="구장명을 입력해주세요.">
                                    </div>
                                    <!-- 스포츠 종류 선택(20%) -->
                                    <div class="type-select-group">
                                        <select class="form-select">
                                            <option>축구</option>
                                            <option>풋살</option>
                                            <option>야구</option>
                                            <option>농구</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- 두번째 줄 : 날짜 선택 및 시간 선택 -->
                                <div class="row-group">
                                    <!-- 날짜 선택 -->
                                    <div class="date-time-group" id="date-selector" style="cursor: pointer;">
                                        <img src="" alt="달력아이콘" class="icon">
                                        <span id="selected-date">날짜를 선택하세요.</span>
                                    </div>
                                    <!-- 시간 선택 -->
                                    <div class="date-time-group">
                                        <!-- 날짜 선택 -->
                                        <img src="" alt="시간 아이콘" class="icon">
                                        <select class="form-select">
                                            <option>시간을 선택해주세요.</option>
                                            <option>08:00 ~ 10:00</option>
                                            <option>10:00 ~ 12:00</option>
                                            <option>12:00 ~ 14:00</option>
                                            <option>14:00 ~ 16:00</option>
                                            <option>16:00 ~ 18:00</option>
                                            <option>18:00 ~ 20:00</option>
                                            <option>20:00 ~ 22:00</option>
                                            <option>22:00 ~ 24:00</option>
                                        </select>
                                    </div>
                                    <!-- 달력 내용 연결 -->
                                    <div class="calendar-container" id="calendar-container">
                                        <jsp:include page="/WEB-INF/views/common/calendar_header.jsp" />
                                    </div>
                                </div>
                            </div>	
   						</form>
   					</div>
   				</div>
   				<div class="modal-footer">
                    <button type="button" class="btn btn-primary">검색하기</button>
                </div>
   			</div>
   		</div>
   	</div>
    
</body>
</html>