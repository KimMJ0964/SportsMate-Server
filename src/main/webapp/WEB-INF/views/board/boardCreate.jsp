<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 생성</title>
<style>
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/header.jsp" />
		<div class="bcm-container">
			<!-- 제목 -->
			<div class="bcm-title-container">
				<h3>제목</h3>
				<input placeholder="  제목을 입력하시오.">
			</div>
			
			<!-- 파일 업로드 / 종류 -->
			<div class="bcm-select-container">
				<select class="bcm-select-select">
					<option value="">선택</option>
	                <option value="1">축구</option>
	                <option value="2">농구</option>
	                <option value="3">풋볼</option>
	                <option value="4">야구</option>
	                <option value="5">후기</option>
	                <option value="6">기타</option>
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
					<textarea placeholder="내용을 입력하세요"></textarea>
				</div>
			</div>
			
			<!-- 버튼 -->
			<div class="bcm-button-content">
				<button class="bcm-back-btn">게시판 목록으로 돌아가기</button>
				<button class="bcm-complete-btn">게시글 생성</button>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	
</body>
</html>