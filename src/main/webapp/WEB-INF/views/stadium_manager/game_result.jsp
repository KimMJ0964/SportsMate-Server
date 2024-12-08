<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <br>
        <div class="warning-container" id="warningContainer" style="display: none;">
        <jsp:include page="/WEB-INF/views/stadium_manager/game_result_warning.jsp" />
        </div>
        <jsp:include page="/WEB-INF/views/common/nav.jsp" />

        <div class="gameresult-container">
            <div class="headname-container">
                <div class="gamersult-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/result_game.png" alt="경기 결과 로고" class="gameresult-logo">
                        <div class="team-details">
                            <h4 class="head-name">경기 결과</h4>
                            <input type="hidden" name="matchNo" value="${matchNo}">
<%--                            <input type="hidden" name="matchNo" value="2">--%>
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
<%--                        <div class="team-name" data-teamNo="1">A팀</div>--%>
                        <div class="team-name" data-teamNo="${teamAInfo.teamNo}">A팀</div>
                        <img src="${pageContext.request.contextPath}/resources/images/userProFile/${teamAInfo.changeName}" alt="팀 로고" class="team-logo">
<%--                        <div class="team-details">우리동네FC</div>--%>
                        <div class="team-details">${teamAInfo.teamName}</div>
<%--                        <input type="hidden" name="teamANo" value="1">--%>
                        <input type="hidden" name="teamANo" value="${teamAInfo.teamNo}">
                    </div>
                    <div class="checkbox-container">
                        <input type="number" name="teamA" id="team-a-checkbox" class="custom-radio" required>
                    </div>
                </div>
                
                <div class="divider"></div>
                
                <div class="victory2-row">
                    <div class="team-info">
<%--                        <div class="team-name" data-teamNo="3">B팀</div>--%>
                        <div class="team-name" data-teamNo="${teamBInfo.teamNo}">B팀</div>
                        <img src="${pageContext.request.contextPath}/resources/images/userProFile/${teamBInfo.changeName}" alt="팀 로고" class="team-logo">
<%--                        <div class="team-details">우리동네FC</div>--%>
                        <div class="team-details">${teamBInfo.teamName}</div>
<%--                        <input type="hidden" name="teamBNo" value="3">--%>
                        <input type="hidden" name="teamBNo" value="${teamBInfo.teamNo}">
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
                                                     data-rating="0" data-teamNo="${teamAInfo.teamNo}">
                                                    <span class="star" data-value="1">★</span>
                                                    <span class="star" data-value="2">★</span>
                                                    <span class="star" data-value="3">★</span>
                                                    <span class="star" data-value="4">★</span>
                                                    <span class="star" data-value="5">★</span>
                                                </div>
                                            </td>
                                            <td class="star-rating">
                                                <div class="star-container manner" data-memNo="${teamAMember.memNo}"
                                                     data-rating="0" data-teamNo="${teamAInfo.teamNo}">
                                                    <span class="star" data-value="1">★</span>
                                                    <span class="star" data-value="2">★</span>
                                                    <span class="star" data-value="3">★</span>
                                                    <span class="star" data-value="4">★</span>
                                                    <span class="star" data-value="5">★</span>
                                                </div>
                                            </td>
                                            <td><input type="checkbox" class="warning-checkbox" onclick="openModal()">
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
<%--                                <tr>--%>
<%--                                    <td>김개똥</td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container skill" data-memNo="2" data-rating="0" data-teamNo="1">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container manner" data-memNo="2" data-rating="0" data-teamNo="1">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td><input type="checkbox" class="warning-checkbox" onclick="openModal()"></td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>김개똥2</td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container skill" data-memNo="3" data-rating="0" data-teamNo="1">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container manner" data-memNo="3" data-rating="0" data-teamNo="1">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td><input type="checkbox" class="warning-checkbox" onclick="openModal()"></td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>김개똥</td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container skill" data-memNo="5" data-rating="0" data-teamNo="1">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container manner" data-memNo="5" data-rating="0" data-teamNo="1">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td><input type="checkbox" class="warning-checkbox" onclick="openModal()"></td>--%>
<%--                                </tr>--%>

