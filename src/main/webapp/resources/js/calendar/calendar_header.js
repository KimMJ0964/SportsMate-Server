const currentDate = document.querySelector(".current-date"),
daysTag = document.querySelector(".days");
prevNextIcon = document.querySelectorAll("#prev, #next");

let date = new Date(),
currYear = date.getFullYear(),
currMonth = date.getMonth();

const months = [  
    "1월","2월","3월","4월","5월","6월",
    "7월","8월","9월","10월","11월","12월"
];

const renderCalendar = () => {
    let firstDayofMonth = new Date(currYear, currMonth, 1).getDay(),
    lastDateofMonth = new Date(currYear, currMonth + 1, 0).getDate(),
    lastDayofMonth = new Date(currYear, currMonth, lastDateofMonth).getDay(),
    lastDateofLastMonth = new Date(currYear, currMonth, 0).getDate();
    let liTag = "";

    for (let i = firstDayofMonth; i > 0; i--) {
        liTag += `<li class="inactive">${lastDateofLastMonth - i + 1}</li>`;
    }

    for (let i = 1; i <= lastDateofMonth; i++) {
        /*let isToday = i === date.getDate() && currMonth === new Date().getMonth()
                        && currYear === new Date().getFullYear() ? "active" : ""; (오늘날짜 강조(필요시 사용))*/ 

        let isPast = currYear === date.getFullYear() && currMonth === date.getMonth() 
                && i < date.getDate() ? "past" : "";

        let dayOfWeek = new Date(currYear, currMonth, i).getDay();
        let isSaturday = !isPast && dayOfWeek === 6 ? "saturday" : ""; // 토요일
        let isSunday = !isPast && dayOfWeek === 0 ? "sunday" : ""; // 일요일

        liTag += `<li class="${isPast} ${isSaturday} ${isSunday}" data-date="${currYear}-${currMonth + 1}-${i}">${i}</li>`;
    }

    for (let i = lastDayofMonth; i < 6; i++) {
        liTag += `<li class="inactive">${i - lastDayofMonth + 1}</li>`;
    }


    currentDate.innerText = `${currYear} ${months[currMonth]}`;
    daysTag.innerHTML = liTag;

    // 날짜 클릭 이벤트 추가
    document.querySelectorAll(".days li").forEach(day => {
        if (!day.classList.contains("past") && !day.classList.contains("inactive")) {
            day.addEventListener("click", () => {
                const selectedDate = day.dataset.date; // 선택된 날짜
                const displayDate = document.getElementById("selected-date");
                const hiddenInput = document.getElementById("hidden-selected-date"); // 숨겨진 input
                
                if (displayDate) {
                    displayDate.textContent = selectedDate; // 화면에 날짜 표시
                }
                
                if (hiddenInput) {
                	hiddenInput.value = selectedDate; // 숨겨진 input 업데이트
                }
                alert(`선택한 날짜: ${selectedDate}`);
            });
        }
    });
};
renderCalendar();

prevNextIcon.forEach(icon => {
    icon.addEventListener("click", () => {
        if (icon.id === "prev" && (currYear === date.getFullYear() && currMonth <= date.getMonth())) {
            // (현재 기준 달) 이전으로 못 가게 막음
            alert("더 이전으로 이동할 수 없습니다.")
            return;
        }

        currMonth = icon.id === "prev" ? currMonth - 1 : currMonth + 1;

        if (currMonth < 0) {
            currMonth = 11;
            currYear -= 1;
        }

        if (currMonth > 11) {
            currMonth = 0;
            currYear += 1;
        }

        // 조건 수정: 11월 이전으로는 이동 제한
        if (currYear === date.getFullYear() && currMonth < date.getMonth()) {
            alert("더 이전으로 이동할 수 없습니다.");
            currMonth = date.getMonth(); // 제한 월로 되돌림
            currYear = date.getFullYear();
            return;
        }

        if(currMonth < 0 || currMonth > 11) {
            date = new Date(currYear, currMonth);
            currYear = date.getFullYear();
            currMonth = date.getMonth();
        } else {
            date = new Date();
        }
        renderCalendar();
    });
});