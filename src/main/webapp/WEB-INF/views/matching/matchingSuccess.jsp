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
        <jsp:include page="/WEB-INF/views/header.jsp" />

        <br>

        <jsp:include page="/WEB-INF/views/nav.jsp" />

        <div class="order-success">
            <h4>결제완료</h4>
            <br>
            <img src="${pageContext.request.contextPath}/resources/images/Checkmark.png" alt="">
            <h5>결제가 성공적으로 완료되었습니다.</h5>
            <br>
        </div>

        <div class="matching-container">
            <div class="matching-title">
                <h4>결제정보</h4>
            </div>

            <div class="order-result">
                <div class="order-ground">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/images/event-banner.png" alt="">
                    </div>
                    <div>
                        <p>서울 강남구 테헤란로</p>
                        <h4>[서울]KH체육관</h4>
                        <p>2024.10.28 14:00~16:00</p>
                    </div>
                </div>
                <div class="order-result-info">
                    <div>
                        <h4>결제금액</h4>
                        <p>100,000</p>
                    </div>
                    <div>
                        <h4>결제수단</h4>
                        <p>카카오페이</p>
                    </div>
                </div>
            </div>
        </div>

        <button class="done">목록가기</button>

        <jsp:include page="/WEB-INF/views/footer.jsp" />
    </div>
</body>
</html>