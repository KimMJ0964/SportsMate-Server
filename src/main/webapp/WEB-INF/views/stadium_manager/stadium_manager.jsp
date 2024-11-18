<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구장 관리자 메인 페이지</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/stadium_manager/stadium_manager.css">

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

        <div class="stadium-container">
            <!-- 프로필 섹션 -->
            <div class="profile">
                <div class="profile-info">
                    <img src="${pageContext.request.contextPath}/resources/images/manager_profile.png" alt="프로필 이미지">
                    <div class="profile-details">
                        <strong>관리자</strong>
                        <span>ganeljea@naver.com</span>
                    </div>
                </div>
                <button>프로필 수정</button>
            </div>

            <!-- 메뉴 박스 -->
            <div class="menu-box">
                <h3>구장 관리자 메뉴</h3>

                <a href="#" class="menu-item" onclick="location.href = 'gameschedule.me'">
                    <img src="${pageContext.request.contextPath}/resources/images/game_list.png"
                        alt="" onclick="location.href = '${pageContext.request.contextPath}/gameschedule.me'">진행 예정 매치</a>

                <a href="#" class="menu-item" onclick="location.href = 'gamefinish.me'">
                    <img src="${pageContext.request.contextPath}/resources/images/result_game.png"
                        alt="" onclick="location.href = '${pageContext.request.contextPath}/gamefinish.me'">진행 완료 매치</a>

                <a href="#" class="menu-item" onclick="location.href = 'rentalapproval.me'">
                    <img src="${pageContext.request.contextPath}/resources/images/rental.png"
                        alt="" onclick="location.href = '${pageContext.request.contextPath}/rentalapproval.me'">대관 승인</a>

                <a href="#" class="menu-item" onclick="location.href = 'stadiuminfo.me'">
                    <img src="${pageContext.request.contextPath}/resources/images/information.png"
                    alt="" onclick="location.href = '${pageContext.request.contextPath}/stadiuminfo.me'">구장 정보 수정/탈퇴</a>

                <a href="#" class="menu-item" onclick="location.href = 'inquiry.me'">
                    <img src="${pageContext.request.contextPath}/resources/images/inquiry.png"
                    alt="" onclick="location.href = '${pageContext.request.contextPath}/inquiry.me'">문의</a>
            </div>

            <!-- 로그아웃 버튼 -->
            <form action="${pageContext.request.contextPath}/logout.me" method="post">
            <button class="logout-button">로그아웃</button>
            </form>
 

        </div>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
	<script src="${pageContext.request.contextPath}/resources/js/stadium_manager/stadium_manager.js"></script>

</body>
</html>