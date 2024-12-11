<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구장 디테일 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/stadium/detail.css">
</head>
<body>
<div class="wrap">
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <br>
    <jsp:include page="/WEB-INF/views/common/nav.jsp" />
    <br>

    <!-- 이미지와 지도 컨테이너 -->
    <div class="image-container">
		<a href="detail.st?stadiumNo=${stadiumDetail.stadiumNo}">
		   <img id="stadiumImage" 
		        src="${pageContext.request.contextPath}/resources/images/stadiumFile/${stadiumDetail.changeName}" 
		        alt="${stadiumDetail.stadiumName}" />
		</a>
        <div id="map"></div> <!-- 지도 div 추가 -->
    </div>

    <div class="info-section">
        <div class="main-content">
        	<!-- 미디어쿼리 적용 후 모바일 페이지 -->
        	<div class="info-box mobile-only">
				<div class="section-mobile">
					<div class="matchTime">${selectedDate} ${stadiumDetail.stadiumCategory}</div>
					<div class="matchPlace">
						<h1 class="txtH w700h">
							<p>${stadiumDetail.stadiumName}</p>
						</h1>
						<div class="wtgTool">
							<span class="stadium-info_address">${stadiumDetail.stadiumAddress}</span>
							<button onclick="showMap('${stadiumDetail.stadiumAddress}')" class="sm1">지도 보기</button>
						</div>
						<div style="margin-top: 10px; display: flex;">
							<div class="scope"><img src="resources/images/star.png" class="star"><span>${stadiumDetail.stadiumScore}/5</span></div>
						</div>
					</div>
					<div class="match-info_fee">
						<div class="matchFee">
							<div>
								<fmt:formatNumber value="${stadiumDetail.stadiumPrice}" type="number" groupingUsed="true"/>원
								<span> / 2시간</span>
							</div>
							<div>
								<p style="color: black; font-size: 12px;">구장 운영 시간 : ${stadiumDetail.stadiumStartTime} ~ ${stadiumDetail.stadiumEndTime}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 여기서 부터 PC버전 -->
            <div class="info-box">
            	<div class="section_header">
	               <div class="section_title">
						<h3>지역 날씨</h3>
	               </div>
	            </div>
	            <div class="scope"><img src="${pageContext.request.contextPath}/resources/images/weather.png" class="weather"></div>
            </div>
            
            <div class="info-box pc-only">
            	<div class="section_header">
            		<div class="section_title">
            			<h3>구장 정보</h3>
            		</div>
            	</div>
				<div class="section_body">
					<div class="stadInner" style="border: none;">
						<div class="matchRule">
							<pre class="tet2">
								■ 주소 : ${stadiumDetail.stadiumAddress}
								■ 가격 : ${stadiumDetail.stadiumPrice}원
								■ 구장 운영 시간 : ${stadiumDetail.stadiumStartTime} ~ ${stadiumDetail.stadiumEndTime}
							</pre>
						</div>
					</div>
				</div>
            </div>

            <div class="info-box">
				<div class="section_header">
					<div class="section_title">
						<h3>편의 시설</h3>
					</div>
				</div>
				<div class="section_body">
					<div class="info_list_wrapper double">
						<ul>
							<li class="info_list">
								<img src="${pageContext.request.contextPath}/resources/images/toile.png" class="icon">
								<div>
									<!-- IF 조건 -->
									<c:if test="${stadiumDetail.toilet == 'Y'}">
										<p>화장실</p>
									</c:if>
									
									<!-- Else 조건 -->
									<c:if test="${stadiumDetail.toilet != 'N'}">
										<p class="title_line">화장실</p>
									</c:if>
								</div>
							</li>
							<li class="info_list">
								<img src="${pageContext.request.contextPath}/resources/images/shower.png" class="icon">
								<div>
									<!-- IF 조건 -->
									<c:if test="${stadiumDetail.shower == 'Y'}">
										<p>샤워실</p>
									</c:if>
									
									<!-- Else 조건 -->
									<c:if test="${stadiumDetail.shower != 'N'}">
										<p class="title_line">샤워실</p>
									</c:if>
								</div>
							</li>
							<li class="info_list">
								<img src="${pageContext.request.contextPath}/resources/images/smoking.png" class="icon">
								<div>
									<c:if test="${stadiumDetail.smoke == 'Y'}">
						                <p>흡연 구역</p>
						            </c:if>
						            <c:if test="${stadiumDetail.smoke != 'N'}">
						                <p class="title_line">흡연 구역</p>
						            </c:if>
								</div>
							</li>
							<li class="info_list">
								<img src="${pageContext.request.contextPath}/resources/images/parked.png" class="icon">
								<div>
									<c:if test="${stadiumDetail.park == 'Y'}">
						                <p>주차장</p>
						            </c:if>
						            <c:if test="${stadiumDetail.park != 'N'}">
						                <p class="title_line">주차장</p>
						            </c:if>
								</div>
							</li>
							<li class="info_list">
								<img src="${pageContext.request.contextPath}/resources/images/drink.png" class="icon">
								<div>
									<c:if test="${stadiumDetail.drink == 'Y'}">
						                <p>음료 판매</p>
						            </c:if>
						            <c:if test="${stadiumDetail.drink != 'N'}">
						                <p class="title_line">음료 판매</p>
						            </c:if>
								</div>
							</li>
						</ul>
						<div class="stadInner section_body"></div>
					</div>
				</div>
				<div class="section_header">
					<div class="section_title">
						<h3>물품 지원</h3>
					</div>
				</div>
				<div class="section_body">
					<div class="info_list_wrapper double">
						<ul>
							<li class="info_list">
								<img src="${pageContext.request.contextPath}/resources/images/ball.png" class="icon">
								<div>
									<c:if test="${stadiumDetail.ball == 'Y'}">
						                <p>공 대여</p>
						            </c:if>
						            <c:if test="${stadiumDetail.ball != 'N'}">
						                <p class="title_line">공 대여</p>
						            </c:if>
								</div>
							</li>
							<li class="info_list">
								<img src="${pageContext.request.contextPath}/resources/images/vest.png" class="icon">
								<div>
									<c:if test="${stadiumDetail.vest == 'Y'}">
						                <p>조끼</p>
						            </c:if>
						            <c:if test="${stadiumDetail.vest != 'N'}">
						                <p class="title_line">조끼</p>
						            </c:if>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			
			<div class="info-box">
				<div class="section_header">
					<div class="section_title">
						<h3>구장 특이사항</h3>
					</div>
				</div>
				<div class="section_body">
					<div class="stadInner" style="border: none;">
						<div class="matchRule">
							<pre class="tet2">
								■ 흡연: 보조 구장 옆 흰색 천막 아래 흡연석에서만 흡연 가능
								*흡연구역 외 절대 금연
								*민원 다발 구역, 금연구역에서 흡연이 적발되어 벌금형의 사례가 있습니다.
								■ 대여/판매
								- 풋살화 : 245~290mm, 3천원(매치 담당 매니저님를 통해 결제 후 대여 가능)
								- 음료 : 파워에이드, 게토레이 240ml, 천원
								■ 기타
								- ※소음 주의※ 인근에 거주 지역이 가까우니 저녁 시간에는 꼭 소음에 주의하여 참여해주세요.
								- 24시에는 상가 모든 문이 잠기므로 빠르게 퇴실바랍니다.
								- 구장 입장은 전 타임 조가 끝나면 바로 입장 가능합니다.
							</pre>
						</div>
					</div>
				</div>
			</div>
            	
            <div class="info-box">
               <div class="section_header">
					<div class="section_title section_title--arrow arrow-down">
						<h3>매치 진행 방식</h3>
					</div>
               </div>
               <div class="stadInner section_body" style="border: none;">
					<ul class="matchRule">
						<h4>매치 규칙</h4>
						<li>종목에 대한 규칙 준수</li>
						<li>사람을 향한 불필요한 행동 금지</li>
					</ul>
					<ul class="matchRule">
						<h4>진행 방식</h4>
						<li>필요한 개인장비를 준비하세요.</li>
						<li>구장관리자가 경기 진행을 도와드려요.</li>
					</ul>
					<ul class="matchRule">
						<h4>알아두면 좋아요</h4>
						<li>서로 존중하고 격려하며 함께 즐겨요.</li>
						<li>사고는 본인책임입니다.</li>
					</ul>					
               </div>
            </div>
            
			<div class="info-box">
                <div class="section_header">
                	<div class="section_title section_title--arrow arrow-down">
                		<h3>환불 정책</h3>
                	</div>
                </div>
                <div class="stadInner section_body" style="border: none;">
					<ul class="matchRule">
						<h4>취소 환불 규정</h4>
						<table>
							<colgroup>
								<col width="50%">
								<col width="50%">
							</colgroup>
							<tbody>
								<tr>
									<td>매치 2일 전</td>
									<td>무료 취소</td>
								</tr>
								<tr>
									<td>매치 1일 전</td>
									<td>80% 환급</td>
								</tr>
								<tr>
									<td>당일 ~ 매치 시작 90분 전까지</td>
									<td>20% 환급</td>
								</tr>
								<tr>
									<td>매치 시작 90분 이내</td>
									<td>환불 불가</td>
								</tr>
							</tbody>
						</table>
					</ul>
					<ul class="matchRule"><h4>그 외 취소 규정</h4>
						<li>실 결제금액을 기준으로 위 규정에 따라 환급됩니다.</li>
						<li>매치 시작 90분 전까지 상대팀이 없을 경우 카카오톡 혹은 LMS으로 안내되며, 자동 전액 환불처리됩니다. (단, 공지 전 직접 취소하시는 경우 상단 일반 환불 규정되로 처리됩니다.)</li>
					</ul>
					<ul class="matchRule"><h4>유의 상항</h4>
						<li>단순 변심으로 취소을 요청하는 경우 환불이 불가합니다.</li>
						<li>참여가 어려울 경우 , 원활한 매치 진행을 위해 팀 구단 미니홈피에서 미리 취소해주세요.</li>
					</ul>
					<ul class="matchRule"><h4>강수 환불 규정</h4>
						<li>기상청 날씨 예보에 따라 환불 가능시 공지해드립니다.<br>[공지시점]<br>
							<ul>
								<li>
									오전(12시 이전) 매치 : 하루 전 22시 기준, 매치 진행 시간의 강수량 예보가 1mm 이상 시
								</li>
								<li>
									오후(12시 이후) 매치 : 매치 시작 4기간 전 기준, 매치 진행 시간의 강수량 예보가 1mm이상 시
								</li>
							</ul>
							[공지 방법] : 문자(본인 인증된 연락처)
						</li>
						<li>문자를 받으시고, 매치 시작 90분 전까지 취소하면 전액 환불됩니다.</li>
						<li>알림톡 발송 없이 직접 취소하시는 경우 상단 일반 환불 규정대로 처리됩니다.</li>
						<li>별도 공지가 없을 시 매치는 정상 진행됩니다.</li>
						<li>다수의 인원이 취소하거나, 구장 상태가 좋지 않아 진행이 어렵다면 매치 시작 90분 이내라도 매치를 취소합니다.</li>
						<li>현장에서 구장관리자님께서 직접 귀가 의사를 전달해야만 환불 처리가 됩니다.</li>
					</ul>
					<ul class="matchRule"><h4>환불 방법</h4>
						<li>[팀 구단 미니홈피] -> [매치] -> 환불을 원하는 매치 사유 작성 후 환불요청</li>
					</ul>
                </div>
            </div>            
                   
			<div class="info-box">
				<h3>리뷰</h3>
				<div class="review">
					<c:choose>
						<c:when test="${not empty stadiumDetail.reviews}">
							<c:forEach var="review" items="${stadiumDetail.reviews}" varStatus="status">
	                    	<div class="review-item">
		                        <div class="number">${status.index + 1}.</div>
		                        <div class="content">${review.reviewContent}</div>
		                        <div class="author">작성자: ${review.memName}</div>
		                        <div class="date-rating">
					                <span class="date">${review.reviewDate}</span>
					                <img src="${pageContext.request.contextPath}/resources/images/star.png" alt="평점" class="star" />
					                <span>${review.reviewStar}</span>
			                    </div>
			                    </div>
			                </c:forEach>
						</c:when>
						<c:otherwise>
							<div class="no-review">등록된 리뷰가 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
				<!-- 페이지 네이션 -->
	            <div id="pagenation">
				    <nav>
				        <ul class="pagination">
				            <!-- 처음 페이지 -->
				            <c:choose>
				                <c:when test="${pi.currentPage > 1}">
				                    <li class="page-item">
				                        <a href="detail.st?stadiumNo=${stadiumDetail.stadiumNo}&currentPage=1" class="page-link">&laquo;</a>
				                    </li>
				                </c:when>
				                <c:otherwise>
				                    <li class="page-item disabled">
				                        <a href="#" class="page-link">&laquo;</a>
				                    </li>
				                </c:otherwise>
				            </c:choose>
				
				            <!-- 이전 페이지 -->
				            <c:choose>
				                <c:when test="${pi.currentPage > 1}">
				                    <li class="page-item">
				                        <a href="detail.st?stadiumNo=${stadiumDetail.stadiumNo}&currentPage=${pi.currentPage - 1}" class="page-link">&lt;</a>
				                    </li>
				                </c:when>
				                <c:otherwise>
				                    <li class="page-item disabled">
				                        <a href="#" class="page-link">&lt;</a>
				                    </li>
				                </c:otherwise>
				            </c:choose>
				
				            <!-- 페이지 번호 -->
				            <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
				                <c:choose>
				                    <c:when test="${page == pi.currentPage}">
				                        <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
				                    </c:when>
				                    <c:otherwise>
				                        <li class="page-item">
				                            <a href="detail.st?stadiumNo=${stadiumDetail.stadiumNo}&currentPage=${page}" class="page-link">${page}</a>
				                        </li>
				                    </c:otherwise>
				                </c:choose>
				            </c:forEach>
				
				            <!-- 다음 페이지 -->
				            <c:choose>
				                <c:when test="${pi.currentPage < pi.maxPage}">
				                    <li class="page-item">
				                        <a href="detail.st?stadiumNo=${stadiumDetail.stadiumNo}&currentPage=${pi.currentPage + 1}" class="page-link">&gt;</a>
				                    </li>
				                </c:when>
				                <c:otherwise>
				                    <li class="page-item disabled">
				                        <a href="#" class="page-link">&gt;</a>
				                    </li>
				                </c:otherwise>
				            </c:choose>
				
				            <!-- 마지막 페이지 -->
				            <c:choose>
				                <c:when test="${pi.currentPage < pi.maxPage}">
				                    <li class="page-item">
				                        <a href="detail.st?stadiumNo=${stadiumDetail.stadiumNo}&currentPage=${pi.maxPage}" class="page-link">&raquo;</a>
				                    </li>
				                </c:when>
				                <c:otherwise>
				                    <li class="page-item disabled">
				                        <a href="#" class="page-link">&raquo;</a>
				                    </li>
				                </c:otherwise>
				            </c:choose>
				        </ul>
				    </nav>
				</div>    
            </div>
            
			<!-- 미디어쿼리 적용 후 모바일 페이지  -->
        	<div class="info-box mobile-only">
				<div class="match-apply_Wrap">
					<div class="match-apply_button">
						<div>
							<p class="match-apply_button-text">지금 신청하면<br>진행 확정이 빨라져요!</p>
						</div>
						<div class="btnWrap" style="width: 144px;">
							<button type="button" class="btn letsplab">
								<p>신청하기</p>
							</button>
						</div>
					</div>
				</div>
        	</div>
        </div> 
           
        <aside class="sidebar">
        	<div class="info-box">
				<div class="section-pc">
					<div class="matchTime">${selectedDate} ${stadiumDetail.stadiumCategory}</div>
					<div class="matchPlace">
						<h1 class="txtH w700h">
							<p>${stadiumDetail.stadiumName}</p>
						</h1>
						<div class="wtgTool">
							<span class="stadium-info_address">${stadiumDetail.stadiumAddress}</span>
							<button onclick="showMap('${stadiumDetail.stadiumAddress}')" class="sm1">지도 보기</button>
						</div>
						<div style="margin-top: 10px; display: flex;">
							<div class="scope"><img src="${pageContext.request.contextPath}/resources/images/star.png" class="star"><span>${stadiumDetail.stadiumScore}/5</span></div>
						</div>
					</div>
					<div class="match-info_fee">
						<div class="matchFee">
							<div>
								<span class="matchFee_money">
									<fmt:formatNumber value="${stadiumDetail.stadiumPrice}" type="number" groupingUsed="true"/>원
								</span>
								<span> / 2시간</span>
							</div>
							<div>
								<p style="color: black; font-size: 12px;">구장 운영 시간 : ${stadiumDetail.stadiumStartTime} ~ ${stadiumDetail.stadiumEndTime}</p>
							</div>
						</div>
					</div>
				</div>
				<div class="match-apply_Wrap">
					<div class="match-apply_button">
						<div>
							<p class="match-apply_button-text">지금 신청하면<br>진행 확정이 빨라져요!</p>
						</div>
						<div class="btnWrap" style="width: 144px;">
							<c:if test="${isTeamLeader}">
							    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#subscription">
							        신청하기
							    </button>
							</c:if>
							<c:if test="${!isTeamLeader}">
							    <button type="button" class="btn btn-secondary" disabled>
							        팀장만 신청 가능합니다
							    </button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
        </aside>
    </div>
	<div class="chat-button" data-bs-toggle="modal" data-bs-target="#inquiryModal">
    	<img src="${pageContext.request.contextPath}/resources/images/chat.png" alt="Chat Icon">
    </div>
    
	<!-- 문의 등록 모달 -->
	<div class="modal fade" id="inquiryModal" tabindex="-1" aria-labelledby="inquiryModalLabel" aria-hidden="true">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h5 class="modal-title" id="inquiryModalLabel">문의 등록</h5>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	            </div>
	            <div class="modal-body">
	                <!-- 문의 등록 폼 -->
	                <form action="inquiryInsert.me" method="post" id="inquiry-form">
				    <!-- 경기장 번호 -->
				    <input type="hidden" name="stadiumNo" value="${stadiumNo}" />
				
				    <!-- 문의 제목 -->
				    <div class="mb-3">
				        <label for="matchQTitle" class="form-label">문의 제목</label>
				        <input type="text" name="matchQTitle" class="form-control" required />
				    </div>
				
				    <!-- 문의 내용 -->
				    <div class="mb-3">
				        <label for="matchQDetail" class="form-label">문의 내용</label>
				        <textarea name="matchQDetail" class="form-control" rows="5" required></textarea>
				    </div>
				
				    <!-- 제출 버튼 -->
				    <button type="submit" class="btn btn-primary">문의 등록</button>
				</form>
	        </div>
	    </div>
	</div>
	</div>
	
	<!-- 신청하기 모달 -->
	<div class="modal fade" id="subscription" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
			
				<!-- Modal Header -->
				<div>
					<!-- stadium-info: 데이터를 전달하는 hidden div -->
	                <div id="stadium-info" 
	                    data-stadium-no="${stadiumDetail.stadiumNo}" 
					    data-stadium-category="${stadiumDetail.stadiumCategory}" 
					    data-reservation='${stadiumReservation}'>
	                </div>
	                
					<div class="modal-header">
						<h4 class="modal-title">신청하기</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<form action="orderInfo.st" method="post" class="modal-form">
							<!-- Hidden Inputs -->
						    <input type="hidden" id="stadium-id" name="stadiumNo" value="${stadiumDetail.stadiumNo}">
						    <input type="hidden" id="price" name="price" value="${stadiumDetail.stadiumPrice}">
						    <input type="hidden" id="category" name="category" value="${stadiumDetail.stadiumCategory}">
						    <input type="hidden" name="teamANo" value="${teamNo}">
						    <input type="hidden" name="teamBNo" value="">
						    <input type="hidden" name="match" value="">
						    
							<!-- 경기장 이름과 가격 -->
			                <div class="row text-center mb-4">
			                    <div class="col-6">
			                        <h5>${stadiumDetail.stadiumName}</h5>
			                    </div>
			                    <div class="col-6">
			                        <h5><fmt:formatNumber value="${stadiumDetail.stadiumPrice}" type="number" groupingUsed="true"/>원</h5>
			                    </div>
			                </div>
			
			                <!-- 달력과 라인업 -->
			                <input type="hidden" id="hidden-selected-date-2" name="accessDate">
			                <div class="row mb-4">
			                    <!-- 달력 -->
			                    <div class="col-md-6">
			                        <div class="calendar-wrapper-2">
			                            <div class="wrapper-2">
			                                <header>
			                                    <div class="nav-2">
			                                        <button id="prev-2" class="material-icons" type="button"> chevron_left </button>
			                                        <p class="current-date-2"></p>
			                                        <button id="next-2" class="material-icons" type="button"> chevron_right </button>
			                                    </div>
			                                </header>
			                                <div class="calendar-2">
			                                    <ul class="weeks-2">
			                                        <li>일</li>
			                                        <li>월</li>
			                                        <li>화</li>
			                                        <li>수</li>
			                                        <li>목</li>
			                                        <li>금</li>
			                                        <li>토</li>
			                                    </ul>
			                                    <ul class="days-2"></ul>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			
								<!-- 라인업 -->
								<div class="col-md-6">
								    <p class="fw-bold">참여할 구단 멤버</p>
									<div class="lineup-wrapper">
									    <c:choose>
									        <c:when test="${empty teamMembers}">
									            <p class="text-muted">참여 가능한 멤버가 없습니다.</p>
									        </c:when>
									        <c:otherwise>
									            <c:forEach var="member" items="${teamMembers}">
									                <div class="form-check">
									                    <input type="checkbox" class="form-check-input" id="member-${member.tmemNo}" name="selectedMambers[]" value="${member.tmemNo}">
									                    <label class="form-check-label" for="member-${member.tmemNo}">
									                        ${member.memName}
									                    </label>
									                </div>
									            </c:forEach>
									        </c:otherwise>
									    </c:choose>
									</div>
								</div>
			                </div>
			
			                <!-- 시간 선택 -->
			                <div class="row mb-4">
			                    <div class="col-12 text-center">
			                        <p class="fw-bold">매치 할 시간을 선택해주세요.</p>
			                        <div class="time-select-wrapper d-flex justify-content-center">
			                            <select id="start-time" name="reservStart" class="form-select w-auto me-2">
			                                <option value="">--시작 시간 선택--</option>
			                            </select>
			                            <select id="end-time" name="reservEnd" class="form-select w-auto ms-2">
			                                <option value="">--끝 시간 선택--</option>
			                            </select>
			                        </div>
			                    </div>
			                </div>
			
			                <!-- 대기중인 매치 -->
			                <div class="row mb-3">
							    <div class="col-12 text-center">
							        <p class="fw-bold">대기중인 매치</p>
							        <div class="pending-matches">
							            <!-- 초기 상태 -->
							            <p class="text-muted" id="no-matches-message">현재 대기중인 매치가 없습니다.</p>
							            <!-- AJAX로 데이터를 채워 넣을 영역 -->
							            <div id="match-results" class="matches-list"></div>
							        </div>
							    </div>
							</div>
			
			                <!-- 신청 버튼 -->
			                <div class="modal-footer">
			                    <button type="submit" class="btn btn-primary w-100">신청하기</button>
			                </div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/stadium/detail.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stadium/time.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/stadium/match.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=043f5595cb50307eae5f33cc8943d0e6&libraries=services"></script>
    <script>
    var map;
    var isMapVisible = false; // 현재 상태를 저장하는 변수

    function showMap(address) {
        if (!kakao || !kakao.maps || !kakao.maps.services) {
            console.error("Kakao 지도 API가 로드되지 않았습니다.");
            return;
        }

        if (!address) {
            console.error("주소가 제공되지 않았습니다.");
            return;
        }

        // 지도와 Geocoder 초기화
        var mapContainer = document.getElementById('map');
        var geocoder = new kakao.maps.services.Geocoder();

        if (isMapVisible) {
            // 지도를 숨기고 이미지를 보이게 함
            document.getElementById('map').style.display = 'none';
            document.getElementById('stadiumImage').style.display = 'block';
        } else {
            // 이미지를 숨기고 지도를 보이게 함
            document.getElementById('stadiumImage').style.display = 'none';
            document.getElementById('map').style.display = 'block';

            // Geocoder로 주소 검색
            geocoder.addressSearch(address, function (result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                    // 지도 생성 또는 갱신
                    if (!map) {
                        map = new kakao.maps.Map(mapContainer, {
                            center: coords,
                            level: 3 // 확대 레벨
                        });
                    } else {
                        map.setCenter(coords);
                    }

                    // 마커 표시
                    var marker = new kakao.maps.Marker({
                        position: coords,
                        map: map
                    });
                } else {
                    console.error("주소 변환 실패:", status);
                }
            });
        }

        // 상태 반전
        isMapVisible = !isMapVisible;
    }    
    </script>
</body>
</html>