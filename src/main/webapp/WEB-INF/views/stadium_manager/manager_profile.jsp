<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구장관리자 프로필 설정</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stadium_manager/manager_profile.css">

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

        <div class="nav-container">
            <jsp:include page="/WEB-INF/views/common/nav.jsp" />
        </div>

        

        <div class="stadiuminfo-container">

            <div class="form-group">
                <label for="email">이메일</label>
            <input type="text" class="zipcode" placeholder="suwon@naver.com">
            </div>

            <div class="form-group">
                <label for="pwdchange">비밀번호 변경</label>
            <input type="text" class="zipcode" placeholder="변경할 비밀번호">
            </div>

            <div class="form-group">
                <label for="check">비밀번호 변경 확인</label>
            <input type="text" class="zipcode" placeholder="변경 비밀번호 확인">
            </div>

            <div class="form-group">
                <label for="name">이름</label>
            <input type="text" class="zipcode" placeholder="이름">
            </div>

            <div class="form-group">
                <label for="gender">성별</label>
                <select id="gender" class="gender-select">
                    <option value="" disabled selected>성별을 선택하세요.</option>
                    <option value="male">남성</option>
                    <option value="female">여성</option>
                </select>
            </div>

            <div class="form-group">
                <label for="birthdate">생년월일</label>
                <div class="birthdate-container">
                    <select id="birth-year" class="birth-part">
                        <option value="" disabled selected>년</option>
                    </select>
                    <select id="birth-month" class="birth-part">
                        <option value="" disabled selected>월</option>
                    </select>
                    <select id="birth-day" class="birth-part">
                        <option value="" disabled selected>일</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="phone">휴대폰 번호</label>
                <div class="phone-input-container">
                    <select id="phone-part1" class="phone-part">
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="016">016</option>
                        <option value="017">017</option>
                        <option value="018">018</option>
                        <option value="019">019</option>
                    </select>
                    <input type="text" id="phone-part2" class="phone-part" maxlength="4" placeholder="0000">
                    <input type="text" id="phone-part3" class="phone-part" maxlength="4" placeholder="0000">
                </div>
            </div>

            <div class="form-group">
                <label for="address">주소</label>
                    <input type="text" class="zipcode" placeholder="우편번호">
            </div>       

                <button class="registration-button">수정하기</button>
        </div>
    </div>
    
    <script src="${pageContext.request.contextPath}/resources/js/manager_profile.js"></script>
</body>
</html>