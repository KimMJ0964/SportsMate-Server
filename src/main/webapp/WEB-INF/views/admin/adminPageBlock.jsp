<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>차단관리</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminPageReport.css">

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

        <div class="report-container">
            <div class="headname-container">
                <div class="gamersult-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/report-match.png"
                            alt="경기 결과 로고" class="gameresult-logo">
                        <div class="team-details">
                            <h4 class="head-name">경기 신고 관리</h4>
                        </div>
                    </div>
                    <div class="checkbox-container">
                    </div>
                </div>
            </div>
        </div>

        <div class="result-container">
        	<c:forEach var="b" items="${list}">
	            <div class="victory-container">
	                <div class="victory-row">
	                    <div class="team-info">
	                        <img src="${pageContext.request.contextPath}/resources/images/my-profile.png" alt="" class="gameresult-logo">
	                        <form action="">
	                            <ul>
	                                <li><b>유저ID: </b>${b.memEmail}</li>
	                                <li><b>누적 패널티: </b>${b.pnCount}</li>
	                                <li><b>패널티 기간: </b>~${b.pnDate}</li>
	                                <li><b>패널티 사유: </b>${b.pnContent}</li>
	                            </ul>
	                            <div class="report-btns">
	                                <button class="report-btn">차단해제</button>
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
            </c:forEach>

            <!-- 등록 버튼 -->
            <button class="registration-button">뒤로가기</button>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </div>
</body>

</html>