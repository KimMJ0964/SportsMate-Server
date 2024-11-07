<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 리스트</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/game_list.css">

<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
    rel="stylesheet">

</head>
<div>

    <div class="wrap">
        <jsp:include page="/WEB-INF/views/header.jsp" />

        <br>

        <jsp:include page="/WEB-INF/views/nav.jsp" />

        <div class="gamelist-container">
            <div class="headname-container">
                <div class="gamelist-row">
                    <div class="gamelist-info">
                        <img src="${pageContext.request.contextPath}/resources/images/game_list.png" alt="경기 결과 로고" class="gamelist-logo">
                        <div class="team-details">
                            <h4 class="head-name">경기 리스트</h4>
                        </div>
                    </div>
                </div>
            </div>

        <div class="event-container">
            <div class="sportstype-container">
                <h5 class="type-name">
                    <a href="#">축구</a>
                    <a href="#">풋살</a>
                    <a href="#">농구</a>
                    <a href="#">야구</a>
                </h5>
            </div>

        </div>

                <div class="vsdetail-container">
                    <div class="team-match">
                        <div class="gamelist-info">
                            <img src="${pageContext.request.contextPath}/resources/images/team2.png" alt="우리동네 FC" class="team1-logo">
                            <div class="team-info">
                                <p class="team-name">우리동네 FC</p>
                                <p class="team-level">아마추어2</p>
                            </div>
                        </div>
                        <div class="vs-text">VS</div>
                        <div class="gamelist-info">
                            <img src="${pageContext.request.contextPath}/resources/images/team2.png" alt="남의동네 FC" class="team2-logo">
                            <div class="team-info">
                                <p class="team-name">남의동네 FC</p>
                                <p class="team-level">아마추어3</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="vsdetail-container">
                    <div class="team-match">
                        <div class="gamelist-info">
                            <img src="${pageContext.request.contextPath}/resources/images/team2.png" alt="우리동네 FC" class="team1-logo">
                            <div class="team-info">
                                <p class="team-name">우리동네 FC</p>
                                <p class="team-level">아마추어2</p>
                            </div>
                        </div>
                        <div class="vs-text">VS</div>
                        <div class="gamelist-info">
                            <img src="${pageContext.request.contextPath}/resources/images/team2.png" alt="남의동네 FC" class="team2-logo">
                            <div class="team-info">
                                <p class="team-name">남의동네 FC</p>
                                <p class="team-level">아마추어3</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="vsdetail-container">
                    <div class="team-match">
                        <div class="gamelist-info">
                            <img src="${pageContext.request.contextPath}/resources/images/team2.png" alt="우리동네 FC" class="team1-logo">
                            <div class="team-info">
                                <p class="team-name">우리동네 FC</p>
                                <p class="team-level">아마추어2</p>
                            </div>
                        </div>
                        <div class="vs-text">VS</div>
                        <div class="gamelist-info">
                            <img src="${pageContext.request.contextPath}/resources/images/team2.png" alt="남의동네 FC" class="team2-logo">
                            <div class="team-info">
                                <p class="team-name">남의동네 FC</p>
                                <p class="team-level">아마추어3</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="vsdetail-container">
                    <div class="team-match">
                        <div class="gamelist-info">
                            <img src="${pageContext.request.contextPath}/resources/images/team2.png" alt="우리동네 FC" class="team1-logo">
                            <div class="team-info">
                                <p class="team-name">우리동네 FC</p>
                                <p class="team-level">아마추어2</p>
                            </div>
                        </div>
                        <div class="vs-text">VS</div>
                        <div class="gamelist-info">
                            <img src="${pageContext.request.contextPath}/resources/images/team2.png" alt="남의동네 FC" class="team2-logo">
                            <div class="team-info">
                                <p class="team-name">남의동네 FC</p>
                                <p class="team-level">아마추어3</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="vsdetail-container">
                    <div class="team-match">
                        <div class="gamelist-info">
                            <img src="${pageContext.request.contextPath}/resources/images/team2.png" alt="우리동네 FC" class="team1-logo">
                            <div class="team-info">
                                <p class="team-name">우리동네 FC</p>
                                <p class="team-level">아마추어2</p>
                            </div>
                        </div>
                        <div class="vs-text">VS</div>
                        <div class="gamelist-info">
                            <img src="${pageContext.request.contextPath}/resources/images/team2.png" alt="남의동네 FC" class="team2-logo">
                            <div class="team-info">
                                <p class="team-name">남의동네 FC</p>
                                <p class="team-level">아마추어3</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="vsdetailLast-container">
                    <div class="team-match">
                        <div class="gamelist-info">
                            <img src="${pageContext.request.contextPath}/resources/images/team2.png" alt="우리동네 FC" class="team1-logo">
                            <div class="team-info">
                                <p class="team-name">우리동네 FC</p>
                                <p class="team-level">아마추어2</p>
                            </div>
                        </div>
                        <div class="vs-text">VS</div>
                        <div class="gamelist-info">
                            <img src="${pageContext.request.contextPath}/resources/images/team2.png" alt="남의동네 FC" class="team2-logo">
                            <div class="team-info">
                                <p class="team-name">남의동네 FC</p>
                                <p class="team-level">아마추어3</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 뒤로가기 버튼 -->
            <button class="gamelistback-button">뒤로가기</button>
            </div>        

        <jsp:include page="/WEB-INF/views/footer.jsp" />

    </div>

</body>
</html>