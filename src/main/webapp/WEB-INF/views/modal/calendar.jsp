<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        button {
            border: none;
            outline: none;
            background-color: transparent;
            padding: 0;
            cursor: pointer;
        }
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .wrapper {
            width: 450px;
            background: #fff;
            border-radius: 10px;
            padding: 25px;
        }
        .nav {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 30px;
        }
        .current-date {
            font-size: 24px;
            font-weight: 600;
        }
        .nav button {
            width: 38px;
            height: 38px;
            font-size: 30px;
            color: #878787;
        }
        .calendar ul {
            display: flex;
            list-style: none;
            flex-wrap: wrap;
            text-align: center;
            padding: 0;
        }
        .weeks li {
            font-weight: 500;
            width: calc(100% / 7); /* 각 요일의 너비를 7로 나누어 균등하게 배분 */
            padding: 10px 0; /* 위아래 패딩 추가 */
        }
        .days {
            margin-bottom: 20px;
        }
        .days li {
            width: calc(100% / 7);
            position: relative;
            z-index: 1;
            margin-top: 30px;
            cursor: pointer;
        }
        .inactive {
            color: #aaa;
        }
        .active {
            color: #fff;
        }
        .days li::before {
            position: absolute;
            content: '';
            height: 40px;
            width: 40px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border-radius: 50%;
            z-index: -1;
        }
        .days li:hover::before {
            background: #f2f2f2;
        }
        .active::before {
            background: #008aff;
        }
        /* 미디어 쿼리 적용: 모바일 화면 (425px 이하) */
		@media (max-width: 425px) {
		    .wrapper {
		        width: 100%;
		        padding: 10px;
		    }
		
		    .nav {
		        margin-bottom: 20px;
		    }
		
		    .current-date {
		        font-size: 18px;
		    }
		
		    .nav button {
		        width: 30px;
		        height: 30px;
		        font-size: 24px;
		    }
		
		    .weeks li {
		        font-size: 12px;
		        padding: 5px 0;
		    }
		
		    .days li {
		        font-size: 10px;
		        margin-top: 15px;
		    }
		
		    .days li::before {
		        height: 25px;
		        width: 25px;
		    }
		
		    .days {
		        margin-bottom: 15px;
		    }
		}
</style>
</head>
<body>
    <div class="wrapper">
        <header>
            <div class="nav">
                <button id="prev-button"> < </button>
                <p class="current-date" id="current-date"></p>
                <button id="next-button"> > </button>
            </div>
        </header>
        <div class="calendar">
            <ul class="weeks">
                <li style="color: red;">일</li>
                <li>월</li>
                <li>화</li>
                <li>수</li>
                <li>목</li>
                <li>금</li>
                <li style="color: blue;">토</li>
            </ul>
            <ul class="days" id="days"></ul>
        </div>
    </div>
<script src="${pageContext.request.contextPath}/resources/js/modal/calendar.js"></script>
</body>
</html>