<%--                                <tr>--%>
<%--                                    <td>김개똥</td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container" data-rating="0">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container" data-rating="0">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td><input type="checkbox" class="warning-checkbox" onclick="openModal()"></td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>김개똥</td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container" data-rating="0">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container" data-rating="0">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td><input type="checkbox" class="warning-checkbox" onclick="openModal()"></td>--%>
<%--                                </tr>--%>
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
                            <c:choose>
                                <c:when test="${not empty teamBMemberList}">
                                    <c:forEach var="teamBMember" items="${teamBMemberList}">
                                        <tr>
                                            <td>${teamBMember.memName}</td>
                                            <td class="star-rating">
                                                <div class="star-container skill" data-memNo="${teamBMember.memNo}"
                                                     data-rating="0" data-teamNo="${teamBInfo.teamNo}">
                                                    <span class="star" data-value="1">★</span>
                                                    <span class="star" data-value="2">★</span>
                                                    <span class="star" data-value="3">★</span>
                                                    <span class="star" data-value="4">★</span>
                                                    <span class="star" data-value="5">★</span>
                                                </div>
                                            </td>
                                            <td class="star-rating">
                                                <div class="star-container manner" data-memNo="${teamAMember.memNo}"
                                                     data-rating="0" data-teamNo="${teamBInfo.teamNo}">
                                                    <span class="star" data-value="1">★</span>
                                                    <span class="star" data-value="2">★</span>
                                                    <span class="star" data-value="3">★</span>
                                                    <span class="star" data-value="4">★</span>
                                                    <span class="star" data-value="5">★</span>
                                                </div>
                                            </td>
                                            <td><input type="checkbox" class="warning-checkbox" onclick="openModal()">
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
<%--                                <tr>--%>
<%--                                    <td>인최리</td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container skill" data-memNo="6" data-rating="0" data-teamNo="3" >--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container manner" data-memNo="6" data-rating="0" data-teamNo="3">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td><input type="checkbox" class="warning-checkbox" onclick="openModal()"></td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>인최리</td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container skill" data-memNo="7" data-rating="0" data-teamNo="3">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container manner" data-memNo="7" data-rating="0" data-teamNo="3">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td><input type="checkbox" class="warning-checkbox" onclick="openModal()"></td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>인최리</td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container skill" data-memNo="8" data-rating="0" data-teamNo="3">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container manner" data-memNo="8" data-rating="0" data-teamNo="3">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td><input type="checkbox" class="warning-checkbox" onclick="openModal()"></td>--%>
<%--                                </tr>--%>

<%--                                <tr>--%>
<%--                                    <td>인최리</td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container" data-rating="0">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container" data-rating="0">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td><input type="checkbox" class="warning-checkbox" onclick="openModal()"></td>--%>
<%--                                </tr>--%>
<%--                                <tr>--%>
<%--                                    <td>인최리</td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container" data-rating="0">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td class="star-rating">--%>
<%--                                        <div class="star-container" data-rating="0">--%>
<%--                                            <span class="star" data-value="1">★</span>--%>
<%--                                            <span class="star" data-value="2">★</span>--%>
<%--                                            <span class="star" data-value="3">★</span>--%>
<%--                                            <span class="star" data-value="4">★</span>--%>
<%--                                            <span class="star" data-value="5">★</span>--%>
<%--                                        </div>--%>
<%--                                    </td>--%>
<%--                                    <td><input type="checkbox" class="warning-checkbox" onclick="openModal()"></td>--%>
<%--                                </tr>--%>
                            </tbody>
                        </table>

                        <button class="registration-button" onclick="clickRegisterBtn()">등록하기</button>

                </div>
                    <!-- 뒤로가기 버튼 -->
                    <button type="button" class="registration2-button" onclick="history.back()">뒤로가기</button>
            </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
        </div>
    <!-- The Modal -->
    <div class="modal fade" id="applyNow">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">경고</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="warning_reason.gp" method="post" class="modal-form">
                        <input type="hidden" name="memNo" >
                        <div class="content-wrap center">
                            <div class="team-logo-wrap">
                                <c:choose>
                                    <c:when test="${detailInfo.teamProfileChangeName ne null}">
                                        <img src="${pageContext.request.contextPath}/resources/images/userProFile/${detailInfo.teamProfileChangeName}"
                                             alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/resources/images/user_default_profile.png"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="team-info-wrap">
                                <p class="team-name">${detailInfo.teamName}</p>
                                <p class="memberCount"><img
                                        src="${pageContext.request.contextPath}/resources/images/userIcon.svg"
                                        alt="">${detailInfo.memberCount}</p>
                                <p>${detailInfo.activityArea}</p>
                            </div>
                        </div>
                        <div id="apply-from-wrap">
                            <textarea name="introduce" id="recruit" cols="30" rows="10"
                                      placeholder="구단 가입 신청서를 작성해주세요."></textarea>
                            <span>가입 신청시 회원가입시 작성된 정보가 함께 넘어갑니다.</span>
                            <span>구단에게는 내 프로필이 공개되고, 신청을 수락하면 내 연락처를 볼 수 있습니다.</span>
                            <span>원활한 소통을 위해 개인정보 제3자 제공에 동의합니다.</span>
                            <button type="submit">가입 신청</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
        <script src="${pageContext.request.contextPath}/resources/js/stadium_manager/game_result.js"></script>
        <script src="${pageContext.request.contextPath}/resources/js/stadium_manager/game_result_warning.js"></script>
</body>
</html>