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
		<div class="weekday-selector" id="weekdaySelector"></div>
        
	<form id="searchForm" action="searchStadium.st" method="get">
        <div class="choice">
            <div class="mt-region-container">
                <select class="mt-region" name="stadiumAddress" onchange="document.getElementById('searchForm').submit()">
                    <option value="전체" ${stadiumAddress == '전체' ? 'selected' : ''}>전체</option>
                    <option value="서울" ${stadiumAddress == '서울' ? 'selected' : ''}>서울</option>
                    <option value="부산" ${stadiumAddress == '부산' ? 'selected' : ''}>부산</option>
                    <option value="대구" ${stadiumAddress == '대구' ? 'selected' : ''}>대구</option>
                    <option value="인천" ${stadiumAddress == '인천' ? 'selected' : ''}>인천</option>
                    <option value="광주" ${stadiumAddress == '광주' ? 'selected' : ''}>광주</option>
                    <option value="대전" ${stadiumAddress == '대전' ? 'selected' : ''}>대전</option>
                    <option value="울산" ${stadiumAddress == '울산' ? 'selected' : ''}>울산</option>
                    <option value="세종" ${stadiumAddress == '세종' ? 'selected' : ''}>세종</option>
                </select>
            </div>
            <div class="mt-start-container">
                <select class="mt-starttime" name="stadiumStartTime" onchange="document.getElementById('searchForm').submit()">
					<option value="" disabled selected>시간을 선택해주세요.</option>
                    <option value="08:00:00" ${stadiumStartTime == '08:00:00' ? 'selected' : ''}>08:00</option>
                    <option value="10:00:00" ${stadiumStartTime == '10:00:00' ? 'selected' : ''}>10:00</option>
                    <option value="12:00:00" ${stadiumStartTime == '12:00:00' ? 'selected' : ''}>12:00</option>
                    <option value="14:00:00" ${stadiumStartTime == '14:00:00' ? 'selected' : ''}>14:00</option>
                    <option value="16:00:00" ${stadiumStartTime == '16:00:00' ? 'selected' : ''}>16:00</option>
                    <option value="18:00:00" ${stadiumStartTime == '18:00:00' ? 'selected' : ''}>18:00</option>
                    <option value="20:00:00" ${stadiumStartTime == '20:00:00' ? 'selected' : ''}>20:00</option>
                    <option value="22:00:00" ${stadiumStartTime == '22:00:00' ? 'selected' : ''}>22:00</option>
                </select>
            </div>
            <p>~</p>
            <div class="mt-end-container">
                <select class="mt-endtime" name="stadiumEndTime" onchange="document.getElementById('searchForm').submit()">
                	<option value="" disabled selected>시간을 선택해주세요.</option>
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
	</form>
	
<section class="video-grid">
	<c:forEach var="StadiumSearch" items="${results}">
        <div class="video-priview">
            	<a href="detail.st">
                	<img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
                </a>
            <div class="video-info-grid" >
                <div class="video-info">
                	<p class="vider-author">${StadiumSearch.stadiumAddress}</p>
                	<p class="vider-title">${StadiumSearch.stadiumName}</p>
                	<p class="vider-state">${StadiumSearch.stadiumCategory} ${StadiumSearch.selectedDate}</p>
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