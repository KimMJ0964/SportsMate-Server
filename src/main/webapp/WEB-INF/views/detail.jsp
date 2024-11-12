<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>구장 디테일 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <style>
    	/* 구장 이미지 & 지도 API 사이즈 CSS */
    	.image-container, .map-container {
            width: 1200px; /* 이미지와 같은 너비 */
            height: 500px; /* 이미지와 같은 높이 */
            position: relative; /* 자식 요소의 절대 위치를 설정하기 위함 */
        }
        img {
            width: 1200px;
            height: 500px;
            object-fit: cover;
        }
        /* 별점 이미지 */
        .star {
        	width: 20px;
        	height: 20px;
        	margin: 2px;
        }
        /* 칸 나누기 CSS */
        .container {
            display: flex;
            margin-top: 20px;
        }
        .main-content {
            flex: 3;
        }
        .sidebar {
            flex: 2;
            margin-left: 20px;
        }
        .info-box {
            border: 1px solid black;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            margin-top: 0; /* 위쪽 여백 제거 */
        }
        .info-section {
            display: flex;
            justify-content: space-between; /* 왼쪽과 오른쪽 정렬 */
        }
        /* 사이드바쪽 CSS */
        hr {
        	background: black;
        	height:1px;
        	border:0;
        }
        
        .p1 {
        	font-size:18px;
        }
        
        .p2 {
        	font-size:20px;
        	font-weight: bold;
        }
        
        .p3 {
        	font-size: 16px;
        }
        
        .scope {
        	display: flex;
        }
        .bt1 {
        	color: #727f88;
        	text-decoration: underline;
        }
        .bt2 {
        	background-color: #1570ff; /* 배경색 */
		    color: white; /* 텍스트 색상 */
		    width: 130px; /* 너비 */
		    font-size: 18px; /* 글자 크기 */
		    padding: 10px; /* 내부 여백 */
		    border-radius: 8px; /* 모서리 둥글게 */
		    border: none; /* 테두리 없음 */
		    cursor: pointer; /* 커서 모양 */
        }
        /* 카카오map */
        #map {
        	display: none; /* 초기 상태에서 지도 숨김 */
        	width: 100%;
            height: 100%; /* 이미지와 동일한 크기 */
            position: absolute; /* 부모 요소 안에서 절대 위치 설정 */
            top: 0;
            left: 0;
        }
        /* 구장 정보 */
        .section_header{
        	padding: 20px;
        }
        .section_title {
        	display: flex;
        	align-items: center;
        	justify-content: space-between;
        	position: relative;
        }
        .section_body {
        	padding: 0px 20px 24px 20px;
        }
        .info_list_wrapper {
        	margin-bottom: 10px;
        }
        .info_list_wrapper.double ul li {
        	width: 48%;
        	display: inline-flex;
        	align-items: center;
        }
        .info_list_wrapper .info_list {
        	padding: 10px 0px;
        	display: flex;
        }
        .info_list_wrapper .info_list .title_line {
        	font-size:16px;
        	padding-bottom: 5px;
        	text-decoration-line: line-through;
        	color: #c4cdd4;
        }
        .stadInner {
        	border-top: 1px solid #d9e0e6;
        	padding-top: 10px;
        }
        .stadInner .matchRule:first-child {
        	margin-top: 0;
        }
        .stadInner .matchRule {
        	margin-top: 20px;
        }
        .stadInner pre {
        	white-space: pre-line;
        	word-break: keep-all;
        	font-size: 14px;
        	line-height: 22px;
        	overflow: auto;
        }
        .txt2 {
        	font-size: 14px;
        }
        pre {
        	font-size: 1.1cm;
        }
        pre {
        	white-space: pre-wrap;
		    word-wrap: break-word;
		    word-break: keep-all;
		    overflow: auto;
        }
        /* 매치 진행 방식 */
        .section_title--arrow {
        	cursor: pointer;
        }
        element.style {
        	border: none;
        }
        .section_body {
        	padding: 0px 20px 24px 20px;
        }
        .stadInner .matchRule:first-child {
        	margin-top: 0;
        }
        .stadInner .matchRule h4 {
        	font-size: 14px;
        	margin-bottom: 5px;
        }
        .stadInner .matchRule table {
        	border-radius: 10px;
        	border-style: hidden;
        	box-shadow: 0 0 0 1px #9eaab3;
        	width: 100%;
        	margin-top: 10px;
        }
        .stadInner .matchRule table, th, td {
        	border: 1px solid #9eaab3;
        	border-collapse: collapse;
        	font-size: 14px;
        }
        colgroup {
        	display: table-column-group;
        	unicode-bidi: isolate;
        }
        col {
        	display: table-column;
        	unicode-bidi: isolate;
        }
        table {
        	display: table;
        	border-collapse: separate;
		    box-sizing: border-box;
		    text-indent: initial;
		    unicode-bidi: isolate;
		    border-spacing: 2px;
		    border-color: gray;
        }
    </style>
</head>
<body>
<div class="wrap">
    <jsp:include page="header.jsp" />
    <br>
    <jsp:include page="nav.jsp" />
    <br>

    <!-- 이미지와 지도 컨테이너 -->
    <div class="image-container">
        <img id="stadiumImage" src="resources/images/stadium.png" alt="Stadium Image" />
        <div id="map"></div> <!-- 지도 div 추가 -->
    </div>

    <div class="info-section">
        <div class="main-content">
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
						<li>
							
						</li>
					</ul>
                </div>
            </div>            
                   
			<div class="info-box">
                <ul>
                    <h3>매치 진행방식</h3>
                    <li><strong>이용 안내:</strong> 이용 가능 시간, 요금 등</li>
                    <li><strong>편의시설:</strong>
                        <ul>
                            <li>화장실</li>
                            <li>주차장</li>
                            <li>음료수 자판기</li>
                        </ul>
                    </li>
                </ul>
            </div>
            
        <aside class="sidebar">
            <div class="info-box">
                <p class="p1">풋살</p>
                <p class="p2">서울 영등포 SKY 풋살파크 B구장</p>
                <p class="p3">서울 영등포구 선유로 43길 19 
                <button onclick="showMap()" class="bt1">지도 보기</button>
                </p>
                <div class="scope"><img src="resources/images/star.png" class="star"><p>5/5</p></div>
                <hr>
                <p class="p2">가격: 200,000원</p>
                <p class="p1">구장 운영 시간 -> 09:00 ~ 24:00</p>
                 <div style="display: flex; justify-content: space-between; align-items: center;">
			         <div>
			                지금 신청하면<br>진행 확정이 빨라져요!
			         </div>
			         <button class="bt2">신청하기</button>
		        </div>
            </div>
        </aside>
    </div>

    <jsp:include page="footer.jsp" />
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
