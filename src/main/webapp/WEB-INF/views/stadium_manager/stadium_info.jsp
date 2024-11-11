<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구장정보 수정/탈퇴</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stadium_manager/stadium_info.css">

    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
        rel="stylesheet">

</head>
<body>

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/header.jsp" />

        <br>

        <jsp:include page="/WEB-INF/views/nav.jsp" />

        <div class="stadiuminfo-container">
            <div class="headname-container">
                <div class="stadiuminfo-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/information.png" alt="구장정보 수정/탈퇴" class="stadiuminfo-logo">
                        <div class="team-details">
                            <h4 class="head-name">구장정보 수정/탈퇴</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="category-container">
            <div class="form-group">
                <label>종목 선택</label>
                <div class="sport-options">
                    <label><input type="checkbox"> 축구</label>
                    <label><input type="checkbox"> 풋살</label>
                    <label><input type="checkbox"> 농구</label>
                    <label><input type="checkbox"> 야구</label>
                </div>
            </div>
        </div>
        

        <div class="stadiuminfo-container">
            <div class="form-group">
                <label for="stadium-name">구장명</label>
                <input type="text" id="stadium-name" placeholder="구장명을 입력하세요.">
            </div>
            
            <div class="form-group">
                <label for="address">주소</label>
                <div class="address-container">
                    <input type="text" class="zipcode" placeholder="우편번호">
                    <button type="button" class="address-search-button">주소 검색</button>
                </div>
                <input type="text" class="basic-address" placeholder="기본 주소">
                <input type="text" class="detail-address" placeholder="상세 주소">
            </div>
            
            <div class="form-group">
                <label for="price">가격</label>
                <input type="text" id="price" placeholder="가격을 입력하세요.">
            </div>
            
            <div class="form-group">
                <label>운영 시간</label>
                <div class="time-group">
                    <input type="time" id="start-time" value="09:00">
                    <span>~</span>
                    <input type="time" id="end-time" value="09:00">
                </div>
            </div>
            
            <div class="form-group">
                <label>편의 시설</label>
                <div class="checkbox-group">
                    <label><input type="checkbox"> 화장실</label>
                    <label><input type="checkbox"> 자판기</label>
                    <label><input type="checkbox"> 주차장</label>
                    <label><input type="checkbox"> 흡연실</label>
                </div>
            </div>
            
            <div class="form-group">
                <label>대여 시스템</label>
                <div class="checkbox-group">
                    <label><input type="checkbox"> 축구화</label>
                    <label><input type="checkbox"> 공</label>
                    <label><input type="checkbox"> 조끼</label>
                </div>
            </div>
            
            <div class="form-group">
                <label>구장 대표 이미지</label>
                <div class="image-upload-group">
                    <button class="image-button">대표 이미지</button>
                    <span>Thumbnail.png</span>
                </div>
            </div>
            
            <div class="form-group">
                <label>구장 상세 이미지</label>
                <div class="image-upload-group">
                    <button class="image-button">상세 이미지</button>
                    <span>Detail.png</span>
                </div>
            </div>

            <div class="info-btn">
                <button class="registration-button">수정하기</button>
                <button class="registration-button">탈퇴하기</button>
            </div>
        </div>
        
        <jsp:include page="/WEB-INF/views/footer.jsp" />
    </div>

</body>
</html>