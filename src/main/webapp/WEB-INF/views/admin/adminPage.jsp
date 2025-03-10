<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>사이트 관리자 페이지</title>

        <link rel="stylesheet" type="text/css"
            href="${pageContext.request.contextPath}/resources/css/admin/adminPage.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">

        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
            rel="stylesheet">

        <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src='https://www.google.com/jsapi'></script>
        <script  src="${pageContext.request.contextPath}/resources/js/admin/adminPage.js"></script>

    </head>

    <body>
        <div class="wrap">

            <jsp:include page="/WEB-INF/views/common/header.jsp" />
            <br>
            <jsp:include page="/WEB-INF/views/common/nav.jsp" />

            <div class="mypage-container">
                <!-- 프로필 섹션 -->
                <div class="profile">
                    <div class="profile-info">
                        <img src="${pageContext.request.contextPath}/resources/images/my-profile.png" alt="프로필 이미지">
                        <div class="profile-details">
                            <strong>${loginMember.memName}</strong>
                            <span>${loginMember.memEmail}</span>
                        </div>
                    </div>
                </div>

                <!-- 메뉴 박스 -->
                <div class="menu-box">
                    <h3>대시보드</h3>
                    <div class="dash-board">
                        <div class="dash-1">
                            <fieldset>
                                <legend>신고 접수</legend>
                                <h4>${reportCount}건</h4>
                            </fieldset>
                        </div>
                        <div class="dash-2">
                            <fieldset>
                                <legend>차단 유저</legend>
                                <h4>${blockCount}명</h4>
                            </fieldset>
                        </div>
                    </div>
                    <div class="row">
                        
                        <div class="col-md-6">
                          <div id="chart_div2" class="chart"></div>
                        </div>
                    </div>
                </div>

                <div class="menu-box">
                    <h3>사이트 관리자 메뉴</h3>
                    <a href="adminReport.me?category=match" class="menu-item">
                        <img src="${pageContext.request.contextPath}/resources/images/report-match.png" alt="">경기 신고
                        관리</a>

                    <a href="adminReport.me?category=community" class="menu-item">
                        <img src="${pageContext.request.contextPath}/resources/images/report-community.png" alt="">게시글
                        신고 관리</a>

                    <a href="adminReport.me?category=comment" class="menu-item">
                        <img src="${pageContext.request.contextPath}/resources/images/report-comment.png" alt="">댓글 신고
                        관리</a>

                    <a href="blockList.me" class="menu-item">
                        <img src="${pageContext.request.contextPath}/resources/images/block-user.png" alt="">차단 유저
                        관리</a>
                </div>

                <!-- 로그아웃 버튼 -->
                <button class="logout-button" onclick="location.href = '${pageContext.request.contextPath}/logout.me'">로그아웃</button>


            </div>
            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
        </div>

    </body>

    </html>
        
