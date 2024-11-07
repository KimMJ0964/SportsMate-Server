<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경기 결과</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/game_result.css">

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

        <div class="gameresult-container">
            <div class="headname-container">
                <div class="gamersult-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/result_game.png" alt="경기 결과 로고" class="gameresult-logo">
                        <div class="team-details">
                            <h4 class="head-name">경기 결과</h4>
                        </div>
                    </div>
                    <div class="checkbox-container">
                    </div>
                </div>
            </div>
        </div>

        <!-- 승리 팀 표시 -->
         <div class="result-container">
            <div class="victory-container">
                <h4 class="victory-title">승리팀</h4>
                <div class="victory-row">
                    <div class="team-info">
                        <div class="team-name">A팀</div>
                        <img src="${pageContext.request.contextPath}/resources/images/team1.png" alt="팀 로고" class="team-logo">
                        <div class="team-details">우리동네FC</div>
                    </div>
                    <div class="checkbox-container">
                        <input type="checkbox" id="team-a-checkbox" checked>
                    </div>
                </div>
                <div class="divider"></div>
                <div class="victory2-row">
                    <div class="team-info">
                        <div class="team-name">B팀</div>
                        <img src="${pageContext.request.contextPath}/resources/images/team2.png" alt="팀 로고" class="team-logo">
                        <div class="team-details">우리동네FC</div>
                    </div>
                    <div class="checkbox-container">
                        <input type="checkbox" id="team-b-checkbox">
                    </div>
                </div>
            </div>
        
        

            <!-- A팀 선수 평가 -->
            
                <div class="evaluation-container">
                    <div class="result-label">A팀</div>
                        <table class="player-table">
                            <thead>
                                <tr>
                                    <th>선수</th>
                                    <th>실력 평점</th>
                                    <th>매너 평점</th>
                                    <th>경고</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>김개똥</td>
                                    <td class="star-rating">★★★★★</td>
                                    <td class="star-rating">★★★☆☆</td>
                                    <td><input type="checkbox" class="warning-checkbox"></td>
                                </tr>
                                <tr>
                                    <td>김개똥</td>
                                    <td class="star-rating">★★★★★</td>
                                    <td class="star-rating">★★★☆☆</td>
                                    <td><input type="checkbox" class="warning-checkbox" checked></td>
                                </tr>
                                <tr>
                                    <td>김개똥</td>
                                    <td class="star-rating">★★★★★</td>
                                    <td class="star-rating">★★★★☆</td>
                                    <td><input type="checkbox" class="warning-checkbox"></td>
                                </tr>
                                <tr>
                                    <td>김개똥</td>
                                    <td class="star-rating">★★★★★</td>
                                    <td class="star-rating">★★★☆☆</td>
                                    <td><input type="checkbox" class="warning-checkbox"></td>
                                </tr>
                                <tr>
                                    <td>김개똥</td>
                                    <td class="star-rating">★★★★★</td>
                                    <td class="star-rating">★★★★☆</td>
                                    <td><input type="checkbox" class="warning-checkbox"></td>
                                </tr>
                            </tbody>
                        </table>

                    <!-- B팀 선수 평가 -->
                    <div class="result-label">B팀</div>
                        <table class="player-table">
                            <thead>
                                <tr>
                                    <th>선수</th>
                                    <th>실력 평점</th>
                                    <th>매너 평점</th>
                                    <th>경고</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>인최리</td>
                                    <td class="star-rating">★★★★★</td>
                                    <td class="star-rating">★★★★☆</td>
                                    <td><input type="checkbox" class="warning-checkbox"></td>
                                </tr>
                                <tr>
                                    <td>인최리</td>
                                    <td class="star-rating">★★★★★</td>
                                    <td class="star-rating">★★★☆☆</td>
                                    <td><input type="checkbox" class="warning-checkbox" checked></td>
                                </tr>
                                <tr>
                                    <td>인최리</td>
                                    <td class="star-rating">★★★★★</td>
                                    <td class="star-rating">★★★★☆</td>
                                    <td><input type="checkbox" class="warning-checkbox"></td>
                                </tr>
                                <tr>
                                    <td>인최리</td>
                                    <td class="star-rating">★★★★☆</td>
                                    <td class="star-rating">★★★☆☆</td>
                                    <td><input type="checkbox" class="warning-checkbox"></td>
                                </tr>
                                <tr>
                                    <td>인최리</td>
                                    <td class="star-rating">★★★★☆</td>
                                    <td class="star-rating">★★★★☆</td>
                                    <td><input type="checkbox" class="warning-checkbox"></td>
                                </tr>
                            </tbody>
                        </table>

                </div>
                    <!-- 등록 버튼 -->
                    <button class="registration-button">등록하기</button>
            </div>

        <jsp:include page="/WEB-INF/views/footer.jsp" />
        </div>
</body>
</html>