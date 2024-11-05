<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구장 관리자 메인 페이지</title>

    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/stadium_manager.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
    <jsp:include page="/WEB-INF/views/main.jsp" />


</head>
<body>

    <div class="container">
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

            <a href="#" class="menu-item">
                <img src="${pageContext.request.contextPath}/resources/images/result_game.png"
                     alt="경기 결과">경기 결과</a>

            <a href="#" class="menu-item">
                <img src="${pageContext.request.contextPath}/resources/images/rantal.png"
                 alt="대관 승인">대관 승인</a>

            <a href="#" class="menu-item">
                <img src="${pageContext.request.contextPath}/resources/images/game_list.png"
                     alt="경기 리스트">경기 리스트</a>

            <a href="#" class="menu-item">
                <img src="${pageContext.request.contextPath}/resources/images/information.png"
                 alt="구장 정보 수정/탈퇴">구장 정보 수정/탈퇴</a>

            <a href="#" class="menu-item">
                <img src="${pageContext.request.contextPath}/resources/images/inquiry.png"
                 alt="문의">문의</a>
        </div>

        <!-- 로그아웃 버튼 -->
        <button class="logout-button">로그아웃</button>


    </div>


</body>
</html>