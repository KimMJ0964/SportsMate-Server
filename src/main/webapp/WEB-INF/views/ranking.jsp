<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RankingPage</title>
<style>
    .wrap {
        max-width: 1200px;
        margin: auto;
    }
    /* 매칭 테이블 */
   	table {
        width: 50%;
        margin: auto;
        border-collapse: collapse;
        text-align: center;
    }
    tr {
        border-left: none;
        border-right: none;
    }
    td {
        padding: 8px;
        border-top: 1px solid #ddd;
        border-bottom: 1px solid #ddd;
    }
    .point {
        font-size: 0.8em;
        color: #888;
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
</style>
</head>
<body>
<div class="wrap">
<jsp:include page="header.jsp" />
    <p class="size">실시간 랭킹</p>
	<div class="sport-button-container">
        <button class="sport-btn">축구</button>
        <button class="sport-btn active">풋살</button>
        <button class="sport-btn">야구</button>
        <button class="sport-btn">농구</button>
    </div> 
    <div>
        <table>
            <tr>
                <td>1<img src="resources/img/team.png" /></td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>2<img src="resources/img/team.png" /></td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>3<img src="resources/img/team.png" /></td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>4<img src="resources/img/team.png" /></td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>5<img src="resources/img/team.png" /></td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>6<img src="resources/img/team.png" /></td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>7<img src="resources/img/team.png" /></td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>8<img src="resources/img/team.png" /></td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>9<img src="resources/img/team.png" /></td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>10<img src="resources/img/team.png" /></td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
        </table>
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
</div>
<jsp:include page="footer.jsp" />
    
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