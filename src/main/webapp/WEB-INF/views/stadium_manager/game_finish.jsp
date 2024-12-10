<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>진행 완료 매치</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stadium_manager/game_finish.css">

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

        <div class="gamelist-container">
            <div class="headname-container">
                <div class="gamelist-row">
                    <div class="gamelist-info">
                        <img src="${pageContext.request.contextPath}/resources/images/result_game.png" alt="진행 완료 매치 로고" class="gameresult-logo">
                        <div class="team-details">
                            <h4 class="head-name">진행 완료 매치</h4>
                        </div>
                    </div>
                </div>
            </div>
            <div class="vsdetailtotal-container">
                <h5 class="result-input">결과 입력</h5>
                <c:forEach var="match" items="${completedMatches}">
                    <a href="#">
                        <div class="vsdetail-container" onclick="location.href = 'gameresult.gp'" alt="" onclick="location.href = '${pageContext.request.contextPath}/game_detail.gp?matchNo=${matchNo}'">
                            <div class="team-match">
                                <div class="gamelist-info">
                                    <img src="${pageContext.request.contextPath}/resources/images/rental.png" alt="우리동네 FC" class="team1-logo">
                                    <div class="team-info">
                                        <p class="team-name">${match.aaTeamName}</p>
                                    </div>
                                </div>
                                <div class="vs-text">VS</div>
                                <div class="gamelist-info">
                                    <img src="${pageContext.request.contextPath}/resources/images/rental.png" alt="남의동네 FC" class="team2-logo">
                                    <div class="team-info">
                                        <p class="team-name">${match.bbTeamName}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </c:forEach>

                
            </div>

            <!-- 뒤로가기 버튼 -->
            <button class="registration-button" onclick="location.href ='managermypage.me'">뒤로가기</button>
        </div>
        </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />


</body>
</html>