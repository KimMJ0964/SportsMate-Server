<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리스트 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stadium/listPage.css">

		<!-- jQuery -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
            rel="stylesheet">
</head>
<body>
<div class="wrap">
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<br>

<jsp:include page="/WEB-INF/views/common/nav.jsp" />

<hr class="line">

        <!-- 서버에서 activeDate 전달 -->
		<input type="hidden" id="active-date" value="${selectedDate}" />
		<div class="weekday-selector">
			<div id="weekdaySelector"></div>
		</div>
        
	<form id="searchForm" action="searchStadium.st" method="get">
        <div class="choice">
            <div class="mt-region-container">
                <select class="mt-region" name="activityArea" onchange="document.getElementById('searchForm').submit()">
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
            <div class="mt-start-container">
                <select class="mt-starttime" name="stadiumStartTime" onchange="document.getElementById('searchForm').submit()">
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
            </div>
            <p>~</p>
            <div class="mt-end-container">
                <select class="mt-endtime" name="stadiumEndTime" onchange="document.getElementById('searchForm').submit()">
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
	</form>
	
<section class="video-grid">
	<c:forEach var="stadiumSearch" items="${results}">
        <div class="video-priview">
            	<a href="detail.st?stadiumNo=${stadiumSearch.stadiumNo}">
                	<img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
                </a>
            <div class="video-info-grid" >
                <div class="video-info">
                	<p class="vider-author">${stadiumSearch.stadiumAddress}</p>
                	<p class="vider-title">${stadiumSearch.stadiumName}</p>
                	<p class="vider-state">${stadiumSearch.stadiumCategory} ${stadiumSearch.selectedDate}</p>
                </div>
            </div>
        </div>
	</c:forEach>
</section>
                    <div id="pagenation">
                        <nav>
                            <ul class="pagination">
                                <c:choose>
                                    <c:when test="${pi.currentPage != 1 || (pi.startPage / pi.boardLimit)  > 1}">
                                        <li class="page-item">
                                            <a href="searchStadium.st?category=${category}&cpage=1" class="page-link">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item disabled">
                                            <a href="#" class="page-link">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${pi.currentPage > 1}">
                                        <li class="page-item">
                                            <a href="searchStadium.st?category=${category}&cpage=${pi.currentPage - 1}"
                                                class="page-link">
                                                <span aria-hidden="true">&lt;</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item disabled">
                                            <a href="#" class="page-link">
                                                <span aria-hidden="true">&lt;</span>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}" step="1">
                                    <c:choose>
                                        <c:when test="${page == pi.currentPage}">
                                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item"><a class="page-link"
                                                    href="searchStadium.st?category=${category}&cpage=${page}">${page}</a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${pi.currentPage < pi.maxPage}">
                                        <li class="page-item">
                                            <a href="searchStadium.st?category=${category}&cpage=${pi.currentPage + 1}"
                                                class="page-link">
                                                <span aria-hidden="true">&gt;</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item disabled">
                                            <a href="#" class="page-link">
                                                <span aria-hidden="true">&gt;</span>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${pi.currentPage eq pi.maxPage}">
                                        <li class="page-item disabled">
                                            <a href="#" class="page-link">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:when test="${pi.currentPage  < pi.maxPage and pi.maxPage > 1}">
                                        <li class="page-item">
                                            <a href="searchStadium.st?category=${category}&cpage=${pi.maxPage}"
                                                class="page-link">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:when test="${(pi.endPage / boardLimit)  < pi.maxPage}">
                                        <li class="page-item">
                                            <a href="searchStadium.st?category=${category}&cpage=${pi.endPage + 1}"
                                                class="page-link">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item disabled">
                                            <a href="#" class="page-link">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </nav>
                    </div>
        
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</div>
<script src="${pageContext.request.contextPath}/resources/js/stadium/listPage.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stadium/Re-request.js"></script>
</body>
</html>