<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구장정보 수정/탈퇴 페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/stadium_manager/stadium_info.css">

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

            <div id="login-wrap">
                <form action="member_enroll.me" class="enroll-form" method="post" enctype="multipart/form-data">

                    <div class="gameresult-container">
                        <div class="headname-container">
                            <div class="gamersult-row">
                                <div class="team-info">
                                    <img src="${pageContext.request.contextPath}/resources/images/result_game.png" alt="경기 결과 로고" class="gameresult-logo">
                                    <div class="team-details">
                                        <h4 class="head-name">구장정보 수정/탈퇴</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="input-wrap">
                        <div class="category-checkBox-wrap">
                            <div class="category-checkBox">
                                <input type="checkbox" name="category" id="soccer" value="soccer">
                                <label class="category-name" for="soccer">축구</label>
                            </div>
                            <div class="category-checkBox">
                                <input type="checkbox" name="category" id="futsal" value="futsal">
                                <label class="category-name" for="futsal">풋살</label>
                            </div>
                            <div class="category-checkBox">
                                <input type="checkbox" name="category" id="basketball" value="basketball">
                                <label class="category-name" for="basketball">농구</label>
                            </div>
                            <div class="category-checkBox">
                                <input type="checkbox" name="category" id="baseball" value="baseball">
                                <label class="category-name" for="baseball">야구</label>
                            </div>
                        </div>
                    </div>

                    <div class="input-wrap">
                        <span class="form-title">구장명</span> <br>
                        <input type="stadiumname" name="" placeholder="구장명을 입력해주세요.">
                    </div>
                    <div class="input-wrap">
                        <span class="form-title">주소</span><br>
                        <input type="address" name="" placeholder="주소를 입력해주세요.">
                    </div>
                    <div class="input-wrap">
                        <span class="form-title">가격</span><br>
                        <input type="price" name="" placeholder="가격을를 한 번 더 입력해주세요.">
                    </div>
                    <div class="input-wrap">
                        <span class="form-title">이름</span><br>
                        <input type="name" name="memName" placeholder="이름을 입력해주세요.">
                    </div>
                    <div class="input-wrap">
                        <span class="form-title">성별</span><br>
                        <select name="managerGender" id="">
                            <option disabled hidden selected>성별</option>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                        </select>
                    </div>
                    <div class="input-wrap">
                        <span class="form-title">생년월일</span><br>
                        <div class="birth-wrap">
                            <div class="year-wrap">
                                <select name="year" id="year"></select>
                            </div>
                            <div class="month-wrap">
                                <select name="month" id="month"></select>
                            </div>
                            <div class="day-wrap">
                                <select name="day" id="day"></select>
                            </div>
                        </div>
                    </div>
                    <div class="input-wrap">
                        <span class="form-title">핸드폰 번호</span><br>
                        <div class="birth-wrap">
                            <div class="year-wrap">
                                <select name="phone1" id="phone1">
                                    <option value="010">010</option>
                                </select>
                            </div>
                            <div class="month-wrap">
                                <input type="number" name="phone2" id="phone2" maxlength="4">
                            </div>
                            <div class="day-wrap">
                                <input type="number" name="phone3" id="phone3" maxlength="4">
                            </div>
                        </div>
                    </div>
                    <div class="input-wrap">
                        <span class="form-title">주소</span><br>
                        <input type="text" name="memAdd" placeholder="주소를 입력해주세요.">
                    </div>
                    <div class="split-bar"></div>
                    
                    
                    <div class="button-wrap">
                        <button type="submit" class="clickable">수정하기</button>
                        <button type="submit" class="clickable">탈퇴하기</button>
                    </div>
                    
            
                </form>
            </div>
        </div>

        <jsp:include page="/WEB-INF/views/footer.jsp" />
    
</body>
</html>