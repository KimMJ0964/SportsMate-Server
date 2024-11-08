<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RankingPage</title>
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
   .row {
	    display: flex;
	    align-items: center;
	    border-top: 1px solid #ddd;
	    padding: 4px 0;
	}
	
	.cell {
	    flex: 1; /* 셀을 균등하게 배분 */
	    text-align: center;
	}
	
	.left {
	    display: flex;
	    align-items: center;
	    justify-content: flex-start; /* 왼쪽 정렬 */
	    margin-left: 20px;
	}
	
	.left span {
	    display: inline-block;
	    width: 20px;
	    text-align: center;
	}
	
	.left img {
	    margin-left: 20px; /* 이미지와 숫자 사이의 간격 */
	}
	
	.center {
	    text-align: center; /* 가운데 정렬 */
	}
	
	.right {
	    text-align: right; /* 오른쪽 정렬 */
	    margin-right: 20px;
	}
	
	.point {
	    font-size: 0.8em;
	    color: #888;
	}
	
	.divider {
	    height: 1px; /* 줄의 두께 */
	    background-color: #ddd; /* 줄의 색상 */
	    margin: 0; /* 위아래 간격 */
	}

    /* 페이지네이션 */
    .board-pagination {
       display: flex;
       justify-content: center;
       margin: 20px 0;
    }
   
   .board-page-btn {
       border-style: none;
       color: #1D87FA;
       background-color: white;
       padding: 8px 12px;
       margin: 0 5px;
       border-radius: 5px;
       cursor: pointer;
       font-size: 16px;
    }
   
   .board-page-btn:hover {
       background-color: #1D87FA;
       color: white;
    }
	/* 종목 선택 css */
	.sport-button-container {
        display: flex;
	    justify-content: center; /* 중앙 정렬 */
	    width: 300px;
	    height: 40px;
	    border: 1px solid #333;
	    border-radius: 15px;
	    margin: 20px auto; /* 위아래 여백 */
	    padding: 5px; /* 내부 여백 추가 */
    }
    
    .sport-btn {
        border: none;
	    background-color: white;
	    padding: 0; /* padding을 0으로 설정하여 버튼 크기 조정 */
	    width: 60px; /* 버튼 너비 */
	    height: 30px; /* 버튼 높이 */
	    border-radius: 15px;
	    margin: 0 5px; /* 버튼 사이 간격 */
	    cursor: pointer;
	    transition: background-color 0.3s
    }

    .sport-btn:hover {
        background-color: #f0f0f0;
    }

    .sport-btn.active {
        background-color: #1D87FA;
        color: white;
    }
    /* 글 사이즈 */
    .size {
    	display: flex;
	    justify-content: center;
	    font-weight: bold;
    }
    /* 이미지 css */
    img {
    	margin: 20px;
    }
    
    hr {
    	background-color: black;
    }
</style>
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp" />

<br>

<jsp:include page="nav.jsp" />

<hr>

    <p class="size">실시간 랭킹</p>
	<div class="sport-button-container">
        <button class="sport-btn">축구</button>
        <button class="sport-btn active">풋살</button>
        <button class="sport-btn">야구</button>
        <button class="sport-btn">농구</button>
    </div> 
        <div class="row">
            <div class="cell left"><span>1</span><img src="resources/images/team.png" /></div>
            <div class="cell center">우리동네FC</div>
            <div class="cell right"><div class="point">Point</div>1389</div>
        </div>
        <div class="row">
            <div class="cell left"><span>2</span><img src="resources/images/team.png" /></div>
            <div class="cell center">우리동네FC</div>
            <div class="cell right"><div class="point">Point</div>1389</div>
        </div>
        <div class="row">
            <div class="cell left"><span>3</span><img src="resources/images/team.png" /></div>
            <div class="cell center">우리동네FC</div>
            <div class="cell right"><div class="point">Point</div>1389</div>
        </div>
        <div class="row">
            <div class="cell left"><span>4</span><img src="resources/images/team.png" /></div>
            <div class="cell center">우리동네FC</div>
            <div class="cell right"><div class="point">Point</div>1389</div>
        </div>
        <div class="row">
            <div class="cell left"><span>5</span><img src="resources/images/team.png" /></div>
            <div class="cell center">우리동네FC</div>
            <div class="cell right"><div class="point">Point</div>1389</div>
        </div>
        <div class="row">
            <div class="cell left"><span>6</span><img src="resources/images/team.png" /></div>
            <div class="cell center">우리동네FC</div>
            <div class="cell right"><div class="point">Point</div>1389</div>
        </div>
        <div class="row">
            <div class="cell left"><span>7</span><img src="resources/images/team.png" /></div>
            <div class="cell center">우리동네FC</div>
            <div class="cell right"><div class="point">Point</div>1389</div>
        </div>
        <div class="row">
            <div class="cell left"><span>8</span><img src="resources/images/team.png" /></div>
            <div class="cell center">우리동네FC</div>
            <div class="cell right"><div class="point">Point</div>1389</div>
        </div>
        <div class="row">
            <div class="cell left"><span>9</span><img src="resources/images/team.png" /></div>
            <div class="cell center">우리동네FC</div>
            <div class="cell right"><div class="point">Point</div>1389</div>
        </div>
        <div class="row">
            <div class="cell left"><span>10</span><img src="resources/images/team.png" /></div>
            <div class="cell center">우리동네FC</div>
            <div class="cell right"><div class="point">Point</div>1389</div>
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
<jsp:include page="footer.jsp" />
</div>
    
    <script>
        document.querySelectorAll('.sport-btn').forEach(button => {
            button.addEventListener('click', function() {
                document.querySelectorAll('.sport-btn').forEach(btn => btn.classList.remove('active'));
                this.classList.add('active');
            });
        });
    </script>
</body>
</html>