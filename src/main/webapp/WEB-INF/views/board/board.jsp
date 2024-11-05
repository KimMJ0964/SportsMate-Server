<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
<link href="resources/css/board/board.css" rel="stylesheet" >
<style>
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/header.jsp" />
		<div class="board-desktop-container"> <!-- 전체적인 게시글 목록 페이지 -->
			<div class="desktop-board"> <!-- 데스크탑일 때 출력 -->
				<div class="board-banner">
					<img src="resources/img/board-banner.png" />
					<div class="banner-text">커뮤니티</div>
				</div>
				
				<div class="board-app-banner"><h4>커뮤니티</h4></div>
				
				<!-- 게시글 검색 -->
				<div class="board-search-container">
					<select class="board-search-option">
						<option value="">선택</option>
		                <option value="1">축구</option>
		                <option value="2">농구</option>
		                <option value="3">풋볼</option>
		                <option value="4">야구</option>
		                <option value="5">후기</option>
		                <option value="6">기타</option>
					</select>
					
					<input type="text" class="board-search-input" placeholder="검색어 입력" />
					
					<button type="submit" class="board-search-btn">검색</button>
				</div>
				
				<!-- 게시글 목록 -->
				<div class="board-table-container">
					<table>
			            <thead>
			                <tr>
			                    <th>번호</th>
			                    <th style="width: 50%;">제목</th>
			                    <th>닉네임</th>
			                    <th>게시일</th>
			                    <th>조회수</th>
			                </tr>
			            </thead>
			            <tbody>
			               <tr>
				              <td>5</td>
	                		  <td>게시글</td>
	                  		  <td>닉네임1</td>
	                		  <td>2024-01-01</td>
	                		  <td>100</td>
			               </tr>
			               <tr>
				              <td>4</td>
	                		  <td>게시글 게시글</td>
	                  		  <td>닉네임1</td>
	                		  <td>2024-01-01</td>
	                		  <td>100</td>
			               </tr>
			               <tr>
				              <td>3</td>
	                		  <td>게시글 게시글 게시글</td>
	                  		  <td>닉네임1</td>
	                		  <td>2024-01-01</td>
	                		  <td>100</td>
			               </tr>
			               <tr>
				              <td>2</td>
	                		  <td>게시글 게시글 게시글 게시글</td>
	                  		  <td>닉네임1</td>
	                		  <td>2024-01-01</td>
	                		  <td>100</td>
			               </tr>
			               <tr>
				              <td>1</td>
	                		  <td>게시글 게시글 게시글 게시글 게시글</td>
	                  		  <td>닉네임1</td>
	                		  <td>2024-01-01</td>
	                		  <td>100</td>
			               </tr>
			            </tbody>
			        </table>
			        
			        <!-- 페이지네이션 -->
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
				
				<div class="board-app-table-container"> <!-- 앱일 때 출력 -->
					<table>
				        <tr>
				            <td rowspan="3" class="board-app-table-num" >5</td>
				            <td class="board-app-table-title" colspan="2">제목</td>
				        </tr>
				        <tr>
				            <td class="board-app-table-view" colspan="2"><img src="resources/img/board_view.png" /> 3</td>
				        </tr>
				        <tr>
				            <td class="board-app-table-type">농구</td>
				            <td class="board-app-table-date">2024/11/05</td>
				        </tr>
				    </table>
				    <table>
				        <tr>
				            <td rowspan="3" class="board-app-table-num" >4</td>
				            <td class="board-app-table-title" colspan="2">제목 제목</td>
				        </tr>
				        <tr>
				            <td class="board-app-table-view" colspan="2"><img src="resources/img/board_view.png" /> 32</td>
				        </tr>
				        <tr>
				            <td class="board-app-table-type">풋살</td>
				            <td class="board-app-table-date">2024/11/03</td>
				        </tr>
				    </table>
				    <table>
				        <tr>
				            <td rowspan="3" class="board-app-table-num" >3</td>
				            <td class="board-app-table-title" colspan="2">제목 제목 제목</td>
				        </tr>
				        <tr>
				            <td class="board-app-table-view" colspan="2"><img src="resources/img/board_view.png" /> 28</td>
				        </tr>
				        <tr>
				            <td class="board-app-table-type">후기</td>
				            <td class="board-app-table-date">2024/10/30</td>
				        </tr>
				    </table>
				    <table>
				        <tr>
				            <td rowspan="3" class="board-app-table-num" >2</td>
				            <td class="board-app-table-title" colspan="2">제목 제목 제목 제목</td>
				        </tr>
				        <tr>
				            <td class="board-app-table-view" colspan="2"><img src="resources/img/board_view.png" /> 67</td>
				        </tr>
				        <tr>
				            <td class="board-app-table-type">야구</td>
				            <td class="board-app-table-date">2024/10/29</td>
				        </tr>
				    </table>
				    <table>
				        <tr>
				            <td rowspan="3" class="board-app-table-num" >1</td>
				            <td class="board-app-table-title" colspan="2">제목 제목 제목 제목 제목</td>
				        </tr>
				        <tr>
				            <td class="board-app-table-view" colspan="2"><img src="resources/img/board_view.png" /> 103</td>
				        </tr>
				        <tr>
				            <td class="board-app-table-type">축구</td>
				            <td class="board-app-table-date">2024/10/29</td>
				        </tr>
				    </table>
				    
				</div>
				
				<!-- 글쓰기 버튼 -->
				<div class="board-createMove-btn-container" >
					<Button class="board-plus-btn">➖</Button>
            		<Button class="board-minus-btn">➕</Button>
					<Button class="board-createMove-btn">글쓰기</Button>
				</div>
			</div>


		</div>
		<!-- board-container 끝 -->
	</div>
	<!-- wrap 끝 -->
	<jsp:include page="/WEB-INF/views/footer.jsp" />
</body>
</html>