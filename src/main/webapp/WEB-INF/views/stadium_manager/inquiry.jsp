<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stadium_manager/inquiry.css">

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

        <div class="inquiry-container">
            <div class="headname-container">
                <div class="inquiry-row"> 
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/inquiry.png" alt="문의" class="inquiry-logo">
                        <div class="team-details">
                            <h4 class="head-name">문의</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="inquiry-container">
            <div class="inquirycontents-container">
                <div class="inquiry-row">
                    <div class="team-info">
                        <form action="">
                            <ul>
                                <li><h5>제목 : 구장 상태 점검해주세요.</h5></li>
                                <li><h7>문의 내용 : 구장 잔디 상태가 좋지 않습니다. 점검 부탁드립니다.</h7></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="inquiry-container">
            <div class="inquirycontents-container">
                <div class="inquiry-row">
                    <div class="team-info">
                        <form action="">
                            <ul>
                                <li><h5>제목 : 구장 상태 점검해주세요.</h5></li>
                                <li><h7>문의 내용 : 구장 잔디 상태가 좋지 않습니다. 점검 부탁드립니다.</h7></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="inquiry-container">
            <div class="inquirycontents-container">
                <div class="inquiry-row">
                    <div class="team-info">
                        <form action="">
                            <ul>
                                <li><h5>제목 : 구장 상태 점검해주세요.</h5></li>
                                <li><h7>문의 내용 : 구장 잔디 상태가 좋지 않습니다. 점검 부탁드립니다.</h7></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="inquiry-container">
            <div class="inquirycontents-container">
                <div class="inquiry-row">
                    <div class="team-info">
                        <form action="">
                            <ul>
                                <li><h5>제목 : 구장 상태 점검해주세요.</h5></li>
                                <li><h7>문의 내용 : 구장 잔디 상태가 좋지 않습니다. 점검 부탁드립니다.</h7></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="inquiry-container">
            <div class="inquirycontents-container">
                <div class="inquiry-row">
                    <div class="team-info">
                        <form action="">
                            <ul>
                                <li><h5>제목 : 구장 상태 점검해주세요.</h5></li>
                                <li><h7>문의 내용 : 구장 잔디 상태가 좋지 않습니다. 점검 부탁드립니다.</h7></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div class="inquiry-container">
            <div class="inquirycontents-container">
                <div class="inquiry-row">
                    <div class="team-info">
                        <form action="">
                            <ul>
                                <li><h5>제목 : 구장 상태 점검해주세요.</h5></li>
                                <li><h7>문의 내용 : 구장 잔디 상태가 좋지 않습니다. 점검 부탁드립니다.</h7></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 등록 버튼 -->
        <button class="registration-button" onclick="location.href = 'managermypage.me'" alt="" onclick="location.href = '${pageContext.request.contextPath}/managermypage.me'">뒤로가기</button>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </div>

</body>
</html>