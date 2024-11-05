<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matching.css">
</head>
<body>
    <div class="wrap">
        <div class="matching-container">
            <div class="matching-img">
                <div class="matching-img-box">
                    <div class="matching-write">현재 진행중인 매칭</div>
                    <img src="resources/img/matching.png" alt="매칭 이미지" />
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
                <span class="date">26</span>
                <span class="day">토</span>
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
            <table>
                <tr>
                    <td>18 : 00</td>
                    <td>서울 영등포 EA SPORTS FC(더에프필드) B구장</td>
                    <td><button class="match-btn">매칭하기</button></td>
                </tr>
                <tr>
                    <td>19 : 00</td>
                    <td>부산 해운대 EA SPORTS FC(더에프필드) A구장</td>
                    <td><button class="match-btn">매칭하기</button></td>
                </tr>
                <tr>
                    <td>20 : 00</td>
                    <td>대구 동구 EA SPORTS FC(더에프필드) C구장</td>
                    <td><button class="match-btn">매칭하기</button></td>
                </tr>
                <tr>
                    <td>21 : 00</td>
                    <td>인천 남동 EA SPORTS FC(더에프필드) D구장</td>
                    <td><button class="match-btn">매칭하기</button></td>
                </tr>
                <tr>
                    <td>22 : 00</td>
                    <td>광주 서구 EA SPORTS FC(더에프필드) E구장</td>
                    <td><button class="match-btn">매칭하기</button></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
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