<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <script src="${pageContext.request.contextPath}/resources/js/stadium_manager/stadium_info.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <br>

        <jsp:include page="/WEB-INF/views/common/nav.jsp" />

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
      sdvsdavsdv :   ${stadium}
        <div class="category-container">
            <div class="form-group">
                <label>종목 선택</label>
                <div class="sport-options">
                    <label><input type="checkbox" name="category" value="soccer" ${stadium.stadiumCategory.contains('soccer') ? 'checked' : ''}> 축구</label>
                    <label><input type="checkbox" name="category" value="futsal" ${stadium.stadiumCategory.contains('futsal') ? 'checked' : ''}> 풋살</label>
                    <label><input type="checkbox" name="category" value="basketball" ${stadium.stadiumCategory.contains('basketball') ? 'checked' : ''}> 농구</label>
                    <label><input type="checkbox" name="category" value="baseball" ${stadium.stadiumCategory.contains('baseball') ? 'checked' : ''}> 야구</label>
                </div>
            </div>
        </div>

        <div class="stadiuminfo-container">
            <div class="form-group">
                <label for="stadium-name">구장명</label>
                <input type="text" id="stadium-name" name="stadiumName" value="${stadium.stadiumName}" placeholder="구장명을 입력하세요.">
            </div>
            
            <div class="form-group">
                <label for="address">주소</label>
                <div class="address-container">
                    <input type="text" class="zipcode" id="memberZipcode" name="memberZipcode" value="${stadium.stadiumZipcode}">
                    <button type="button" class="address-search-button" onclick="addSearch('memberZipcode','memberBaseAdd','memberDetailAdd')">주소 검색</button>
                </div>
                <input type="text" class="basic-address" id="memberBaseAdd" value="${stadium.stadiumAdd}" readonly>
                <input type="text" class="detail-address" id="memberDetailAdd" value="">
            </div>
            
            <div class="form-group">
                <label for="price">가격</label>
                <input type="text" id="price" name="stadiumPrice" value="${stadium.stadiumPrice}">
            </div>
            
            <div class="form-group">
                <label>운영 시간</label>
                <div class="time-group">
                    <input type="time" id="start-time" name="stadiumStartTime" value="${stadium.stadiumStartTime}">
                    <span>~</span>
                    <input type="time" id="end-time" name="stadiumEndTime" value="${stadium.stadiumEndTime}">
                </div>
            </div> 
            
            <div class="form-group">
                <label>편의 시설</label>
                <div class="checkbox-group">
                    <label><input type="checkbox" name="amenities" value="toilet" ${stadium.amenities.contains('toilet') ? 'checked' : ''}> 화장실</label>
                    <label><input type="checkbox" name="amenities" value="drink" ${stadium.amenities.contains('drink') ? 'checked' : ''}> 자판기</label>
                    <label><input type="checkbox" name="amenities" value="parking" ${stadium.amenities.contains('parking') ? 'checked' : ''}> 주차장</label>
                    <label><input type="checkbox" name="amenities" value="smoke" ${stadium.amenities.contains('smoke') ? 'checked' : ''}> 흡연실</label>
                </div>
            </div>
            
            <div class="form-group">
                <label>대여 시스템</label>
                <div class="checkbox-group">
                    <label><input type="checkbox" name="rental" value="ball" ${stadium.rental.contains('ball') ? 'checked' : ''}> 공</label>
                    <label><input type="checkbox" name="rental" value="vest" ${stadium.rental.contains('vest') ? 'checked' : ''}> 조끼</label>
                </div>
            </div>
            
            <div class="form-group">
                <label>구장 대표 이미지</label>
                <div class="image-upload-group">
                    <input type="file" name="thumbnailImg" id="thumbnail">
                </div>
            </div>
            
            <div class="form-group">
                <label>구장 상세 이미지</label>
                <div class="image-upload-group">
                    <input type="file" name="detailImg" id="detail" multiple>
                </div>
            </div>

            <div class="info-btn">
                <button class="registration-button">수정하기</button>
                <button class="registration-button" onclick="confirmDelete()">탈퇴하기</button>
            </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>
