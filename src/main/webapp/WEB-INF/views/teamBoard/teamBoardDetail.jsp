<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
<link href="${pageContext.request.contextPath}/resources/css/board/boardDetail.css?after" rel="stylesheet" >
<title>구단 게시글 상세</title>
<style>     
</style>
</head>
<body>
    <div class="wrap">
    	<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<br>
		<jsp:include page="/WEB-INF/views/common/nav.jsp" />
        <!-- 1. 게시글 제목 -->
        <div class="bd-title-container">
            <h1 class="bd-title">${teamBoard.title }</h1>
            <!-- 2. 수평선 -->
            <hr>
            
            <!-- 3. 닉네임 / 게시일 / 조회수 -->
            <div class="bd-meta-info">
                ${teamBoard.memName } / ${teamBoard.createDate } / ${teamBoard.view }
            </div>
        </div>
        
        <!-- 4. 게시글 내용 -->
        <div class="bd-content-container">
            <div class="bd-content">
                ${teamBoard.content }
            </div>
            <!-- 5. 버튼들 -->
            <div class="bd-button-container">
                <div class="bd-button"><a href="${downloadLink}" style="color:white;" download>파일 다운로드</a></div>
                <c:if test="${loginMember != null && loginMember.memNo == teamBoard.memNo}">
                 	<button class="bd-button"  onclick="location.href = 'modifyMoveBd.tm?mpage=${teamBoard.boardNo}'">수정하기</button>
                 </c:if>
                 <button class="bd-red-button" data-bs-toggle="modal" data-bs-target="#reportModal">신고하기</button>
                 <div>
				 	<img class="bd-like" src="${pageContext.request.contextPath}/resources/images/board_like.png" onclick="location.href = 'boardLike.tm?bno=${teamBoard.boardNo }'"/>
            		<div class="bd-like-count" style="text-align: center;">${likeCount }</div>
            	</div>
            </div>
            <hr>
        </div>
        <!-- 8. 댓글 작성 폼 -->
        <div class="bd-comment-container">
	        <form method="post" action="writeReply.tm?bno=${teamBoard.boardNo}">
	            <div class="bd-comment-section">
	                <textarea class="bd-comment-textarea" rows="3" style="resize: none; width: 100%;" name="comContent" id="comContent"></textarea>
	                <button class="bd-button" style="float: right;">댓글 작성 완료</button>
	            </div>
	        </form>
        </div>
        <!-- 댓글 -->
        <div class="bd-comment">
            <h4>댓글 ${commentCount}</h4><hr>
        	<!-- 부모 댓글 -->
        	
        	<c:forEach var="comments" items="${comment}">
				 <c:if test="${comments.comParentNo == 0}">    
		        <div class="bd-one-comment-container">
		            <div class="bd-comment-info">
		                <c:choose>
									    <c:when test="${not empty comments.changeName}">
									        <img class="bd-comment-profile-img" src="${pageContext.request.contextPath}/resources/images/userProFile/${comments.changeName}" />
									     </c:when>
							    <c:otherwise>
									    <img class="bd-comment-profile-img" src="${pageContext.request.contextPath}/resources/images/user_default_profile.png" />
								</c:otherwise>
							</c:choose>
		                <div class="bd-name">${comments.memName}</div>
		            </div>
		            <div class="bd-comment-content">
		            	<c:choose>
					        <c:when test="${comments.status == 'N'}">
					            <span class="deleted-comment">삭제된 댓글입니다.</span>
					        </c:when>
					        <c:when test="${comments.status == 'B'}">
					            <span class="deleted-comment">관리자에 의해 삭제된 댓글입니다.</span>
					        </c:when>
					        <c:otherwise>
					            ${comments.comContent}
					        </c:otherwise>
					    </c:choose>
		            </div>
		            <hr>
		            <div class="bd-button-container">
		                <div class="bd-red-button" onclick="location.href = 'deleteComm.tm?cno=${comments.comNo}&bno=${teamBoard.boardNo }&tno=${teamBoard.teamNo }'">댓글 삭제</div>
		                <div class="bd-red-button" data-bs-toggle="modal" data-bs-target="#reportModal">신고하기</div>
		                <button class="bd-button" data-bs-toggle="modal" data-bs-target="#commentModal" onclick="setCommentData(${comments.comNo}, ${teamBoard.boardNo})">답글 작성</button>
		            </div>
		
		            <!-- 대댓글 (Replies) -->
		            <div class="bd-reply-container">
		             	<c:forEach var="reply" items="${comment}">
                          <!-- Check if this is a reply to the current parent comment -->
                          <c:if test="${reply.comParentNo == comments.comNo}">
                              <div class="bd-reply">
                                  <c:choose>
									    <c:when test="${not empty reply.changeName}">
									        <img class="bd-comment-profile-img" src="${pageContext.request.contextPath}/resources/images/userProFile/${reply.changeName}" />
									     </c:when>
							    <c:otherwise>
									    <img class="bd-comment-profile-img" src="${pageContext.request.contextPath}/resources/images/user_default_profile.png" />
								</c:otherwise>
							</c:choose>
                                  <div class="bd-name">${reply.memName}</div>
                              </div>
                               <div class="bd-comment-content">
							    <c:choose>
							        <c:when test="${reply.status == 'N'}">
							            <span class="deleted-comment">삭제된 댓글입니다.</span>
							        </c:when>
							        <c:when test="${reply.status == 'B'}">
							            <span class="deleted-comment">관리자에 의해 삭제된 댓글입니다.</span>
							        </c:when>
							        <c:otherwise>
							            ${reply.comContent}
							        </c:otherwise>
							    </c:choose>
							</div>
                              <hr>
                              <div class="bd-button-container">
                                  <button class="bd-red-button" onclick="location.href = 'deleteComm.bd?cno=${reply.comNo}&bno=${teamBoard.boardNo }'">답글 삭제</button>
                                  <button class="bd-red-button" data-bs-toggle="modal" data-bs-target="#reportModal" onclick="setReportData(${board.boardNo}, ${reply.comNo}, ${comments.memNo})">신고하기</button>
                                  <button class="bd-button" data-bs-toggle="modal" data-bs-target="#commentModal" onclick="setCommentData(${reply.comParentNo}, ${teamBoard.boardNo})">답글 작성</button>
                              </div>
                          </c:if>
                      </c:forEach>
		            </div>
		        </div>
		        </c:if>
		</c:forEach>
        </div>
        
        <!-- 모달 -->
        <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">신고</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		     <form method="post" action="boardReport.bd">
		      <div class="modal-body">
		        <div class="bd-report-title">
		        	<h5>사유</h5>
		        </div>
		        <br>
		        <div class="bd-report-content">
		        	<textarea class="bd-report-content-textarea" id="report-content" name="pnContent" class="report-content" style="width: 100%; height: 300px;  border: 2px solid #307DFA; resize: none; padding: 10px; font-size: 16px; box-sizing: border-box; border-radius: 8px;"></textarea>
		        </div>
		      </div>
		      <div class="modal-footer">
		      	<!-- 숨겨진 input으로 boardNo와 comNo 값을 전달 -->
                <input type="hidden" id="report-boardNo" name="boardNo">
                <input type="hidden" id="report-comNo" name="comNo">
                <input type="hidden" id="report-reporterNo" name="reporterNo">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="submit" class="btn btn-primary">신고 완료</button>
		      </div>
		       </form>
		    </div>
		  </div>
		</div>
		
		<!-- 대댓글 모달 -->
        <div class="modal fade" id="commentModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h1 class="modal-title fs-5" id="exampleModalLabel">답글</h1>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		     <form method="post" action="replyComment.tm">
		      <div class="modal-body">
		        <div class="bd-report-title">
		        </div>
		        <div class="bd-report-content">
		        	<textarea class="bd-report-content-textarea" id="report-content" name="pnContent" class="report-content" style="width: 100%; height: 300px;  border: 2px solid #307DFA; resize: none; padding: 10px; font-size: 16px; box-sizing: border-box; border-radius: 8px;"></textarea>
		        </div>
		      </div>
		      <div class="modal-footer">
		      	<!-- 숨겨진 input으로 boardNo와 comNo 값을 전달 -->
                <input type="hidden" id="comParentNo" name="comParentNo">
                <input type="hidden" id="comment-boardNo" name="boardNo">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="submit" class="btn btn-primary">답글 완료</button>
		      </div>
		       </form>
		    </div>
		  </div>
		</div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="${pageContext.request.contextPath}/resources/js/board/boardDetail.js"></script>
   

</body>
</html>