<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /*진행중인매칭이미지*/
    body{
            font-family: Arial, sans-serif;
            margin: 0 auto;
            box-sizing: border-box;
        }
        .matching-container {
            text-align: center;
            margin-bottom: 20px; /* 이미지와 날짜 간격주기*/
        }
        .matching-img-box {
            width: 100%;
            height: 100px;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }
        .matching-write {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 20px;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
            color: white;
            z-index: 1; /* 이미지 위로 텍스트가 나오도록 설정 */
        }
        img {
            max-width: 1210px;
            max-height: 100px;
        }
        /*날짜 선택*/
        .weekday-selector {
            display: flex;
            justify-content: space-around;
            margin: 0 auto;
            margin-bottom: 5px;
            max-width: 400px;
        }
        .day-box {
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 10px;
            border-radius: 20px;
            width: 50px;
            cursor: pointer;
            transition: background-color 0.3s;
            background-color: white;
            color: black;
        }
        .day-box.active {
            background-color: #0080ff;
            color: white;
        }
        .day-box.inactive {
            background-color: white;
            color: black;
        }
        .date {
            font-size: 16px;
            font-weight: bold;
            color: #333;
        }
        .day {
            font-size: 12px;
            color: #666;
        }
        .choice {
            display: flex;
            justify-content: center;
            gap: 30px;
            align-items: center;
        }
        /*지역선택*/
        .mt-region {
            width: 81px;
            height: 30px;
            border-radius: 14px;
            background-color: white;
            text-align: center;
        }
        /* 시작 시간 선택 */
        .mt-starttime {
            width: 81px;
            height: 30px;
            border-radius: 14px;
            background-color: white;
            text-align: center;
        }
        /* 끝 시간 선택 */
        .mt-endtime {
            width: 81px;
            height: 30px;
            border-radius: 14px;
            background-color: white;
            text-align: center;
        }
        /* 매칭 테이블 */
        .tableContainer {
        width: 100%;
        border-collapse: collapse;
        text-align: center;
        margin: 0 auto;
        margin-bottom: 90px;
        }

        table {
            width: 100%;
            border: none;
        }

        td {
            border-top: 1px solid black;
            padding: 5px;
        }

        td:first-child {
            font-size: 15px;
            padding: 0px;
        }

        td:nth-child(2),
        td:nth-child(3) {
            font-size: 12px;
        }

        td:nth-child(3) {
            font-size: 12px;
            text-align: center;
            display: flex;            /* 버튼을 중앙 정렬하기 위한 flex 설정 */
            justify-content: center;   /* 가로 가운데 정렬 */
            align-items: center;       /* 세로 가운데 정렬 */
        }

        .match-btn {
            padding: 5px 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .match-btn:hover {
            background-color: #0056b3;
        }
          /* 미디어 쿼리 */
    @media (max-width: 768px) {
        .mt-region, .mt-starttime, .mt-endtime {
            width: 70px; /* 작은 화면에서 선택 박스 크기 줄이기 */
            height: 28px;
        }

        .tableContainer {
            margin-bottom: 50px; /* 작은 화면에서 테이블 여백 조정 */
        }

        td {
            padding: 3px; /* 테이블 셀 패딩 줄이기 */
        }

        .date {
            font-size: 14px; /* 작은 화면에서 날짜 폰트 크기 줄이기 */
        }

        .day {
            font-size: 10px; /* 작은 화면에서 요일 폰트 크기 줄이기 */
        }

        .matching-write {
            font-size: 18px; /* 작은 화면에서 매칭 텍스트 크기 줄이기 */
        }
    }

    @media (min-width: 769px) {
        .mt-region, .mt-starttime, .mt-endtime {
            width: 100px; /* 큰 화면에서 선택 박스 크기 늘리기 */
            height: 35px;
        }

        td {
            padding: 7px; /* 테이블 셀 패딩 늘리기 */
        }
    }
</style>
</head>
<body>
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