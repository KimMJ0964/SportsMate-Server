<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>경기 결과</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stadium_manager/game_result.css">

    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
          rel="stylesheet">
</head>
<body>
    <div class="wrap">

        <jsp:include page="/WEB-INF/views/common/header.jsp"/>

        <br>
        <div class="warning-container" id="warningContainer" style="display: none;">
            <jsp:include page="/WEB-INF/views/stadium_manager/game_result_warning.jsp"/>
        </div>
        <jsp:include page="/WEB-INF/views/common/nav.jsp"/>

        <div class="gameresult-container">
            <div class="headname-container">
                <div class="gamersult-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/result_game.png" alt="경기 결과 로고"
                             class="gameresult-logo">
                        <div class="team-details">
                            <h4 class="head-name">경기 결과</h4>
                            <input type="hidden" name="matchNo" value="${matchNo}">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 승리 팀 표시 -->
        <div class="result-container">
            <div class="victory-container">
                <h4 class="victory-title">경기 결과</h4>
                <div class="victory-row">
                    <div class="team-info">
                        <div class="team-name" data-teamNo="${teamInfo.teamANo}">A팀</div>
                        <c:choose>
                            <c:when test="${teamInfo.teamAChangeName != null}">
                                <img src="${pageContext.request.contextPath}/resources/images/userProFile/${teamInfo.teamAChangeName}"
                                     alt="팀 로고" class="team-logo">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/resources/images/user_default_profile.png"
                                     alt="Default Profile" class="team-logo"/>
                            </c:otherwise>
                        </c:choose>
                        <div class="team-details">${teamInfo.teamAName}</div>
                        <input type="hidden" name="teamANo" value="${teamInfo.teamANo}">

                    </div>
                    <div class="checkbox-container">
                        <input type="number" name="teamA" id="team-a-checkbox" class="custom-radio" required>
                    </div>
                </div>

                <div class="divider"></div>

                <div class="victory2-row">
                    <div class="team-info">
                        <div class="team-name" data-teamNo="${teamInfo.teamBNo}">B팀</div>
                        <c:choose>
                            <c:when test="${teamInfo.teamBChangeName != null}">
                                <img src="${pageContext.request.contextPath}/resources/images/userProFile/${teamInfo.teamBChangeName}"
                                     alt="팀 로고" class="team-logo">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/resources/images/user_default_profile.png"
                                     alt="Default Profile" class="team-logo"/>
                            </c:otherwise>
                        </c:choose>
                        <div class="team-details">${teamInfo.teamBName}</div>
                        <input type="hidden" name="teamBNo" value="${teamInfo.teamBNo}">

                    </div>
                    <div class="checkbox-container">
                        <input type="number" name="teamB" id="team-b-checkbox" class="custom-radio" required>
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
                    <c:choose>
                        <c:when test="${not empty teamAMemberList}">
                            <c:forEach var="teamAMember" items="${teamAMemberList}">
                                <tr>
                                    <td>${teamAMember.memName}</td>
                                    <td class="star-rating">
                                        <div class="star-container skill" data-memNo="${teamAMember.memNo}"
                                             data-rating="0" data-teamNo="${teamInfo.teamANo}">
                                            <span class="star" data-value="1">★</span>
                                            <span class="star" data-value="2">★</span>
                                            <span class="star" data-value="3">★</span>
                                            <span class="star" data-value="4">★</span>
                                            <span class="star" data-value="5">★</span>
                                        </div>
                                    </td>
                                    <td class="star-rating">
                                        <div class="star-container manner" data-memNo="${teamAMember.memNo}"
                                             data-rating="0" data-teamNo="${teamInfo.teamANo}">
                                            <span class="star" data-value="1">★</span>
                                            <span class="star" data-value="2">★</span>
                                            <span class="star" data-value="3">★</span>
                                            <span class="star" data-value="4">★</span>
                                            <span class="star" data-value="5">★</span>
                                        </div>
                                    </td>
                                    <td>
                                        <button type="button" class="expose" data-memNo="${teamAMember.memNo}"
                                                data-bs-toggle="modal"
                                                data-bs-target="#warningModal" onclick="warningBtnClick(event)">경고
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="4"> 멤버가 없습니다.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose></tbody>
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
                    <c:choose>
                        <c:when test="${not empty teamBMemberList}">
                            <c:forEach var="teamBMember" items="${teamBMemberList}">
                                <tr>
                                    <td>${teamBMember.memName}</td>
                                    <td class="star-rating">
                                        <div class="star-container skill" data-memNo="${teamBMember.memNo}"
                                             data-rating="0" data-teamNo="${teamInfo.teamBNo}">
                                            <span class="star" data-value="1">★</span>
                                            <span class="star" data-value="2">★</span>
                                            <span class="star" data-value="3">★</span>
                                            <span class="star" data-value="4">★</span>
                                            <span class="star" data-value="5">★</span>
                                        </div>
                                    </td>
                                    <td class="star-rating">
                                        <div class="star-container manner" data-memNo="${teamBMember.memNo}"
                                             data-rating="0" data-teamNo="${teamInfo.teamBNo}">
                                            <span class="star" data-value="1">★</span>
                                            <span class="star" data-value="2">★</span>
                                            <span class="star" data-value="3">★</span>
                                            <span class="star" data-value="4">★</span>
                                            <span class="star" data-value="5">★</span>
                                        </div>
                                    </td>
                                    <td>
                                            <%--                                                <input type="checkbox" class="warning-checkbox" onclick="openModal(${teamBMember.memNo})">--%>
                                        <button type="button" id="warning-btn" class="expose"
                                                data-memNo="${teamBMember.memNo}"
                                                data-bs-toggle="modal"
                                                data-bs-target="#warningModal" onclick="warningBtnClick(event)">경고
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="4"> 멤버가 없습니다.</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>

                <button class="registration-button" onclick="clickRegisterBtn()">등록하기</button>

            </div>
            <!-- 뒤로가기 버튼 -->
            <button type="button" class="registration2-button" onclick="history.back()">뒤로가기</button>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    </div>
    <!-- The Modal -->
    <div class="modal fade" id="warningModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">경고</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <input type="hidden" name="memNo">
                    <input type="hidden" name="pnReporter" value="${loginMember.memNo}">

                    <%--                        <input type="hidden" name="pnGround" value="${stadiumNo}">--%>
                    <input type="hidden" name="pnGround" value="${stadiumNo}">
                    <div class="content-wrap center">
                        <div class="content-title margin">
                            경고 선수명
                            <input type="text" id="name-input" value="" readonly>
                        </div>
                        <div class="report-wrap margin">
                        </div>
                        <div class="content-title margin">
                            경고 사유
                        </div>
                        <div class="report-wrap margin">
                            <textarea name="pnContent" id="reason-for-report" rows="5" cols="20"
                                      placeholder="경고 사유를 입력하세요."></textarea>
                        </div>
                        <div class="submit-btn-wrap margin">
                            <button type="button" id="warning-submit-btn" onclick="requestWarning()">경고 등록하기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/stadium_manager/game_result.js"></script>
</body>
</html>