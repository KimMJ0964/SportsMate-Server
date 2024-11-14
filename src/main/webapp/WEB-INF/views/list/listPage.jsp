<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>리스트 페이지</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">

		<!-- jQuery -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
            rel="stylesheet">
<style>
.video-grid{
    display: grid;
    column-gap: 16px;
    row-gap: 40px;
    padding-bottom:100px;
}

@media (max-width: 484px){
    .video-grid{ grid-template-columns: 1fr; }
}

@media (min-width: 485px) and (max-width:749px){
    .video-grid{ grid-template-columns: 1fr 1fr; }
}

@media (min-width: 750px) and (max-width:999px){
    .video-grid{ grid-template-columns: 1fr 1fr 1fr; }
}

@media (min-width: 1000px){
    .video-grid{ grid-template-columns: 1fr 1fr 1fr 1fr; }

    .video-grid{
        padding-bottom:0px;
    }
}

.thumbnail-row{
    margin-bottom: 8px;
    position: relative;
}

.thumbnail{
    width: 100%;
    height: 200px;
}

.video-info-grid{
padding: 10px; /* 정보 영역에 패딩 추가 */
    border: 1px solid #e0e0e0; /* 테두리 추가 */
    border-radius: 5px; /* 모서리 둥글게 */
}

.video-title{
    font-size: 16px; /* 폰트 크기를 약간 키움 */
    font-weight: 700; /* 제목을 더 두껍게 */
    margin-bottom: 5px; /* 아래 여백을 줄여서 간격 조절 */
    color: #333; /* 제목 색상 변경 */
}

.video-author,
.video-state{
    font-size: 14px; /* 폰트 크기를 약간 키움 */
    color: #555; /* 색상 변경 */
}
</style>
</head>
<body>
<div class="wrap">
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<br>

<jsp:include page="/WEB-INF/views/common/nav.jsp" />

<br>

<section class="video-grid">
        <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
        <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
        <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
                <div class="video-priview">
            <div class="thumbnail-row">
                <img src="${pageContext.request.contextPath}/resources/images/stadium.png" alt="경기장" class="thumbnail" />
            </div>
            <div class="video-info-grid">
                <div class="video-info">
                	<p class="vider-author">서울 강남구 테헤란로</p>
                	<p class="vider-title">서울 강남구 KH체육관</p>
                	<p class="vider-state">풋살 2024-10-28</p>
                </div>
            </div>
        </div>
    </section>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</div>
</body>
</html>