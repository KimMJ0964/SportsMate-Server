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
        
        
        <div class="choice">
            <div class="mt-region-container">
                <select class="mt-region">
                    <option value="전체">전체</option>
                    <option value="서울">서울</option>
                    <option value="부산">부산</option>
                    <option value="대구">대구</option>
                    <option value="인천">인천</option>
                    <option value="광주">광주</option>
                    <option value="대전">대전</option>
                    <option value="울산">울산</option>
                    <option value="세종">세종</option>
                </select>
            </div>
            <div class="mt-start-container">
                <select class="mt-starttime">
                    <option value="00 : 00">00 : 00</option>
                    <option value="02 : 00">02 : 00</option>
                    <option value="04 : 00">04 : 00</option>
                    <option value="06 : 00">06 : 00</option>
                    <option value="08 : 00">08 : 00</option>
                    <option value="10 : 00">10 : 00</option>
                    <option value="12 : 00">12 : 00</option>
                    <option value="14 : 00">14 : 00</option>
                </select>
            </div>
            <p>~</p>
            <div class="mt-end-container">
                <select class="mt-endtime">
                    <option value="00 : 00">00 : 00</option>
                    <option value="02 : 00">02 : 00</option>
                    <option value="04 : 00">04 : 00</option>
                    <option value="06 : 00">06 : 00</option>
                    <option value="08 : 00">08 : 00</option>
                    <option value="10 : 00">10 : 00</option>
                    <option value="12 : 00">12 : 00</option>
                    <option value="14 : 00">14 : 00</option>
                </select>
            </div>
        </div>

<section class="video-grid">
        <div class="video-priview">
            <div class="thumbnail-row">
            	<a href="detail.st">
                	<img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
                </a>
            </div>
            <div class="video-info-grid" >
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
        <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
        <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/field.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</div>
<script src="${pageContext.request.contextPath}/resources/js/stadium/listPage.js"></script>
</body>
</html>