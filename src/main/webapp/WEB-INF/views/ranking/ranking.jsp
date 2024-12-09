<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RankingPage</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ranking/ranking.css">

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
        
        <hr>
        
        <p class="size">실시간 랭킹</p>
        
		<!-- 종목 선택 버튼 -->
		<div class="sport-button-container" style="text-align: center; margin-bottom: 20px;">
		    <button class="sport-btn ${selectedCategory == 'soccer' ? 'active' : ''}" onclick="location.href='ranking.tm?category=soccer'">축구</button>
		    <button class="sport-btn ${selectedCategory == '풋살' ? 'active' : ''}" onclick="location.href='ranking.tm?category=풋살'">풋살</button>
		    <button class="sport-btn ${selectedCategory == '야구' ? 'active' : ''}" onclick="location.href='ranking.tm?category=야구'">야구</button>
		    <button class="sport-btn ${selectedCategory == '농구' ? 'active' : ''}" onclick="location.href='ranking.tm?category=농구'">농구</button>
		</div>
		
		<!-- 정렬 및 검색 컨테이너 -->
		<div style="display: flex; justify-content: space-between; align-items: center; gap: 20px;">
		    <!-- 랭킹순 버튼 -->
		    <div class="sort-container" style="flex: 1; text-align: left;">
		        <button 
		            class="sort-btn ${sortOrder == 'desc' ? 'active' : ''}" 
		            onclick="location.href='ranking.tm?category=${selectedCategory}&sortOrder=desc'">
		            높은 순위 팀
		        </button>
		        <button 
		            class="sort-btn ${sortOrder == 'asc' ? 'active' : ''}" 
		            onclick="location.href='ranking.tm?category=${selectedCategory}&sortOrder=asc'">
		            낮은 순위 팀
		        </button>
		    </div>
		
		    <!-- 검색창 -->
		    <div class="search-bar-team" style="flex: 2; text-align: right;">
		        <form action="ranking.tm" method="get" id="search-bar-form-team" style="display: flex; gap: 10px;">
		            <input type="hidden" name="category" value="${selectedCategory}">
		            <input type="text" name="searchKeyword" placeholder="팀 이름을 입력하세요." value="${searchKeyword}" style="flex: 1;">
		            <button type="submit">
		                <img src="${pageContext.request.contextPath}/resources/images/search-btn.png" class="search-btn-team" alt="검색">
		            </button>
		        </form>
		    </div>
		</div>

				        
		<!-- 팀 랭킹 -->
		<div class="team">
		    <c:forEach var="team" items="${rankingList}">
		        <div class="row">
		            <div class="cell left">
		                <span>${team.teamNo}</span>
		                <!-- 이미지가 존재하지 않을 경우 기본 이미지 출력 -->
		                <img src="<c:choose>
		                            <c:when test="${team.filePath != null and team.changeName != null}">
		                                ${pageContext.request.contextPath}/resources/images/userProFile/${team.changeName}
		                            </c:when>
		                            <c:otherwise>
		                                ${pageContext.request.contextPath}/resources/images/default-team.png
		                            </c:otherwise>
		                         </c:choose>" 
		                     alt="${team.teamName} 이미지">
		            </div>
		            <div class="cell center">${team.teamName}</div>
		            <div class="cell right">
		                <div class="point">Point</div>
		                ${team.teamPoint}
		            </div>
		        </div>
		    </c:forEach>
		    <div class="row"></div> <!-- 빈 row 추가 -->   	           
		</div>
	    
	    <!-- 페이지네이션 -->
	    <div id="pagenation">
		    <nav>
		        <ul class="pagination">
		            <!-- 맨 처음 페이지로 이동 -->
		            <c:choose>
		                <c:when test="${pi.currentPage > 1}">
		                    <li class="page-item">
		                        <a href="ranking.tm?category=${selectedCategory}&cpage=1" class="page-link">
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
		
		            <!-- 이전 페이지 -->
		            <c:choose>
		                <c:when test="${pi.currentPage > 1}">
		                    <li class="page-item">
		                        <a href="ranking.tm?category=${selectedCategory}&cpage=${pi.currentPage - 1}" class="page-link">
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
		
		            <!-- 페이지 번호 -->
		            <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
		                <c:choose>
		                    <c:when test="${page == pi.currentPage}">
		                        <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
		                    </c:when>
		                    <c:otherwise>
		                        <li class="page-item">
		                            <a class="page-link" href="ranking.tm?category=${selectedCategory}&cpage=${page}">${page}</a>
		                        </li>
		                    </c:otherwise>
		                </c:choose>
		            </c:forEach>
		
		            <!-- 다음 페이지 -->
		            <c:choose>
		                <c:when test="${pi.currentPage < pi.maxPage}">
		                    <li class="page-item">
		                        <a href="ranking.tm?category=${selectedCategory}&cpage=${pi.currentPage + 1}" class="page-link">
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
		
		            <!-- 맨 마지막 페이지로 이동 -->
		            <c:choose>
		                <c:when test="${pi.currentPage < pi.maxPage}">
		                    <li class="page-item">
		                        <a href="ranking.tm?category=${selectedCategory}&cpage=${pi.maxPage}" class="page-link">
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
</body>
</html>