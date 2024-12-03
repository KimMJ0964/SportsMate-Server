<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
<link href="resources/css/board/board.css" rel="stylesheet" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<style>
</style>
</head>
<body>
	<div class="wrap">
		 <jsp:include page="/WEB-INF/views/common/header.jsp" />
		<br>
		<jsp:include page="/WEB-INF/views/common/nav.jsp" />
		<div class="board-desktop-container"> <!-- 전체적인 게시글 목록 페이지 -->
			<div class="desktop-board"> <!-- 데스크탑일 때 출력 -->
				<div class="board-banner">
					<img src="${pageContext.request.contextPath}/resources/images/board-banner.png" />
					<div class="banner-text">커뮤니티</div>
				</div>
				
				<div class="board-app-banner"><h4>커뮤니티</h4></div>
				
				<!-- 게시글 검색 -->
				<form method="get" action="search.bd">
					<div class="board-search-container">
						<select class="board-search-option" name="category" id="category">
						    <option value="" selected>선택</option>
						    <option value="축구">축구</option>
						    <option value="농구">농구</option>
						    <option value="풋살">풋살</option>
						    <option value="야구">야구</option>
						    <option value="후기">후기</option>
						</select>
						
						<input type="text" class="board-search-input" placeholder="검색어 입력" name="keyword" id="keyword" />
						
						<button type="submit" class="board-search-btn">검색</button>
					</div>
				</form>
				
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
			               <c:forEach var="b" items="${list}">
			               		<tr onclick="location.href = 'detailMove.bd?bno=${b.boardNo}'" style="cursor: pointer;">
			               			<td>${b.boardNo}</td>
			               			<td>${b.title}</td>
			               			<td>${b.memName}</td>
			               			<td>${b.createDate}</td>
			               			<td>${b.view}</td>
			               		</tr>
			               </c:forEach>
			            </tbody>
			        </table>
			        
			        <!-- 페이지네이션 -->
				    <div id="pagenation">
                        <nav>
                            <ul class="pagination">
                                <c:choose>
                                    <c:when test="${pi.currentPage != 1 || (pi.startPage / pi.boardLimit)  > 1}">
                                        <li class="page-item">
                                            <c:choose>
											    <c:when test="${not empty category || not empty keyword}">
											        <a href="search.bd?cpage=1&category=${category}&keyword=${keyword}" class="page-link">
											        	<span aria-hidden="true">&laquo;</span>
											        </a>
											    </c:when>
											    <c:otherwise>
											        <a href="boardList.bd?cpage=1" class="page-link">
		                                                <span aria-hidden="true">&laquo;</span>
		                                            </a>
											    </c:otherwise>
											</c:choose>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item disabled">
                                            <a href="#" class="page-link">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${pi.currentPage > 1}">
                                        <li class="page-item">
                                            <c:choose>
											    <c:when test="${not empty category || not empty keyword}">
											        <a href="search.bd?cpage=${pi.currentPage - 1}&category=${category}&keyword=${keyword}" class="page-link">
											        	<span aria-hidden="true">&lt;</span>
											        </a>
											    </c:when>
											    <c:otherwise>
											        <a href="boardList.bd?cpage=${pi.currentPage - 1}" class="page-link"> 
		                                                <span aria-hidden="true">&lt;</span>
		                                            </a>
											    </c:otherwise>
											</c:choose>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item disabled">
                                            <a href="#" class="page-link">
                                                <span aria-hidden="true">&lt;</span>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}" step="1">
                                    <c:choose>
                                        <c:when test="${page == pi.currentPage}">
                                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item">
	                                            <c:choose>
												    <c:when test="${not empty category || not empty keyword}">
												        <a href="search.bd?cpage=${page}&category=${category}&keyword=${keyword}" class="page-link">
												        	<span aria-hidden="true">${page}</span>
												        </a>
												    </c:when>
												    <c:otherwise>
												        <a href="boardList.bd?cpage=${page}" class="page-link">
			                                                <span aria-hidden="true">${page}</span>
			                                            </a>
												    </c:otherwise>
												</c:choose>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                                <c:choose>
                                    <c:when test="${pi.currentPage < pi.maxPage}">
                                        <li class="page-item">
                                            <c:choose>
												   <c:when test="${not empty category || not empty keyword}">
												       <a href="search.bd?cpage=${pi.currentPage + 1}&category=${category}&keyword=${keyword}" class="page-link">
												       	<span aria-hidden="true">&gt;</span>
												       </a>
												   </c:when>
												   <c:otherwise>
												       <a href="boardList.bd?cpage=${pi.currentPage + 1}" class="page-link">
			                                               <span aria-hidden="true">&gt;</span>
			                                           </a>
												   </c:otherwise>
											</c:choose>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item disabled">
                                            <a href="#" class="page-link">
                                                <span aria-hidden="true">&gt;</span>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${pi.currentPage eq pi.maxPage}">
                                        <li class="page-item disabled">
                                            <a href="#" class="page-link">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:when>
                                    <c:when test="${pi.currentPage  < pi.maxPage and pi.maxPage > 1}">
                                        <li class="page-item">
                                             <c:choose>
												   <c:when test="${not empty category || not empty keyword}">
												       <a href="search.bd?cpage=${pi.maxPage}&category=${category}&keyword=${keyword}" class="page-link">
												       	<span aria-hidden="true">&raquo;</span>
												       </a>
												   </c:when>
												   <c:otherwise>
												       <a href="boardList.bd?cpage=${pi.maxPage}" class="page-link">
			                                               <span aria-hidden="true">&raquo;</span>
			                                           </a>
												   </c:otherwise>
											</c:choose>
                                        </li>
                                    </c:when>
                                    <c:when test="${(pi.endPage / boardLimit)  < pi.maxPage}">
                                        <li class="page-item">
                                            <c:choose>
												   <c:when test="${not empty category || not empty keyword}">
												       <a href="search.bd?cpage=${pi.currentPage + 1}&category=${category}&keyword=${keyword}" class="page-link">
												       	<span aria-hidden="true">&raquo;</span>
												       </a>
												   </c:when>
												   <c:otherwise>
												       <a href="boardList.bd?cpage=${pi.currentPage + 1}" class="page-link">
			                                               <span aria-hidden="true">&raquo;</span>
			                                           </a>
												   </c:otherwise>
											</c:choose>
                                        </li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item disabled">
                                            <a href="#" class="page-link">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </nav>
                    </div>
				</div>
				
				<div class="board-app-table-container"> <!-- 앱일 때 출력 -->
					<table>
					<c:forEach var="b" items="${list}">
				        <tr onclick="location.href = 'detailMove.bd?bno=${b.boardNo}'">
				            <td rowspan="3" class="board-app-table-num" >${b.boardNo}</td>
				            <td class="board-app-table-title" colspan="2">${b.title}</td>
				        </tr>
				        <tr onclick="location.href = 'detailMove.bd?bno=${b.boardNo}'">
				            <td class="board-app-table-view" colspan="2"><img src="${pageContext.request.contextPath}/resources/images/board_view.png" /> ${b.view }</td>
				        </tr>
				        <tr onclick="location.href = 'detailMove.bd?bno=${b.boardNo}'">
				            <td class="board-app-table-type">${b.type }</td>
				            <td class="board-app-table-date">${b.createDate}</td>
				        </tr>
				    
			               </c:forEach>
				    </table>
				    
				    <div class="board-pagination">
				             <div id="pagenation">
	                        <nav>
	                            <ul class="pagination">
	                                <c:choose>
	                                    <c:when test="${pi.currentPage != 1 || (pi.startPage / pi.boardLimit)  > 1}">
	                                        <li class="page-item">
	                                            <c:choose>
												    <c:when test="${not empty category || not empty keyword}">
												        <a href="search.bd?cpage=1&category=${category}&keyword=${keyword}" class="page-link">
												        	<span aria-hidden="true">&laquo;</span>
												        </a>
												    </c:when>
												    <c:otherwise>
												        <a href="boardList.bd?cpage=1" class="page-link">
			                                                <span aria-hidden="true">&laquo;</span>
			                                            </a>
												    </c:otherwise>
												</c:choose>
	                                        </li>
	                                    </c:when>
	                                    <c:otherwise>
	                                        <li class="page-item disabled">
	                                            <a href="#" class="page-link">
	                                                <span aria-hidden="true">&laquo;</span>
	                                            </a>
	                                        </li>
	                                    </c:otherwise>
	                                </c:choose>
	                                <c:choose>
	                                    <c:when test="${pi.currentPage > 1}">
	                                        <li class="page-item">
	                                            <c:choose>
												    <c:when test="${not empty category || not empty keyword}">
												        <a href="search.bd?cpage=${pi.currentPage - 1}&category=${category}&keyword=${keyword}" class="page-link">
												        	<span aria-hidden="true">&lt;</span>
												        </a>
												    </c:when>
												    <c:otherwise>
												        <a href="boardList.bd?cpage=${pi.currentPage - 1}" class="page-link"> 
			                                                <span aria-hidden="true">&lt;</span>
			                                            </a>
												    </c:otherwise>
												</c:choose>
	                                        </li>
	                                    </c:when>
	                                    <c:otherwise>
	                                        <li class="page-item disabled">
	                                            <a href="#" class="page-link">
	                                                <span aria-hidden="true">&lt;</span>
	                                            </a>
	                                        </li>
	                                    </c:otherwise>
	                                </c:choose>
	
	                                <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}" step="1">
	                                    <c:choose>
	                                        <c:when test="${page == pi.currentPage}">
	                                            <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
	                                        </c:when>
	                                        <c:otherwise>
	                                            <li class="page-item">
		                                            <c:choose>
													    <c:when test="${not empty category || not empty keyword}">
													        <a href="search.bd?cpage=${page}&category=${category}&keyword=${keyword}" class="page-link">
													        	<span aria-hidden="true">${page}</span>
													        </a>
													    </c:when>
													    <c:otherwise>
													        <a href="boardList.bd?cpage=${page}" class="page-link">
				                                                <span aria-hidden="true">${page}</span>
				                                            </a>
													    </c:otherwise>
													</c:choose>
	                                            </li>
	                                        </c:otherwise>
	                                    </c:choose>
	                                </c:forEach>
	                                <c:choose>
	                                    <c:when test="${pi.currentPage < pi.maxPage}">
	                                        <li class="page-item">
	                                            <c:choose>
													   <c:when test="${not empty category || not empty keyword}">
													       <a href="search.bd?cpage=${pi.currentPage + 1}&category=${category}&keyword=${keyword}" class="page-link">
													       	<span aria-hidden="true">&gt;</span>
													       </a>
													   </c:when>
													   <c:otherwise>
													       <a href="boardList.bd?cpage=${pi.currentPage + 1}" class="page-link">
				                                               <span aria-hidden="true">&gt;</span>
				                                           </a>
													   </c:otherwise>
												</c:choose>
	                                        </li>
	                                    </c:when>
	                                    <c:otherwise>
	                                        <li class="page-item disabled">
	                                            <a href="#" class="page-link">
	                                                <span aria-hidden="true">&gt;</span>
	                                            </a>
	                                        </li>
	                                    </c:otherwise>
	                                </c:choose>
	                                <c:choose>
	                                    <c:when test="${pi.currentPage eq pi.maxPage}">
	                                        <li class="page-item disabled">
	                                            <a href="#" class="page-link">
	                                                <span aria-hidden="true">&raquo;</span>
	                                            </a>
	                                        </li>
	                                    </c:when>
	                                    <c:when test="${pi.currentPage  < pi.maxPage and pi.maxPage > 1}">
	                                        <li class="page-item">
	                                             <c:choose>
													   <c:when test="${not empty category || not empty keyword}">
													       <a href="search.bd?cpage=${pi.maxPage}&category=${category}&keyword=${keyword}" class="page-link">
													       	<span aria-hidden="true">&raquo;</span>
													       </a>
													   </c:when>
													   <c:otherwise>
													       <a href="boardList.bd?cpage=${pi.maxPage}" class="page-link">
				                                               <span aria-hidden="true">&raquo;</span>
				                                           </a>
													   </c:otherwise>
												</c:choose>
	                                        </li>
	                                    </c:when>
	                                    <c:when test="${(pi.endPage / boardLimit)  < pi.maxPage}">
	                                        <li class="page-item">
	                                            <c:choose>
													   <c:when test="${not empty category || not empty keyword}">
													       <a href="search.bd?cpage=${pi.currentPage + 1}&category=${category}&keyword=${keyword}" class="page-link">
													       	<span aria-hidden="true">&raquo;</span>
													       </a>
													   </c:when>
													   <c:otherwise>
													       <a href="boardList.bd?cpage=${pi.currentPage + 1}" class="page-link">
				                                               <span aria-hidden="true">&raquo;</span>
				                                           </a>
													   </c:otherwise>
												</c:choose>
	                                        </li>
	                                    </c:when>
	                                    <c:otherwise>
	                                        <li class="page-item disabled">
	                                            <a href="#" class="page-link">
	                                                <span aria-hidden="true">&raquo;</span>
	                                            </a>
	                                        </li>
	                                    </c:otherwise>
	                                </c:choose>
	                            </ul>
	                        </nav>
	                    </div>
        			</div>
				</div>
				
				<!-- 글쓰기 버튼 -->
				<div class="board-createMove-btn-container" >
					<Button class="board-plus-btn">➖</Button>
            		<Button class="board-minus-btn">➕</Button>
					<Button class="board-createMove-btn"  onclick="location.href = 'createMove.bd'">글쓰기</Button>
				</div>
			</div>


		</div>
		<!-- board-container 끝 -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
	</div>
	<!-- wrap 끝 -->
</body>
</html>