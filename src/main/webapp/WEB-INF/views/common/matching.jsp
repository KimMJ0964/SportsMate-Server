<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/common/matching.css">
</head>
<body>
    <div class="wrap">
        <div class="matching-container">
            <div class="matching-img">
                <div class="matching-img-box">
                    <div class="matching-write">현재 진행중인 매칭</div>
                    <img src="${pageContext.request.contextPath}/resources/images/matching.png" alt="매칭 이미지" class="matchingimg" />
                </div>
            </div>
        </div>
        <div class="weekday-selector">
            <div class="day-box inactive" onclick="toggleDay(this)">
                <span class="date">21</span>
                <span class="day">월</span>
            </div>
            <div class="day-box inactive" onclick="toggleDay(this)">
                <span class="date">22</span>
                <span class="day">화</span>
            </div>
            <div class="day-box inactive" onclick="toggleDay(this)">
                <span class="date">23</span>
                <span class="day">수</span>
            </div>
            <div class="day-box inactive" onclick="toggleDay(this)">
                <span class="date">24</span>
                <span class="day">목</span>
            </div>
            <div class="day-box inactive" onclick="toggleDay(this)">
                <span class="date">25</span>
                <span class="day">금</span>
            </div>
            <div class="day-box inactive" onclick="toggleDay(this)">
                <span class="date std">26</span>
                <span class="day std">토</span>
            </div>
            <div class="day-box inactive" onclick="toggleDay(this)">
                <span class="date sd">27</span>
                <span class="day sd">일</span>
            </div>
        </div>
        <div class="choice">
            <div class="mt-region-container">
                <select class="mt-region">
                    <option value="전체">전체</option>
                    <option value="서울">서울</option>
                    <option value="부산">부산</option>
                    <option value="대구">대구</option>
                    <option value="인천">인천</option>
                    <option value="광주">광주</option>
                    <option value="대전">대전</option>
                    <option value="울산">울산</option>
                    <option value="세종">세종</option>
                </select>
            </div>
            <div class="mt-start-container">
                <select class="mt-starttime">
                    <option value="00 : 00">00 : 00</option>
                    <option value="02 : 00">02 : 00</option>
                    <option value="04 : 00">04 : 00</option>
                    <option value="06 : 00">06 : 00</option>
                    <option value="08 : 00">08 : 00</option>
                    <option value="10 : 00">10 : 00</option>
                    <option value="12 : 00">12 : 00</option>
                    <option value="14 : 00">14 : 00</option>
                </select>
            </div>
            <p>~</p>
            <div class="mt-end-container">
                <select class="mt-endtime">
                    <option value="00 : 00">00 : 00</option>
                    <option value="02 : 00">02 : 00</option>
                    <option value="04 : 00">04 : 00</option>
                    <option value="06 : 00">06 : 00</option>
                    <option value="08 : 00">08 : 00</option>
                    <option value="10 : 00">10 : 00</option>
                    <option value="12 : 00">12 : 00</option>
                    <option value="14 : 00">14 : 00</option>
                </select>
            </div>
        </div>
        <div class="tableContainer">
		    <div class="table-row">
		        <div class="table-cell time">18 : 00</div>
		        <div class="table-cell location">서울 영등포 EA SPORTS FC B구장</div>
		        <div class="table-cell"><button class="match-btn">매칭하기</button></div>
		    </div>
		    <div class="table-row">
		        <div class="table-cell time">19 : 00</div>
		        <div class="table-cell location">부산 해운대 EA SPORTS FC A구장</div>
		        <div class="table-cell"><button class="match-btn">매칭하기</button></div>
		    </div>
		    <div class="table-row">
		        <div class="table-cell time">20 : 00</div>
		        <div class="table-cell location">대구 동구 EA SPORTS FC C구장</div>
		        <div class="table-cell"><button class="match-btn">매칭하기</button></div>
		    </div>
		    <div class="table-row">
		        <div class="table-cell time">21 : 00</div>
		        <div class="table-cell location">인천 남동 EA SPORTS FC D구장</div>
		        <div class="table-cell"><button class="match-btn">매칭하기</button></div>
		    </div>
		    <div class="table-row">
		        <div class="table-cell time">22 : 00</div>
		        <div class="table-cell location">광주 서구 EA SPORTS FC E구장</div>
		        <div class="table-cell"><button class="match-btn">매칭하기</button></div>
		    </div>
		    <div class="table-row">
		    </div>
		</div>
    </div>
    <script>
        function toggleDay(element) {
            const isActive = element.classList.contains('active');
            const dayBoxes = document.querySelectorAll('.day-box');

            // Reset all boxes to inactive
            dayBoxes.forEach(box => {
                box.classList.remove('active');
                box.classList.add('inactive');
            });

            // If the clicked box was not active, set it to active
            if (!isActive) {
                element.classList.add('active');
                element.classList.remove('inactive');
            }
        }
    </script>
</body>
</html>