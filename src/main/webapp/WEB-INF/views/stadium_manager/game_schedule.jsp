<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 예정</title>

<!-- Latest compiled and minified CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stadium_manager/game_schedule.css">

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
                        <img src="${pageContext.request.contextPath}/resources/images/game_list.png" alt="경기 결과 로고" class="gamelist-logo">
                        <div class="team-details">
                            <h4 class="head-name">진행 예정 매치</h4>
                        </div>
                    </div>
                </div>
            </div>

            <c:forEach var="game" items="${gameScheduleList}">
                <div class="vsdetail-container">
                    <div class="team-match">
                        <div class="gamelist-info">
                            <img src="${game.aaTeamImage}" alt="${game.aaTeamImage}" class="team1-logo">
                            <div class="team-info">
                                <p class="team-name">${game.aaTeamName}</p>
                            </div>
                        </div>
                        <div class="vs-text">
                            <div class="vs">VS</div>
                            <div class="game-time">${game.reservStart} ~ ${game.reservEnd}</div>
                        </div>
                        <div class="gamelist-info">
                            <img src="${game.bbTeamImage}" alt="${game.bbTeamImage}" class="team2-logo">
                            <div class="team-info">
                                <p class="team-name">${game.bbTeamName}</p>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <!-- 뒤로가기 버튼 -->
            <button class="gamelistback-button" onclick="location.href = 'managermypage.me'" alt="" onclick="location.href = '${pageContext.request.contextPath}/managermypage.me'">뒤로가기</button>
        </div>
        </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />

</body>
</html>