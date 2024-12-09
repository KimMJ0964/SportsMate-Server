const currentDate2 = document.querySelector(".current-date-2"),
      daysTag2 = document.querySelector(".days-2"),
      prevNextIcon2 = document.querySelectorAll("#prev-2, #next-2");

let date2 = new Date(),
    currYear2 = date2.getFullYear(),
    currMonth2 = date2.getMonth();

const months2 = [  
    "1월", "2월", "3월", "4월", "5월", "6월",
    "7월", "8월", "9월", "10월", "11월", "12월"
];

let selectedDateElement = null; // 현재 선택된 날짜를 추적

const renderCalendar2 = () => {
    let firstDayofMonth2 = new Date(currYear2, currMonth2, 1).getDay(),
        lastDateofMonth2 = new Date(currYear2, currMonth2 + 1, 0).getDate(),
        lastDayofMonth2 = new Date(currYear2, currMonth2, lastDateofMonth2).getDay(),
        lastDateofLastMonth2 = new Date(currYear2, currMonth2, 0).getDate();
    
    let liTag2 = "";

    // 이전 달 날짜
    for (let i = firstDayofMonth2; i > 0; i--) {
        liTag2 += `<li class="inactive-2">${lastDateofLastMonth2 - i + 1}</li>`;
    }

    // 현재 달 날짜
    for (let i = 1; i <= lastDateofMonth2; i++) {
        let isPast2 = currYear2 === date2.getFullYear() && currMonth2 === date2.getMonth() && i < date2.getDate() ? "past-2" : "";
        let dayOfWeek2 = new Date(currYear2, currMonth2, i).getDay();
        let isSaturday2 = !isPast2 && dayOfWeek2 === 6 ? "saturday-2" : ""; 
        let isSunday2 = !isPast2 && dayOfWeek2 === 0 ? "sunday-2" : ""; 
        liTag2 += `<li class="${isPast2} ${isSaturday2} ${isSunday2}" data-date="${currYear2}-${(currMonth2 + 1).toString().padStart(2, "0")}-${i.toString().padStart(2, "0")}">${i}</li>`;
    }

    // 다음 달 날짜
    for (let i = lastDayofMonth2; i < 6; i++) {
        liTag2 += `<li class="inactive-2">${i - lastDayofMonth2 + 1}</li>`;
    }

    currentDate2.innerText = `${currYear2} ${months2[currMonth2]}`;
    daysTag2.innerHTML = liTag2;

    // 날짜 클릭 이벤트 추가
    document.querySelectorAll(".days-2 li").forEach(day => {
        if (!day.classList.contains("past-2") && !day.classList.contains("inactive-2")) {
            day.addEventListener("click", () => {
                const selectedDate2 = day.dataset.date;

                // 기존 선택된 날짜 스타일 제거
                if (selectedDateElement) {
                    selectedDateElement.classList.remove("active-2");
                }

                // 새 선택된 날짜 스타일 추가
                day.classList.add("active-2");
                selectedDateElement = day;

                // 선택된 날짜 값을 hidden input에 저장
                const hiddenInput2 = document.getElementById("hidden-selected-date-2"); 
                if (hiddenInput2) {
                    hiddenInput2.value = selectedDate2;
                }
            });
        }
    });
};

renderCalendar2();

prevNextIcon2.forEach(icon => {
    icon.addEventListener("click", () => {
        currMonth2 = icon.id === "prev-2" ? currMonth2 - 1 : currMonth2 + 1;

        if (currMonth2 < 0) {
            currMonth2 = 11;
            currYear2 -= 1;
        }

        if (currMonth2 > 11) {
            currMonth2 = 0;
            currYear2 += 1;
        }

        renderCalendar2();
    });
});
