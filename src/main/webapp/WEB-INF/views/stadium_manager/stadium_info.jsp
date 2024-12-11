<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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

        <form action="${pageContext.request.contextPath}/updateStadium.me" method="post" enctype="multipart/form-data">
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
        <input type="hidden" name="stadiumNo" value="${stadium.stadiumNo}">
        <div class="category-container">
            <div class="form-group">
                <label>종목 선택</label>
                <div class="sport-options">
                    <input type="hidden" name="stadiumCategory" value="${stadium.stadiumCategory}">
                    <label><input type="checkbox" name="stadiumCategory" value="soccer" disabled ${stadium.stadiumCategory.contains('soccer') ? 'checked' : ''}> 축구</label>
                    <label><input type="checkbox" name="stadiumCategory" value="futsal" disabled ${stadium.stadiumCategory.contains('futsal') ? 'checked' : ''}> 풋살</label>
                    <label><input type="checkbox" name="stadiumCategory" value="basketball" disabled ${stadium.stadiumCategory.contains('basketball') ? 'checked' : ''}> 농구</label>
                    <label><input type="checkbox" name="stadiumCategory" value="baseball" disabled ${stadium.stadiumCategory.contains('baseball') ? 'checked' : ''}> 야구</label>
                </div>
            </div>
        </div>

        <div class="stadiuminfo-container">
            <div class="form-group">
                <label for="stadium-name">구장명</label>
                <input type="text" id="stadium-name" name="stadiumName" value="${stadium.stadiumName}">
            </div>
            
            <div class="form-group">
                <label for="memberBaseAdd">주소</label>
                <div class="address-container">
                    <input type="text" class="zipcode" id="memberZipcode" name="stadiumZipcode" value="${stadium.stadiumZipcode}">
                    <button type="button" class="address-search-button" onclick="addSearch('memberZipcode','memberBaseAdd','memberDetailAdd')">주소 검색</button>
                </div>
                <input type="text" class="basic-address" id="memberBaseAdd" name="stadiumAdd" value="${stadium.stadiumAdd}" readonly>
                <input type="text" class="detail-address" id="memberDetailAdd" name="stadiumDetailAdd" value="${stadium.stadiumAdd}">
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
                    <label><input type="checkbox" class="good" name="amenities" value="toilet"> 화장실</label>
                    <label><input type="checkbox" class="good" name="amenities" value="drink"> 자판기</label>
                    <label><input type="checkbox" class="good" name="amenities" value="park"> 주차장</label>
                    <label><input type="checkbox" class="good" name="amenities" value="smoke"> 흡연실</label>
                    <label><input type="checkbox" class="good" name="amenities" value="shower"> 샤워장</label>
                </div>
            </div>
            
            <div class="form-group">
                <label>대여 시스템</label>
                <div class="checkbox-group">
                    <label><input type="checkbox" class="good" name="rental" value="ball"> 공</label>
                    <label><input type="checkbox" class="good" name="rental" value="vest"> 조끼</label>
                </div>
            </div>

            <script>
                let toilet = '${stadium.toilet}'; // 화장실 여부
                let drink = '${stadium.drink}'; // 자판기 여부
                let park = '${stadium.park}';  // 주차장 여부
                let smoke = '${stadium.smoke}'; // 흡연실 여부
                let shower = '${stadium.shower}'; // 흡연실 여부
                let ball = '${stadium.ball}'; // 공 대여 여부
                let vest = '${stadium.vest}'; // 조끼 대여 여부
            
                // 콘솔에 데이터 출력
                console.log('toilet:', toilet);
                console.log('drink:', drink);
                console.log('park:', park);
                console.log('smoke:', smoke);
                console.log('shower:', shower);
                console.log('ball:', ball);
                console.log('vest:', vest);
            
                function updateCheckboxes() {
                    // 체크박스들을 가져옴
                    const checkboxes = document.querySelectorAll('input[class="good"]');
            
                    checkboxes.forEach((checkbox) => {
                        const value = checkbox.value; // 체크박스의 value 값
      
                        // 각 조건에 따라 체크박스를 설정
                        if (
                            (value === 'toilet' && toilet === 'Y') || // 화장실
                            (value === 'drink' && drink === 'Y') || // 자판기
                            (value === 'park' && park === 'Y') || // 주차장
                            (value === 'smoke' && smoke === 'Y') || // 흡연실
                            (value === 'shower' && shower === 'Y') || // 샤워장
                            (value === 'ball' && ball === 'Y') || // 공 대여
                            (value === 'vest' && vest === 'Y') // 조끼 대여
                        ) {
                            checkbox.checked = true; // true면 체크
                        } else {
                            checkbox.checked = false; // false면 체크 x
                        }
                    });
                }
                document.addEventListener('DOMContentLoaded', updateCheckboxes);
                window.onload = updateCheckboxes;
            </script>
            
            <div class="form-group">
                <label>구장 대표 이미지</label>
                <div class="image-upload-group">
                    <c:if test="${stadium.fileType == 0}">
                        <img src="${stadium.filePath}/${stadium.changeName}" alt="구장 대표 이미지" class="preview-image">
                    </c:if>
                    <input type="file" name="thumbnailImg" id="thumbnail" >
                </div>
            </div>
            
            <div class="form-group">
                <label>구장 상세 이미지</label>
                <div class="image-upload-group">
                    <c:forEach var="image" items="${stadiumImages}">
                        <img src="${image.filePath}/${image.changeName}" alt="${image.originName}" class="detail-img">
                    </c:forEach>
                    <input type="file" name="detailImg" id="detail"  multiple>
                </div>
            </div>

            <div class="info-btn">
                <button class="registration-button">수정하기</button>
                <button class="registration-button">탈퇴하기</button>
            </div>

            <script>

                function confirmDelete() {
                    if (confirm("정말로 구장을 삭제하시겠습니까?")) {
                        location.href = "${pageContext.request.contextPath}/stadium_manager/delete";
                    }
                }
            </script>
        </div>
    </form>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>
