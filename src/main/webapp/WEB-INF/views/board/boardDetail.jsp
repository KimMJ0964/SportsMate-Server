<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
<link href="${pageContext.request.contextPath}/resources/css/board/boardDetail.css" rel="stylesheet" >
<title>게시글 상세</title>
<style>     
</style>
</head>
<body>
    <div class="wrap">
    	<jsp:include page="/WEB-INF/views/header.jsp" />
		<br>
		<jsp:include page="/WEB-INF/views/nav.jsp" />
        <!-- 1. 게시글 제목 -->
        <div class="bd-title-container">
            <h1 class="bd-title">게시글 제목</h1>
            <!-- 2. 수평선 -->
            <hr>
            
            <!-- 3. 닉네임 / 게시일 / 조회수 -->
            <div class="bd-meta-info">
                닉네임 / 게시일 / 조회수
            </div>
        </div>
        
        <!-- 4. 게시글 내용 -->
        <div class="bd-content-container">
            <div class="bd-content">
                게시글 내용
            </div>
            <!-- 5. 버튼들 -->
            <div class="bd-button-container">
                <button class="bd-button">파일 다운로드</button>
                 <button class="bd-button">수정하기</button>
                 <button class="bd-red-button" data-bs-toggle="modal" data-bs-target="#reportModal">신고하기</button>
                 <div>
				 	<img class="bd-like" src="${pageContext.request.contextPath}/resources/images/board_like.png"/>
            		<div class="bd-like-count" style="text-align: center;">12</div>
            	</div>
            </div>
            <hr>
        </div>
        
        <!-- 8. 댓글 작성 폼 -->
        <div class="bd-comment-container">
            <h4>댓글 2</h4>
            <div class="bd-comment-section">
                <textarea class="bd-comment-textarea" rows="3" style="resize: none; width: 100%;"></textarea>
                <button class="bd-button" style="float: right;">댓글 작성 완료</button>
            </div>
        </div>
        <!-- 댓글 -->
        <div class="bd-comment">
            <div class="bd-comment-info">
                <img src="" style="width: 24px; height: 24px;" />
                <div class="bd-name">작성자 이름</div>
            </div>
                <div class="bd-comment-content">댓글 내용</div>
            <hr>
            <div class="bd-button-container">
                <button class="bd-red-button">댓글 삭제</button>
                <button class="bd-red-button" data-bs-toggle="modal" data-bs-target="#reportModal">신고하기</button>
                <button class="bd-button" onclick="toggleReplyForm(event)">답글 작성</button>
            </div>
            <div class="bd-reply-form">
                <textarea rows="3" style="width: 100%; height: 120px;  border: 2px solid #307DFA; resize: none; padding: 10px; font-size: 16px; box-sizing: border-box; border-radius: 8px;"></textarea>
                <button class="bd-button" style="float: right;" >답장 작성 완료</button>
            </div>
            <div class="bd-reply">
                <img src="" style="width: 24px; height: 24px;" />
                <div class="bd-name">답글 작성자 이름</div>
            </div>
                <div class="bd-comment-content">대댓글 내용</div>
            <hr>
            <div class="bd-button-container">
                <button class="bd-red-button">답글 삭제</button>
                <button class="bd-red-button" data-bs-toggle="modal" data-bs-target="#reportModal">신고하기</button>
                <button class="bd-button" onclick="toggleReplyForm(event)">답글 작성</button>
            </div>
        </div>
        
        <!-- 모달 -->
        <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">신고</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <div class="bd-report-title">
		        	<h5>사유 / 대상아이디</h5>
		        </div>
		        <br>
		        <div class="bd-report-content">
		        	<textarea class="bd-report-content-textarea" style="width: 100%; height: 300px;  border: 2px solid #307DFA; resize: none; padding: 10px; font-size: 16px; box-sizing: border-box; border-radius: 8px;"></textarea>
		        </div>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary">신고 완료</button>
		      </div>
		    </div>
		  </div>
		</div>
    <jsp:include page="/WEB-INF/views/footer.jsp" />
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/board/boardDetail.js"></script>
   

</body>
</html>