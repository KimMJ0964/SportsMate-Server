<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구장 디테일 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/detail.css">
</head>
<body>
<div class="wrap">
    <jsp:include page="/WEB-INF/views/common/header.jsp" />
    <br>
    <jsp:include page="/WEB-INF/views/common/nav.jsp" />
    <br>

    <!-- 이미지와 지도 컨테이너 -->
    <div class="image-container">
        <img id="stadiumImage" src="resources/images/field.png" alt="Stadium Image" />
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
								<span class="matchFee_money">200.000원</span>
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
                <h3>지역 날씨</h3>
            </div>

            <div class="info-box">
				<div class="section_header">
					<div class="section_title">
						<h3>구장 정보</h3>
					</div>
				</div>
				<div class="section_body">
					<div class="info_list_wrapper double">
						<ul>
							<li class="info_list">
								<img src="" class="icon">
								<div>
									<p> 31x15m </p>
								</div>
							</li>
							<li class="info_list">
								<img src="" class="icon">
								<div>
									<p class="title_line">샤워실</p>
								</div>
							</li>
							<li class="info_list">
								<img src="" class="icon">
								<div>
									<p class="title_line">주차장</p>
								</div>
							</li>
							<li class="info_list">
								<img src="" class="icon">
								<div>
									<p class="title_line">풋살화 대여</p>
								</div>
							</li>
							<li class="info_list">
								<img src="" class="icon">
								<div>
									<p class="title_line">음료 판매</p>
								</div>
							</li>
							<li class="info_list">
								<img src="" class="icon">
								<div>
									<p>화장실</p>
								</div>
							</li>
						</ul>
					</div>
					<div class="stadInner">
						<div class="matchRule">
							<h4>구장 특이사항</h4>
							<pre class="txt2">
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
				<table>
					<tr>
						<td>1.</td>
						<td>정말 좋은 구장입니다 ~!</td>
						<td>이명건</td>
						<td>2024.10.31 <img src="" alt="평점" class="" />5</td>
					</tr>
					<tr>
						<td>1.</td>
						<td>정말 좋은 구장입니다 ~!</td>
						<td>이명건</td>
						<td>2024.10.31 <img src="" alt="평점" class="" />5</td>
					</tr>
					<tr>
						<td>1.</td>
						<td>정말 좋은 구장입니다 ~!</td>
						<td>이명건</td>
						<td>2024.10.31 <img src="" alt="평점" class="" />5</td>
					</tr>
				</table>
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
							<button onclick="showMap()" class="bt1">지도 보기</button>
						</div>
						<div style="margin-top: 10px; display: flex;">
							<div class="scope"><img src="resources/images/star.png" class="star"><span>5/5</span></div>
						</div>
					</div>
					<div class="match-info_fee">
						<div class="matchFee">
							<div>
								<span class="matchFee_money">200.000원</span>
								<span> / 2시간</span>
							</div>
							<div>
								<p style="color: black; font-size: 12px;">구장 운영 시간 : </p>
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
							<button type="button" class="btn letsplab">
								<p>신청하기</p>
							</button>
						</div>
					</div>
				</div>
			</div>
        </aside>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</div>
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