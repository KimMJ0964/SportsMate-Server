<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매칭</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matching/matchingReq.css">
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

        <div class="matching-container">
            <div class="matching-title">
                <h4>구장정보</h4>
            </div>
        
            <div class="match-info">
                <div>
                    <img class="ground-thunb" src="${pageContext.request.contextPath}/resources/images/event-banner.png" alt="">
                </div>
                <div>
                    <p>주소지</p>
                    <h4>구장명</h4>
                    <p>경기일시</p>
                </div>
            </div>
        </div>

        <div class="matching-container">
            <div class="matching-title">
                <h4>대전팀</h4>
            </div>

            <div class="match-a">
                <div class="team-profile">
                    <img src="${pageContext.request.contextPath}/resources/images/Logo.png" alt="">
                    <h4>구단: 구단명</h4>
                </div>

                <div class="team-detail">
                    <b>전적</b>
                    <p>xx전 xx승 xx패 xx무</p>
                </div>
            </div>
        </div>

        <div class="matching-container">
            <div class="matching-title">
                <h4>경기일정</h4>
            </div>

            <div class="match-b">
                <div class="team-profile">
                    <img src="" alt="">
                    <h4>구단: 구단명</h4>
                </div>

                <div class="match-category">
                    <div>
                        <b>종목명</b>
                        <p>종목</p>
                    </div>
                    <div>
                        <b>심판</b>
                        <p>심판명</p>
                    </div>
                </div>

                <div class="team-detail">
                    <b>경기일시</b>
                    <p>경기일시</p>
                </div>
            </div>
        </div>

        <div class="matching-container">
            <div class="matching-title">
                <h4>결제</h4>
            </div>

            <div class="match-order">
                <form action="">
                    <div class="total">
                        <h4>대관료</h4>
                        <p>금액</p>
                    </div>
                    <div>
                        <h4>결제수단</h4>
                        <select name="" id="">
                            <option>카카오페이</option>
                            <option>카드결제</option>
                        </select>

                        <div class="order-box">
                            dja
                        </div>
                    </div>
                    <button>결제완료</button>
                </form>
            </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </div>
</body>
</html>