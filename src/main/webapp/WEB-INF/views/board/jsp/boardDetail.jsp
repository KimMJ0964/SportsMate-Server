<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 상세</title>
<style>
        /* 스타일 예시 */
        body {
            font-family: Arial, sans-serif;
            margin: 0 auto;
            max-width: 1200px;
            box-sizing: border-box;
        }
        .bd-title-container, .bd-content-container, .bd-comment-container {
            margin: 0 auto;
        }
        .bd-title-container {
            width: 80%;
            text-align: center;
        }
        .bd-title {
            font-size: 24px;
            font-weight: bold;
        }
        .bd-meta-info {
            color: #888;
            font-size: 14px;
            margin-bottom: 10px;
            text-align: right;
        }
        .bd-content-container {
            width: 70%;
        }
        .bd-content {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 3px;
            margin: 20px 0;
            height: 250px;
        }
        .bd-button-container {
            display: flex;
            justify-content: right;
            margin-bottom: 10px;
            gap: 15px;
        }
        .bd-comment-container {
            width: 60%;
        }
        .bd-comment-section {
            padding: 10px;
            margin-bottom: 50px;
        }
        .bd-comment {
            border: 1px solid #ccc;
            padding: 15px;
            margin-top: 15px;
            border-radius: 5px;
            margin-bottom: 150px;
        }
        .bd-comment-textarea {
        	height: 150px;
        }
        .bd-comment-info {
            display: flex;
            align-items: center;
        }
        .bd-profile {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #ccc;
            display: inline-block;
            margin-right: 10px;
        }
        .bd-comment-content {
            margin-left: 10px;
            font-size: 14px;
        }
        .bd-reply-form {
            display: none;
            margin-top: 10px;
        }
        .bd-reply {
            display: flex;
            align-items: center;
            margin-left: 20px;
            margin-top: 10px;
        }
        .bd-reply .bd-button-container {
            margin-left: 20px;
            margin-top: 5px;
            gap: 10px;
        }
        .bd-button, .bd-red-button {
            height: 40px;
            border-style: none;
            color: white;
            font-weight: bold;
            border-radius: 8px;
        }
        .bd-button {
            background-color: #1D87FA;
        }
        .bd-red-button {
            background-color: #FA1D1D;
        }

        @media (max-width: 430px) {
            .bd-content-container {
                width: 90%;
            }

            .bd-comment-container {
                width: 90%;
            }
        }
        
    </style>
</head>
<body>
    <div class="warp">
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
                <div>
                    <button class="bd-button">수정하기</button>
                    <div style="position: relative; display: inline-block; text-align: center;">
					    <img src="${pageContext.request.contextPath}/resources/img/board_like.png" style="width: 100%;">
					    <div style="position: absolute; bottom: 10px; left: 50%; transform: translateX(-50%); font-size: 16px; padding: 5px;">
					        좋아요
					    </div>
					</div>
                </div>
            </div>
            <hr>
        </div>
        
        <!-- 8. 댓글 작성 폼 -->
        <div class="bd-comment-container">
            <h3>댓글 2</h3>
            <div class="bd-comment-section">
                <textarea class="bd-comment-textarea" rows="3" style="resize: none; width: 100%;"></textarea>
                <button class="bd-button" style="float: right;">댓글 작성 완료</button>
            </div>
        </div>
        <!-- 댓글 -->
        <div class="bd-comment">
            <div class="bd-comment-info">
                <div class="bd-profile"></div>
                <div class="bd-name">작성자 이름</div>
                <div class="bd-comment-content">댓글 내용</div>
            </div>
            <hr>
            <div class="bd-button-container">
                <button class="bd-red-button">댓글 삭제</button>
                <button class="bd-red-button">신고하기</button>
                <button class="bd-button" onclick="toggleReplyForm(event)">답글 작성</button>
            </div>
            <div class="bd-reply-form">
                <textarea rows="3" style="resize: none; width: 100%;"></textarea>
                <button class="bd-button" style="float: right;" >답장 작성 완료</button>
            </div>
            <div class="bd-reply">
                <div class="bd-profile"></div>
                <div class="bd-name">답글 작성자 이름</div>
                <div class="bd-comment-content">대댓글 내용</div>
            </div>
            <hr>
            <div class="bd-button-container">
                <button class="bd-red-button">답글 삭제</button>
                <button class="bd-red-button">신고하기</button>
                <button class="bd-button" onclick="toggleReplyForm(event)">답글 작성</button>
            </div>
        </div>
    </div>
    <script>
        // 답글 작성 폼을 토글하는 함수
        function toggleReplyForm(event) {
            const replyForm = event.target.closest('.bd-comment').querySelector('.bd-reply-form');
            replyForm.style.display = replyForm.style.display === 'block' ? 'none' : 'block';
        }
    </script>

</body>
</html>