<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="${pageContext.request.contextPath}/resources/css/board/boardCM.css?after" rel="stylesheet" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/header.jsp" />
		<br>
		<jsp:include page="/WEB-INF/views/nav.jsp" />
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
				        <option value="1" ${board.type == "축구" ? 'selected' : ''}>축구</option>
				        <option value="2" ${board.type == "농구" ? 'selected' : ''}>농구</option>
				        <option value="3" ${board.type == "풋살" ? 'selected' : ''}>풋살</option>
				        <option value="4" ${board.type == "야구" ? 'selected' : ''}>야구</option>
				        <option value="5" ${board.type == "후기" ? 'selected' : ''}>후기</option>
				        <option value="6" ${board.type == "기타" ? 'selected' : ''}>기타</option>
				    </select>
					
					<div class="bcm-upload-file">
						<label class="bcm-custom-upload-btn" for="fileUpload">파일 선택</label>
						<input type="file" id="fileUpload">
					</div>
				</div>
				
				<!-- 내용 -->
				<div class="bcm-content-container">
					<hr>
					<div class="bcm-content-textarea" name="content">
						<textarea placeholder="내용을 입력하세요">${board.content }</textarea>
					</div>
				</div>
				
				<!-- 버튼 -->
				<div class="bcm-button-content">
					<button class="bcm-back-btn">게시글로 돌아가기</button>
					<button class="bcm-delete-btn">게시글 삭제</button>
					<button class="bcm-complete-btn" type="submit">게시글 수정</button>
				</div>
			</form>
		</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	</div>
</body>
</html>