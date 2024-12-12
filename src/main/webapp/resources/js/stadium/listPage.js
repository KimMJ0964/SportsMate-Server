// 날짜와 요일을 동적으로 생성하는 함수
function generateWeekdays(activeDate) {
    const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];
    const today = new Date();
    const startOfWeek = new Date(today);
    startOfWeek.setDate(today.getDate() - today.getDay());

    const weekdaySelector = document.getElementById("weekdaySelector");
    weekdaySelector.innerHTML = "";

    for (let week = 0; week < 2; week++) {
        const weekSlide = document.createElement("div");
        weekSlide.className = "swiper-slide";

        for (let i = 0; i < 7; i++) {
            const dayDate = new Date(startOfWeek);
            dayDate.setDate(startOfWeek.getDate() + i + week * 7);

            const fullDate = `${dayDate.getFullYear()}-${(dayDate.getMonth() + 1).toString().padStart(2, "0")}-${dayDate.getDate().toString().padStart(2, "0")}`;
            const date = dayDate.getDate();
            const day = daysOfWeek[dayDate.getDay()];
            const isSaturday = dayDate.getDay() === 6;
            const isSunday = dayDate.getDay() === 0;

            const dayBox = document.createElement("div");
            dayBox.className = `day-box ${fullDate === activeDate ? "active" : ""}`;
            dayBox.innerHTML = `
                <span class="date ${isSaturday ? 'std' : isSunday ? 'sd' : ''}">${date}</span>
                <span class="day ${isSaturday ? 'std' : isSunday ? 'sd' : ''}">${day}</span>
            `;

            dayBox.dataset.date = fullDate;

            // 날짜 클릭 이벤트 추가
            dayBox.addEventListener("click", () => {
                document.querySelectorAll(".day-box").forEach(box => box.classList.remove("active"));
                dayBox.classList.add("active");

                const activeDateElement = document.querySelector("#active-date");
                if (activeDateElement) {
                    activeDateElement.value = fullDate;
                    console.log("Active Date Updated:", fullDate);
                }
            });

            weekSlide.appendChild(dayBox);
        }

        weekdaySelector.appendChild(weekSlide);
    }
}

// DOM 로드 이후 초기화
document.addEventListener("DOMContentLoaded", () => {
    const activeDateElement = document.getElementById("active-date");
    const activeDate = activeDateElement ? activeDateElement.value : null;

    generateWeekdays(activeDate);

    const links = document.querySelectorAll(".video-preview-link");
    links.forEach(link => {
        link.addEventListener("click", (event) => {
            const selectedDate = activeDateElement ? activeDateElement.value : null;

            // 날짜가 선택되지 않았으면 경고 표시
            if (!selectedDate || selectedDate.trim() === "") {
                alert("날짜를 선택해주세요.");
                event.preventDefault();
                return;
            }

            try {
                // 기존 href 가져오기
                const href = link.getAttribute("href");
                const url = new URL(href, window.location.origin);

                // 기존 `selectedDate` 제거 및 새로운 값 추가
                url.searchParams.delete("selectedDate");
                url.searchParams.append("selectedDate", selectedDate);

                // 갱신된 href를 설정
                link.setAttribute("href", url.toString());
                console.log("Updated href:", url.toString());
            } catch (error) {
                console.error("Invalid URL format:", error);
                alert("잘못된 요청입니다. URL을 확인하세요.");
                event.preventDefault();
            }
        });
    });

    // Swiper.js 초기화
    new Swiper(".swiper-container", {
        slidesPerView: 1,
        spaceBetween: 10,
        allowTouchMove: true,
        centeredSlides: true,
    });
});
