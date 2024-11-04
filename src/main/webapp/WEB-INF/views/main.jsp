<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>네비게이션 바</title>

    <style>
        body {
    margin: 0; /* 브라우저의 기본 마진을 제거하여 전체 화면을 채움 */
    padding-bottom: 70px; /* 네비게이션 바의 높이만큼 하단에 패딩을 추가하여 콘텐츠가 네비게이션 바와 겹치지 않도록 설정 */
}

.nav-bar {
    position: fixed; /* 네비게이션 바를 화면에 고정시켜 스크롤해도 항상 같은 위치에 표시되도록 설정 */
    bottom: 0; /* 네비게이션 바를 화면의 아래쪽에 위치 */
    left: 50%; /* 네비게이션 바를 화면 너비의 50% 지점에 맞춤 */
    transform: translateX(-50%); /* left: 50%와 함께 사용하여 네비게이션 바를 화면의 수평 중앙에 정확히 맞춤 */
    display: flex; /* 내부 아이템을 가로로 배치하고, flexbox로 정렬을 쉽게 함 */
    justify-content: space-around; /* 각 네비게이션 아이템 사이에 균등한 간격을 설정 */
    align-items: center; /* 네비게이션 바 내 아이템을 수직 중앙 정렬 */
    width: 425px; /* 네비게이션 바의 너비를 425px로 고정 */
    height: 60px; /* 네비게이션 바의 높이를 60px로 고정 */
    background-color: #fff; /* 네비게이션 바 배경을 흰색으로 설정 */
    border: 1px solid #ddd; /* 네비게이션 바에 옅은 회색 테두리를 추가 */
    margin: 0 auto; /* 네비게이션 바를 가운데에 배치 */
}

/* 네비게이션 아이템 스타일 */
.nav-item {
    display: flex; /* 아이콘과 텍스트를 flexbox로 정렬 */
    flex-direction: column; /* 아이템을 세로로 배치, 즉 아이콘 위에 텍스트가 위치하도록 설정 */
    align-items: center; /* 아이템 내부의 아이콘과 텍스트를 수평 중앙 정렬 */
    text-decoration: none; /* 링크의 밑줄을 제거 */
    color: #000; /* 텍스트 색상을 검정색으로 설정 */
    font-size: 12px; /* 텍스트 크기를 12px로 설정 */
}

.nav-item img {
    width: 24px; /* 아이콘의 너비를 24px로 설정 */
    height: 24px; /* 아이콘의 높이를 24px로 설정 */
    margin-bottom: 5px; /* 아이콘과 텍스트 사이에 5px 간격 추가 */
}


/* 미디어 쿼리: 화면 너비가 480px 이하일 때 적용 */
@media (max-width: 480px) {
    .nav-bar {
        flex-direction: row; /* 네비게이션 바 내 아이템을 가로로 배치 */
        height: auto; /* 네비게이션 바의 높이를 콘텐츠에 맞게 자동 조정 */
        width: 100%;
        padding: 10px 0; /* 네비게이션 바 위아래에 10px의 패딩을 추가 */
    }

    .nav-item {
        flex-direction:column /* 아이템 내부의 아이콘과 텍스트를 가로로 배치 */
        font-size: 10px; /* 텍스트 크기를 10px로 줄여 화면 크기에 맞게 조정 */
    }

    .nav-item img {
        margin-bottom: 0; /* 아이콘과 텍스트 사이의 간격을 없앰 */
        margin-right: 5px; /* 아이콘과 텍스트 사이에 5px의 오른쪽 마진을 추가하여 간격 확보 */
    }
}

/* 미디어 쿼리: 화면 너비가 481px 이상일 때 적용 */
@media (min-width: 481px) {
    .nav-bar {
        position: static; /* 네비게이션 바의 고정을 해제하여 기본 흐름에 따름 (상단으로 이동) */
        transform: none; /* 중앙 정렬 해제 */
        width: 80%; /* 네비게이션 바의 너비를 화면의 80%로 설정 */
        margin: 0 auto; /* 네비게이션 바를 가운데 정렬 */
        border-bottom: 1px solid #ddd; /* 네비게이션 바 아래쪽에 회색 테두리를 추가하여 상단에서 구분 */
        top: 0; /* 상단에 위치하게 설정 */
    }
}

    </style>
</head>
<body>

    <div class="nav-bar">
        <a href="#" class="nav-item">
            <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fwww.dogdrip.net%2Fdvs%2Fd%2F21%2F12%2F23%2Ffa7f5a2dceb2f39195401f74d3be07ac.png&type=a340" alt="구장정보">
            구장정보
        </a>
        <a href="#" class="nav-item">
            <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fwww.dogdrip.net%2Fdvs%2Fd%2F21%2F12%2F23%2Ffa7f5a2dceb2f39195401f74d3be07ac.png&type=a340" alt="구단메뉴">
            구단메뉴
        </a>
        <a href="#" class="nav-item">
            <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fwww.dogdrip.net%2Fdvs%2Fd%2F21%2F12%2F23%2Ffa7f5a2dceb2f39195401f74d3be07ac.png&type=a340" alt="홈">
            홈
        </a>
        <a href="#" class="nav-item">
            <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fwww.dogdrip.net%2Fdvs%2Fd%2F21%2F12%2F23%2Ffa7f5a2dceb2f39195401f74d3be07ac.png&type=a340" alt="커뮤니티">
            커뮤니티
        </a>
        <a href="#" class="nav-item">
            <img src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fwww.dogdrip.net%2Fdvs%2Fd%2F21%2F12%2F23%2Ffa7f5a2dceb2f39195401f74d3be07ac.png&type=a340" alt="랭킹">
            랭킹
        </a>
    </div>

</body>
</html>
