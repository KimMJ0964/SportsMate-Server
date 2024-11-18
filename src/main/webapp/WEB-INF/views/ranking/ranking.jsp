<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RankingPage</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ranking/ranking.css">

		<!-- jQuery -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <!-- font -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
            rel="stylesheet">
</head>
<body>
    <div class="wrap">
        <jsp:include page="TeamSearch.jsp" />
        
        <br>
        
        <jsp:include page="/WEB-INF/views/common/nav.jsp" />
        
        <hr>
        
        <p class="size">실시간 랭킹</p>
        <div class="sport-button-container">
            <button class="sport-btn active">축구</button>
            <button class="sport-btn">풋살</button>
            <button class="sport-btn">야구</button>
            <button class="sport-btn">농구</button>
        </div>
        <div class="team">
			<div class="row">
	        	<div class="cell left"><span>1</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">리버풀FC</div>
	            <div class="cell right"><div class="point">Point</div>1389</div>
	        </div>
	        <div class="row">
	            <div class="cell left"><span>2</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">맨시티FC</div>
	            <div class="cell right"><div class="point">Point</div>1388</div>
	        </div>
	        <div class="row">
	            <div class="cell left"><span>3</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">첼시FC</div>
	            <div class="cell right"><div class="point">Point</div>1387</div>
	        </div>
	        <div class="row">
	            <div class="cell left"><span>4</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">아스널FC</div>
	            <div class="cell right"><div class="point">Point</div>1386</div>
	        </div>
	        <div class="row">
	            <div class="cell left"><span>5</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">노팅엄 포레스트FC</div>
	            <div class="cell right"><div class="point">Point</div>1385</div>
	        </div>
	        <div class="row">
	            <div class="cell left"><span>6</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">브라이턴FC</div>
	            <div class="cell right"><div class="point">Point</div>1384</div>
	        </div>
	        <div class="row">
	            <div class="cell left"><span>7</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">풀럼FC</div>
	            <div class="cell right"><div class="point">Point</div>1383</div>
	        </div>
	        <div class="row">
	            <div class="cell left"><span>8</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">뉴캐슬FC</div>
	            <div class="cell right"><div class="point">Point</div>1382</div>
	        </div>
	        <div class="row">
	            <div class="cell left"><span>9</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">애스턴 빌라FC</div>
	            <div class="cell right"><div class="point">Point</div>1381</div>
	        </div>
	        <div class="row">
	            <div class="cell left"><span>10</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">토트넘FC</div>
	            <div class="cell right"><div class="point">Point</div>1380</div>
	        </div>
	        <div class="row">
	            <div class="cell left"><span>11</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">브렌트퍼드FC</div>
	            <div class="cell right"><div class="point">Point</div>1379</div>
	        </div>
	        <div class="row">
	            <div class="cell left"><span>12</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">본머스FC</div>
	            <div class="cell right"><div class="point">Point</div>1378</div>
	        </div>
	        <div class="row">
	            <div class="cell left"><span>13</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">맨유FC</div>
	            <div class="cell right"><div class="point">Point</div>1377</div>
	        </div>
	        <div class="row">
	            <div class="cell left"><span>14</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">웨스트햄FC</div>
	            <div class="cell right"><div class="point">Point</div>1376</div>
	        </div>	 
	        <div class="row">
	        	<div class="cell left"><span>15</span><img src="resources/images/team.png" /></div>
	            <div class="cell center">레스터 시티FC</div>
	            <div class="cell right"><div class="point">Point</div>1375</div>
	        </div>  
	        <div class="row"></div>     	           
	    </div>  
        <div class="board-pagination">
            <button class="board-page-btn">&laquo;</button>
            <button class="board-page-btn">1</button>
            <button class="board-page-btn">2</button>
            <button class="board-page-btn">3</button>
            <button class="board-page-btn">4</button>
            <button class="board-page-btn">5</button>
            <button class="board-page-btn">&raquo;</button>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </div>
    <script src="${pageContext.request.contextPath}/resources/js/ranking/ranking.js"></script>
</body>
</html>