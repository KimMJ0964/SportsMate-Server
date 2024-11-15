<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>모바일 모달 & 달력</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <style>
        @charset "UTF-8";

        .mobile {
             max-width: 480px;
    		 margin: auto;
        }

        button {
            border: none;
            outline: none;
            background-color: transparent;
            padding: 0;
            cursor: pointer;
        }

        .modal-dialog {
            max-width: 425px;
            width: 100%;
            margin: 0 auto;
        }

        .modal-content {
            padding: 10px;
        }

        .input-box {
            border: 1px solid #e0e0e0;
            border-radius: 8px;
        }

        .row-group {
            display: flex;
            flex-wrap: wrap; /* 모바일 화면에 맞게 줄바꿈 */
            gap: 10px;
            border-bottom: 1px solid #e0e0e0;
        }

        .row-group:last-child {
            border-bottom: none;
        }

        .search-group, .type-select-group, .date-time-group {
            display: flex;
            align-items: center;
            width: 100%;
        }

        .icon {
            width: 18px;
            height: 18px;
            margin-right: 5px;
        }

        .calendar-container {
            display: none; /* 초기 숨김 */
            justify-content: center;
        }

        .wrapper {
            width: 100%;
            max-width: 425px;
            background: #fff;
            border-radius: 10px;
            padding: 25px;
            margin-top: 20px;
        }

        .nav {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .current-date {
            font-size: 18px;
            font-weight: 600;
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
            width: calc(100% / 7);
            padding: 10px 0;
        }

        .days li {
            width: calc(100% / 7);
            position: relative;
            z-index: 1;
            margin-top: 10px;
            cursor: pointer;
        }

        .inactive {
            color: #aaa;
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
    </style>
</head>
<body>
<div class="mobile">
    <div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">검색</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="input-box">
                        <div class="row-group">
                            <div class="search-group">
                                <img src="검색_아이콘_URL" alt="검색 아이콘" class="icon">
                                <input type="text" class="form-control" placeholder="구장명을 입력해주세요." aria-label="구장명">
                            </div>
                            <div class="type-select-group">
                                <select class="form-select">
                                    <option>축구</option>
                                    <option>풋살</option>
                                    <option>야구</option>
                                    <option>농구</option>
                                </select>
                            </div>
                        </div>
                        <div class="row-group">
                            <div class="date-time-group" id="date-selector">
                                <img src="달력_아이콘_URL" alt="달력 아이콘" class="icon">
                                <span id="selected-date">날짜를 선택하세요</span>
                            </div>
                            <div class="date-time-group">
                                <img src="시간_아이콘_URL" alt="시간 아이콘" class="icon">
                                <select class="form-select">
                                    <option>07:00 ~ 11:00</option>
                                    <option>11:00 ~ 15:00</option>
                                    <option>15:00 ~ 19:00</option>
                                    <option>19:00 ~ 23:00</option>
                                </select>
                            </div>
                        </div>
                        <div class="calendar-container" id="calendar-container">
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <script>
        const daysContainer = document.getElementById('days');
        const currentDateElement = document.getElementById('current-date');
        const prevButton = document.getElementById('prev-button');
        const nextButton = document.getElementById('next-button');
        const dateSelector = document.getElementById('date-selector');
        const selectedDateSpan = document.getElementById('selected-date');
        const calendarContainer = document.getElementById('calendar-container');

        let currentDate = new Date();

        function renderCalendar() {
            const year = currentDate.getFullYear();
            const month = currentDate.getMonth();
            currentDateElement.innerText = currentDate.toLocaleString('default', { month: 'long', year: 'numeric' });

            daysContainer.innerHTML = '';

            const firstDayOfMonth = new Date(year, month, 1).getDay();
            const lastDateOfMonth = new Date(year, month + 1, 0).getDate();

            for (let i = 0; i < firstDayOfMonth; i++) {
                const li = document.createElement('li');
                li.classList.add('inactive');
                daysContainer.appendChild(li);
            }

            for (let date = 1; date <= lastDateOfMonth; date++) {
                const li = document.createElement('li');
                li.innerText = date;
                daysContainer.appendChild(li);
                li.addEventListener('click', () => {
                    selectedDateSpan.innerText = `${year}-${month + 1}-${date}`;
                    calendarContainer.style.display = 'none';
                });
            }
        }

        prevButton.addEventListener('click', () => {
            currentDate.setMonth(currentDate.getMonth() - 1);
            renderCalendar();
        });

        nextButton.addEventListener('click', () => {
            currentDate.setMonth(currentDate.getMonth() + 1);
            renderCalendar();
        });

        dateSelector.addEventListener('click', () => {
            calendarContainer.style.display = (calendarContainer.style.display === 'none' || calendarContainer.style.display === '') ? 'flex' : 'none';
        });

        renderCalendar();
    </script>
</body>
</html>
