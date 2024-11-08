<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대관 승인 페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/stadium_manager/rental_approval.css">

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

        <div class="rental-container">
            <div class="headname-container">
                <div class="gamersult-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/rental.png"
                            alt="대관 승인/거절" class="gameresult-logo">
                        <div class="team-details">
                            <h4 class="head-name">대관 승인/거절</h4>
                        </div>
                    </div>
                    <div class="checkbox-container">
                    </div>
                </div>
            </div>
        </div>

        <div class="rentallist-container">
            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기 결과 로고" class="gameresult-logo">
                        <form action="">
                            <ul>
                                <li><b>서울 남도빌딩 경기장</b></li>
                                <li><b>우리동네FC VS 남의동네FC</b></li>
                                <li><b>12 : 00 ~ 14 : 00 </b></li>
                            </ul>
                            <div class="rental-btns">
                                <button class="rental-btn">거절</button>
                                <button class="rentals-btn">승인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기 결과 로고" class="gameresult-logo">
                        <form action="">
                            <ul>
                                <li><b>서울 남도빌딩 경기장</b></li>
                                <li><b>우리동네FC VS 남의동네FC</b></li>
                                <li><b>12 : 00 ~ 14 : 00 </b></li>
                            </ul>
                            <div class="rental-btns">
                                <button class="rental-btn">거절</button>
                                <button class="rentals-btn">승인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기 결과 로고" class="gameresult-logo">
                        <form action="">
                            <ul>
                                <li><b>서울 남도빌딩 경기장</b></li>
                                <li><b>우리동네FC VS 남의동네FC</b></li>
                                <li><b>12 : 00 ~ 14 : 00 </b></li>
                            </ul>
                            <div class="rental-btns">
                                <button class="rental-btn">거절</button>
                                <button class="rentals-btn">승인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기 결과 로고" class="gameresult-logo">
                        <form action="">
                            <ul>
                                <li><b>서울 남도빌딩 경기장</b></li>
                                <li><b>우리동네FC VS 남의동네FC</b></li>
                                <li><b>12 : 00 ~ 14 : 00 </b></li>
                            </ul>
                            <div class="rental-btns">
                                <button class="rental-btn">거절</button>
                                <button class="rentals-btn">승인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기 결과 로고" class="gameresult-logo">
                        <form action="">
                            <ul>
                                <li><b>서울 남도빌딩 경기장</b></li>
                                <li><b>우리동네FC VS 남의동네FC</b></li>
                                <li><b>12 : 00 ~ 14 : 00 </b></li>
                            </ul>
                            <div class="rental-btns">
                                <button class="rental-btn">거절</button>
                                <button class="rentals-btn">승인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            
            <!-- 등록 버튼 -->
            <button class="registration-button">뒤로가기</button>
        </div>

        <jsp:include page="/WEB-INF/views/footer.jsp" />

    </div>

</body>
</html>