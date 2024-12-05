<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대관 승인 페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/stadium_manager/stadium_refund.css">

    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
        rel="stylesheet">

    <script src="${pageContext.request.contextPath}/resources/js/stadium_manager/stadium_refund.js"></script>

</head>
<body>
    <div class="wrap">
        <jsp:include page="/WEB-INF/views/common/header.jsp" />

        <br>

        <jsp:include page="/WEB-INF/views/common/nav.jsp" />

        <div class="rental-container"> 
            <div class="headname-container">
                <div class="gamersult-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/rental.png"
                            alt="환불" class="gameresult-logo">
                        <div class="team-details">
                            <h4 class="head-name">환불</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <p>결제 완료된 목록들이 나오면 환불 버튼</p>
        <div class="rentallist-container">
            <div class="victory-container">
                <div class="victory-container">
                    <h5 style="font-weight: bold; margin-bottom: 10px;">환불</h5>
                    <c:forEach var="refund" items="${refundPageData}">
                        <c:if test="${not empty refund.aaTeamName}">
                            <div class="victory-container" data-match-no="${refund.matchNo}">
                                <div class="victory-row">
                                    <div class="team-info">
                                        <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기 결과 로고" class="gameresult-logo">
                                            <ul>
                                                <li><b>${refund.stadiumName}</b></li>
                                                <li><b>${refund.aaTeamName} VS ${refund.bbTeamName}</b></li>
                                                <li><b>${refund.reservStart} ~ ${refund.reservEnd}</b></li>
                                            </ul>
                                            <input type="hidden" name="matchNo" value="${refund.matchNo}" />
                                            <div class="refund-btns">
                                                <button type="button" id="refund-modal-btn" class="refund-btn" onclick="openModal(`${refund.matchNo}`)">환불</button>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                
                <div id="modal" class="dialog">
                    <div class="tb">
                    <div class="inner" style="max-width:400px; box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.3);">
                        <div class="top">
                            <div class="title">환불 사유</div>
                        </div>
                        <div class="ct">
                    <form id="refundForm" action="${pageContext.request.contextPath}/refundProcess.me" method="post" onsubmit="submitRefund(event)">
                        <input type="hidden" name="matchNo" id="matchNo" /> <!-- matchNo 전달 -->
                        <input class="refund-text" name="refundContent" type="text" placeholder="환불 사유를 입력해주세요." required>
                        <select name="reasonType" id="reasonType" required>
                            <option value="환불 사유 선택">환불 사유 선택</option>
                            <option value="천재지변">천재지변</option>
                            <option value="구장상태">구장상태</option>
                        </select>
                        </div>
                        <div>
                            <button type="submit" class="refund-registration-btn">등록</button>
                            <button type="button" class="refund-cancel-btn" onclick="closeModal()">취소</button>
                        </div>
                    </form>
                    </div>
                    </div>
                </div>

            <div class="victory-container">
                <h5 style="font-weight: bold; margin-bottom: 10px;">환불 요청 내역</h5>
                <div class="victory-container">
                    <div class="victory-row">
                        <div class="team-info">
                            <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기 결과 로고" class="gameresult-logo">
                                <ul>
                                    <li><b>서울 남도빌딩 경기장</b></li>
                                    <li><b>우리동네FC VS 남의동네FC</b></li>
                                    <li><b>12 : 00 ~ 14 : 00</b></li>
                                </ul>
                                <div class="refund-btns">
                                    <button type="button" id="refund-modal-btn" class="refund-btn" onclick="openModal()">환불</button>
                                    <div id="modal" class="dialog">
                                        <div class="tb">
                                        <div class="inner" style="max-width:400px; box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.3);">
                                            <div class="top">
                                                <div class="title">환불 사유</div>
                                            </div>
                                            <div class="ct">
                                            <input class="refund-text" type="text" placeholder="환불 사유를 입력해주세요.">
                                            <select name="reason" id="reason">
                                                <option value="">환불 사유 선택</option>
                                                <option value="천재지변">천재지변</option>
                                                <option value="구장상태">구장상태</option>
                                            </select>
                                            </div>
                                            <div>
                                                <a href="#" class="refund-registration-btn" onclick="closeModal()">등록</a>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>

            
            <!-- 뒤로가기 버튼 -->
            <button class="registration-button" onclick="location.href = 'managermypage.me'" alt="" onclick="location.href = '${pageContext.request.contextPath}/managermypage.me'">뒤로가기</button>
            </div>
        </div>
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </div>
</body>
</html>