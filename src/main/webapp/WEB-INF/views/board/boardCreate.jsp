<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 생성</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/board/boardCM.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
<style>
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/header.jsp" />
		<br>
		<jsp:include page="/WEB-INF/views/nav.jsp" />
		<div class="bcm-container">
			<!-- 제목 -->
			<form method="post" action="create.bd" enctype="multipart/form-data">
				<div class="bcm-title-container">
					<h3>제목</h3>
					<input placeholder="  제목을 입력하시오." id="title" name="title">
				</div>
				
				<!-- 파일 업로드 / 종류 -->
				<div class="bcm-select-container">
					<select class="bcm-select-select" id="type" name="type">
						<option value="">선택</option>
		                <option value="축구">축구</option>
		                <option value="농구">농구</option>
		                <option value="풋살">풋살</option>
		                <option value="야구">야구</option>
		                <option value="후기">후기</option>
		                <option value="기타">기타</option>
					</select>
					
					<div class="bcm-upload-file">
						<label class="bcm-custom-upload-btn" for="fileUpload">파일 선택</label>
						<input type="file" id="fileUpload">
					</div>
				</div>
				
				<!-- 내용 -->
				<div class="bcm-content-container">
					<hr>
					<div class="bcm-content-textarea">
						<textarea placeholder="내용을 입력하세요" id="content" name="content"></textarea>
					</div>
				</div>
				
				<!-- 버튼 -->
				<div class="bcm-button-content">
					<button class="bcm-back-btn" onclick="location.href = 'boardList.bd'">게시판 목록으로 돌아가기</button>
					<button class="bcm-complete-btn" type="submit">게시글 생성</button>
				</div>
			</form>
		</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	</div>
	
</body>
</html>