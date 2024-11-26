<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대관 승인 페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/stadium_manager/rental_approval.css">

    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
        rel="stylesheet">

    <script src="${pageContext.request.contextPath}/resources/js/stadium_manager/stadium_refond.js"></script>

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
                <div class="victory-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기 결과 로고" class="gameresult-logo">
                        <form action="">
                            <ul>
                                <li><b>서울 남도빌딩 경기장</b></li>
                                <li><b>우리동네FC VS 남의동네FC</b></li>
                                <li><b>12 : 00 ~ 14 : 00 </b></li>
                            </ul>
                            <div class="refond-btns">
                                <button type="button" id="refond-modal-btn" class="refund-btn" onclick="openModal()">환불</button>
                                <div id="modal" class="dialog">
                                    <div class="tb">
                                      <div class="inner" style="max-width:400px; box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.3);">
                                        <div class="top">
                                            <div class="title">환불 사유</div>
                                        </div>
                                        <div class="ct">
                                        <input class="refond-text" type="text" placeholder="환불 사유를 입력해주세요.">
                                        <select name="reason" id="reason">
                                            <option value="">환불 사유 선택</option>
                                            <option value="천재지변">천재지변</option>
                                            <option value="구장상태">구장상태</option>
                                        </select>
                                        </div>
                                        <div>
                                            <a href="#" class="refond-registration-btn" onclick="closeModal()">등록</a>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기 결과 로고" class="gameresult-logo">
                        <form action="">
                            <ul>
                                <li><b>서울 남도빌딩 경기장</b></li>
                                <li><b>우리동네FC VS 남의동네FC</b></li>
                                <li><b>12 : 00 ~ 14 : 00 </b></li>
                            </ul>
                            <div class="refond-btns">
                                <button class="refund-btn">환불</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기 결과 로고" class="gameresult-logo">
                        <form action="">
                            <ul>
                                <li><b>서울 남도빌딩 경기장</b></li>
                                <li><b>우리동네FC VS 남의동네FC</b></li>
                                <li><b>12 : 00 ~ 14 : 00 </b></li>
                            </ul>
                            <div class="refond-btns">
                                <button class="refund-btn">환불</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기 결과 로고" class="gameresult-logo">
                        <form action="">
                            <ul>
                                <li><b>서울 남도빌딩 경기장</b></li>
                                <li><b>우리동네FC VS 남의동네FC</b></li>
                                <li><b>12 : 00 ~ 14 : 00 </b></li>
                            </ul>
                            <div class="refond-btns">
                                <button class="refund-btn">환불</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기 결과 로고" class="gameresult-logo">
                        <form action="">
                            <ul>
                                <li><b>서울 남도빌딩 경기장</b></li>
                                <li><b>우리동네FC VS 남의동네FC</b></li>
                                <li><b>12 : 00 ~ 14 : 00 </b></li>
                            </ul>
                            <div class="refond-btns">
                                <button class="refund-btn">환불</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            
            <!-- 뒤로가기 버튼 -->
            <button class="registration-button" onclick="location.href = 'managermypage.me'" alt="" onclick="location.href = '${pageContext.request.contextPath}/managermypage.me'">뒤로가기</button>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />

    </div>
</body>
</html>