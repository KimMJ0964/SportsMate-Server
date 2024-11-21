// 요일 이름 배열
        const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];

        // 현재 날짜 기준으로 1주일의 날짜 생성
        function generateWeekdays() {
            const today = new Date(); // 현재 날짜
            const startOfWeek = new Date(today); // 시작 날짜 계산
            startOfWeek.setDate(today.getDate() - today.getDay()); // 이번 주 일요일로 설정

            const weekdaySelector = document.getElementById("weekdaySelector");
            weekdaySelector.innerHTML = ""; // 초기화

            for (let i = 0; i < 7; i++) {
                const dayDate = new Date(startOfWeek);
                dayDate.setDate(startOfWeek.getDate() + i); // 요일별 날짜 계산

                // 날짜 및 요일 정보 생성
                const date = dayDate.getDate(); // 날짜 (1-31)
                const day = daysOfWeek[dayDate.getDay()]; // 요일 이름

                // HTML 요소 추가
                const dayBox = document.createElement("div");
                dayBox.className = "day-box inactive";
                dayBox.setAttribute("onclick", "toggleDay(this)");

                // 주말 색상 적용 (토요일/일요일)
                const isSaturday = dayDate.getDay() === 6;
                const isSunday = dayDate.getDay() === 0;

                dayBox.innerHTML = `
                    <span class="date ${isSaturday ? 'std' : isSunday ? 'sd' : ''}">${date}</span>
                    <span class="day ${isSaturday ? 'std' : isSunday ? 'sd' : ''}">${day}</span>
                `;

                weekdaySelector.appendChild(dayBox);
            }
        }

        // 클릭 시 활성화/비활성화 상태 변경
        function toggleDay(element) {
            const activeClass = "active";
            const allBoxes = document.querySelectorAll(".day-box");
            allBoxes.forEach(box => box.classList.remove(activeClass));
            element.classList.add(activeClass);
        }

        // 페이지 로드 시 초기화
        document.addEventListener("DOMContentLoaded", generateWeekdays);