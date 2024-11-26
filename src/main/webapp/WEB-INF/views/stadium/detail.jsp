<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <img id="stadiumImage" src="${pageContext.request.contextPath}/resources/images/field.png" alt="Stadium Image" />
        <div id="map"></div> <!-- 지도 div 추가 -->
    </div>

    <div class="info-section">
        <div class="main-content">
        	<!-- 미디어쿼리 적용 후 모바일 페이지 -->
        	<div class="info-box mobile-only">
				<div class="section-mobile">
					<div class="matchTime">11월 12일 화요일 07:00</div>
					<div class="matchPlace">
						<h1 class="txtH w700h">
							<p>서울 강동 송파 풋살장</p>
						</h1>
						<div class="wtgTool">
							<span class="stadium-info_address">서울특별시 송파구 풍납동 403-3</span>
							<button onclick="showMap()" class="bt1">지도 보기</button>
						</div>
						<div style="margin-top: 10px; display: flex;">
							<div class="scope"><img src="resources/images/star.png" class="star"><span>5/5</span></div>
						</div>
					</div>
					<div class="match-info_fee">
						<div class="matchFee">
							<div>
								<span class="matchFee_money">200,000원</span>
								<span> / 2시간</span>
							</div>
							<div>
								<p style="color: black; font-size: 12px;">구장 운영 시간 : </p>
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
								■ 주소 : 서울특별시 송파구 풍납동 403-3
								■ 가격 : 200,000원
								■ 구장 운영 시간 : 09:00 ~ 24:00
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
								<img src="${pageContext.request.contextPath}/resources/images/smoking.png" class="icon">
								<div>
									<p>흡연실</p>
								</div>
							</li>
							<li class="info_list">
								<img src="${pageContext.request.contextPath}/resources/images/shower.png" class="icon">
								<div>
									<p class="title_line">샤워실</p>
								</div>
							</li>
							<li class="info_list">
								<img src="${pageContext.request.contextPath}/resources/images/parked.png" class="icon">
								<div>
									<p class="title_line">주차장</p>
								</div>
							</li>
							<li class="info_list">
								<img src="${pageContext.request.contextPath}/resources/images/drink.png" class="icon">
								<div>
									<p class="title_line">음료 판매</p>
								</div>
							</li>
							<li class="info_list">
								<img src="${pageContext.request.contextPath}/resources/images/toile.png" class="icon">
								<div>
									<p>화장실</p>
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
									<p>공 대여</p>
								</div>
							</li>
							<li class="info_list">
								<img src="${pageContext.request.contextPath}/resources/images/shoe.png" class="icon">
								<div>
									<p class="title_line">풋살화 대여</p>
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
								■ 찾아가는 길: 창동역 1번출구 → 좌측 도봉방면에서 1119번 또는 노원15번 탑승 → 신동아프라자 또는 신동아타워 하차 → 신동아프라자 건물 옥상
								■ 흡연: 보조 구장 옆 흰색 천막 아래 흡연석에서만 흡연 가능
								*흡연구역 외 절대 금연
								*민원 다발 구역, 금연구역에서 흡연이 적발되어 벌금형의 사례가 있습니다.
								■ 대여/판매
								- 풋살화 : 245~290mm, 3천원(매치 담당 매니저님를 통해 결제 후 대여 가능, 무단 대여 금지)
								- 음료 : 파워에이드, 게토레이 240ml, 1천 원
								■ 기타
								- ※소음 주의※ 인근에 거주 지역이 가까우니 저녁 시간에는 꼭 소음에 주의하여 참여해주세요.
								- 23시 15분 상가 모든 문이 잠기므로 빠르게 퇴실바랍니다.
								- 구장 입장은 30분 전 가능합니다. 단일구장이기 때문에 1시간이나 2시간 전 미리 오셔서 입장 또는 구장 휴게 공간 사용을 자제해주세요
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
						<li>모든 파울은 사이드라인에서 킥인</li>
						<li>골키퍼에게 백패스 가능 손으로는 잡으면 안 돼요</li>
						<li>사람을 향한 태클 금지</li>
					</ul>
					<ul class="matchRule">
						<h4>진행 방식</h4>
						<li>풋살화와 개인 음료만 준비하세요.</li>
						<li>매니저가 경기 진행을 도와드려요</li>
						<li>골키퍼와 휴식을 공평하게 돌아가면서 해요.</li>
						<li>레벨 데이터를 기준으로 팀을 나눠요.</li>
						<li>친구끼리 와도 팀 실력이 맞지 않으면 다른 팀이 될 수 있어요.</li>
					</ul>
					<ul class="matchRule">
						<h4>알아두면 좋아요</h4>
						<li>서로 존중하고 격려하며 함께 즐겨요.</li>
						<li>플랩 평균 레벨은 아마추어입니다.</li>
						<li>플랩에서는 하루 평균 250매치가 진행되고 있어요.</li>
						<li>매일 4,500여 명이 팀 없이도 즐기고 있어요.</li>
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
						<li>취소 수수료 발생 시 사용된 포인트를 우선 차감 후 차액을 캐시로 지급합니다.</li>
						<li>변경은 상단 취소 환불 규정과 동일하게 적용됩니다.</li>
					</ul>
					<ul class="matchRule"><h4>그 외 취소 규정</h4>
						<li>신청 후 30분 이내에는 하루 1회에 한해 무료 취소가 가능합니다.
						<br><b>(단, 매치 시작 90분 이내일 경우 불가)</b></li>
						<li>쿠폰 신청자는 매치 시작 90분전까지 취소 시 쿠폰이 반환됩니다.</li>
						<li>실 결제금액(쿠폰 제외)을 기준으로 위 규정에 따라 환급됩니다.</li>
						<li>매치 시작 90분 전까지 최소 인원이 모이지 않을시 카카오톡 혹은 LMS으로 안내되며, 자동 전액 환불처리됩니다. (단, 공지 전 직접 취소하시는 경우 상단 일반 환불 규정되로 처리됩니다.)</li>
					</ul>
					<ul class="matchRule"><h4>유의 상항</h4>
						<li>단순 변심으로 취소 혹은 변경을 요청하는 경우 환불이 불가합니다.</li>
						<li>무단 불참하거나 매치 시작 90분 이내에 취소하면 페널티를 받습니다.</li>
						<li>참여가 어려울 경우 , 원활한 매치 진행을 위해 마이페이지에서 미리 취소해주세요.</li>
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
						<li>현장에서 심판님께서 직접 귀가 의사를 전달해야만 환불 처리가 됩니다.</li>
					</ul>
					<ul class="matchRule"><h4>취소 방법</h4>
						<li>[마이페이지] -> 취소를 원하는 매치의 [상세 내역] 내 [취소하기]</li>
					</ul>
                </div>
            </div>            
                   
			<div class="info-box">
				<h3>리뷰</h3>
			<div class="review">
			    <div class="review-item">
			      <div class="number">1.</div>
			      <div class="content">정말 좋은 구장입니다</div>
			      <div class="author">이명건</div>
			      <div class="date-rating">
			        <span class="date">2024.10.31</span>
			        <img src="${pageContext.request.contextPath}/resources/images/star.png" alt="평점" class="star" />5
			      </div>
			    </div>
			
			    <div class="review-item">
			      <div class="number">1.</div>
			      <div class="content">정말 좋은 구장입니다</div>
			      <div class="author">이명건</div>
			      <div class="date-rating">
			        <span class="date">2024.10.31</span>
			        <img src="${pageContext.request.contextPath}/resources/images/star.png" alt="평점" class="star" />5
			      </div>
			    </div>
			
			    <div class="review-item">
			      <div class="number">1.</div>
			      <div class="content">정말 좋은 구장입니다</div>
			      <div class="author">이명건</div>
			      <div class="date-rating">
			        <span class="date">2024.10.31</span>
			        <img src="${pageContext.request.contextPath}/resources/images/star.png" alt="평점" class="star" />5
			      </div>
			    </div>
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
					<div class="matchTime">11월 12일 화요일 07:00</div>
					<div class="matchPlace">
						<h1 class="txtH w700h">
							<p>서울 강동 송파 풋살장</p>
						</h1>
						<div class="wtgTool">
							<span class="stadium-info_address">서울특별시 송파구 풍납동 403-3</span>
							<button onclick="showMap()" class="sm1">지도 보기</button>
						</div>
						<div style="margin-top: 10px; display: flex;">
							<div class="scope"><img src="${pageContext.request.contextPath}/resources/images/star.png" class="star"><span>5/5</span></div>
						</div>
					</div>
					<div class="match-info_fee">
						<div class="matchFee">
							<div>
								<span class="matchFee_money">200,000원</span>
								<span> / 2시간</span>
							</div>
							<div>
								<p style="color: black; font-size: 12px;">구장 운영 시간 : 09:00 ~ 24:00</p>
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
							<button type="button" class="btn letsplab" data-bs-toggle="modal" data-bs-target="#subscription">
								<p style="color: white">신청하기</p>
							</button>
						</div>
					</div>
				</div>
			</div>
        </aside>
    </div>
	<div class="chat-button" data-bs-toggle="modal" data-bs-target="#exampleModal">
    	<img src="${pageContext.request.contextPath}/resources/images/chat.png" alt="Chat Icon">
    </div>
    
    <!-- 상담 쪽 모달 -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog" id="custom-modal">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">문의하기</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
					<form id="inquiry-form">
	                    <div class="mb-3">
	                        <label for="questionTitle" class="form-label">제목 <span class="text-danger">*</span></label>
	                        <input type="text" class="form-control" id="questionTitle" placeholder="제목을 입력하세요" required>
	                    </div>
	                    <div class="mb-3">
	                        <label for="questionContent" class="form-label">문의 내용 <span class="text-danger">*</span></label>
	                        <textarea class="form-control" id="questionContent" rows="6" placeholder="문의 내용을 입력하세요" required></textarea>
	                    </div>
	                </form>
				</div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	                <button type="submit" class="btn btn-primary" form="inquiry-form">질문 제출</button>
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
					<div class="modal-header">
						<h4 class="modal-title">신청하기</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>
					<!-- Modal body -->
					<div class="modal-body">
						<form action="" method="post" class="modal-form">
							<!-- 날짜 선택하기 -->
							<p>매칭 날짜를 선택해주세요</p>
							<jsp:include page="/WEB-INF/views/common/calendar_header.jsp" />
							<p>매칭을 잡을 시간을 선택해주세요</p>
							<div class="mt-start-container">
			                <select class="mt-starttime">
								<option value="" disabled selected>시간을 선택해주세요.</option>
			                    <option value="05:00:00">05:00</option>
			                    <option value="06:00:00">06:00</option>
			                    <option value="07:00:00">07:00</option>
			                    <option value="08:00:00">08:00</option>
			                    <option value="09:00:00">09:00</option>
			                    <option value="10:00:00">10:00</option>
			                    <option value="11:00:00">11:00</option>
			                    <option value="12:00:00">12:00</option>
			                </select>
			            </div>
			            <p>~</p>
			            <div class="mt-end-container">
			                <select class="mt-endtime">
			                	<option value="" disabled selected>시간을 선택해주세요.</option>
			                    <option value="13:00:00">13:00</option>
			                    <option value="14:00:00">14:00</option>
			                    <option value="15:00:00">15:00</option>
			                    <option value="16:00:00">16:00</option>
			                    <option value="17:00:00">17:00</option>
			                    <option value="18:00:00">18:00</option>
			                    <option value="19:00:00">19:00</option>
			                    <option value="20:00:00">20:00</option>
			                    <option value="21:00:00">21:00</option>
			                    <option value="22:00:00">22:00</option>
			                    <option value="23:00:00">23:00</option>
			                    <option value="24:00:00">24:00</option>
			                </select>
			            </div>
			            <div class="modal-footer">
			            	<button type="submit" class="btn btn-primary">신청하기</button>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=043f5595cb50307eae5f33cc8943d0e6"></script>
    <script>
        var map;
        var isMapVisible = false; // 현재 상태를 저장하는 변수
        
        function showMap() {
            if (isMapVisible) {
                // 지도를 숨기고 이미지를 보이게 함
                document.getElementById('map').style.display = 'none';
                document.getElementById('stadiumImage').style.display = 'block';
            } else {
                // 이미지를 숨기고 지도를 보이게 함
                document.getElementById('stadiumImage').style.display = 'none';
                document.getElementById('map').style.display = 'block';

                // 지도 생성
                if (!map) {
                    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                        mapOption = { 
                            center: new kakao.maps.LatLng(37.637523, 126.917863), // 지도의 중심좌표
                            level: 3 // 지도의 확대 레벨
                        };

                    map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                    // 마커가 표시될 위치입니다 
                    var markerPosition  = new kakao.maps.LatLng(37.637523, 126.917863); 

                    // 마커를 생성합니다
                    var marker = new kakao.maps.Marker({
                        position: markerPosition
                    });

                    // 마커가 지도 위에 표시되도록 설정합니다
                    marker.setMap(map);
                }
            }
            // 상태 반전
            isMapVisible = !isMapVisible;
        }
    </script>
</body>
</html>