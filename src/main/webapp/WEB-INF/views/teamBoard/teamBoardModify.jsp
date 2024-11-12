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
			<form method="post" action="modify.tm?bno=${teamBoard.boardNo }&tno=${teamBoard.teamNo }" enctype="multipart/form-data">
				<div class="bcm-title-container">
					<h3>제목</h3>
					<input placeholder="  제목을 입력하시오." value="${teamBoard.title }" name="title">
				</div>
				
				<!-- 파일 업로드 / 종류 -->
				<div class="bcm-select-container">
					 <select class="bcm-select-select" name="type">
				        <option value="">선택</option>
				        <option value="축구" ${teamBoard.type == "자유" ? 'selected' : ''}>자유</option>
				        <option value="농구" ${teamBoard.type == "응원" ? 'selected' : ''}>응원</option>
				        <option value="풋살" ${teamBoard.type == "질문" ? 'selected' : ''}>질문</option>
				        <option value="야구" ${teamBoard.type == "공지" ? 'selected' : ''}>공지</option>
				        <option value="후기" ${teamBoard.type == "후기" ? 'selected' : ''}>후기</option>
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
						<textarea placeholder="내용을 입력하세요" name="content">${teamBoard.content }</textarea>
					</div>
				</div>
				
				<!-- 버튼 -->
				<div class="bcm-button-content">
					<div class="bcm-back-btn">게시글로 돌아가기</div>
					<div class="bcm-delete-btn"  onclick="location.href = 'delete.tm?bno=${teamBoard.boardNo}&tno=${teamBoard.teamNo }'">게시글 삭제</div>
					<button class="bcm-complete-btn" type="submit">게시글 수정</button>
				</div>
			</form>
		</div>
	<jsp:include page="/WEB-INF/views/footer.jsp" />
	</div>
</body>
</html>