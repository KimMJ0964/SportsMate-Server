<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="${pageContext.request.contextPath}/resources/css/board/boardCM.css?after" rel="stylesheet" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <!-- include summernote css/js-->
<link href="${pageContext.request.contextPath}/resources/summernote/summernote-bs5.css" rel="stylesheet">
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<br>
		<jsp:include page="/WEB-INF/views/common/nav.jsp" />
		<div class="bcm-container">
			<!-- 제목 -->
			<form method="post" action="modify.bd?bno=${board.boardNo }" enctype="multipart/form-data">
				<div class="bcm-title-container">
					<h3>제목</h3>
					<input placeholder="  제목을 입력하시오." value="${board.title }" name="title">
				</div>
				
				<!-- 파일 업로드 / 종류 -->
				<div class="bcm-select-container">
					 <select class="bcm-select-select" name="type">
				        <option value="">선택</option>
				        <option value="축구" ${board.type == "축구" ? 'selected' : ''}>축구</option>
				        <option value="농구" ${board.type == "농구" ? 'selected' : ''}>농구</option>
				        <option value="풋살" ${board.type == "풋살" ? 'selected' : ''}>풋살</option>
				        <option value="야구" ${board.type == "야구" ? 'selected' : ''}>야구</option>
				        <option value="후기" ${board.type == "후기" ? 'selected' : ''}>후기</option>
				        <option value="기타" ${board.type == "기타" ? 'selected' : ''}>기타</option>
				    </select>
					
					<div class="bcm-upload-file">
						<label class="bcm-custom-upload-btn" for="fileUpload">파일 선택</label>
						<input type="file" id="fileUpload" name="fileUpload">
					</div>
				</div>
				
				<!-- 내용 -->
				<div class="bcm-content-container">
					<hr>
					<div class="bcm-content-textarea">
						<textarea id="summernote" name="content">${board.content }</textarea>
					</div>
				</div>
				
				<!-- 버튼 -->
				<div class="bcm-button-content">
					<div class="bcm-back-btn" onclick="history.back()">게시글로 돌아가기</div>
					<div class="bcm-delete-btn"  onclick="location.href = 'delete.bd?bno=${board.boardNo}'">게시글 삭제</div>
					<button class="bcm-complete-btn" type="submit">게시글 수정</button>
				</div>
			</form>
		</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-bs5.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/board/boardCreate.js"></script>
</body>
</html>