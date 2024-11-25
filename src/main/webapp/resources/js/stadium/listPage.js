// 요일 이름 배열
const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];

let isDragging = false; // 드래그 상태
let startX = 0; // 드래그 시작 X 좌표
let currentTranslate = 0; // 현재 슬라이드 위치
let prevTranslate = 0; // 이전 슬라이드 위치
let currentIndex = 0; // 현재 슬라이드 인덱스

// 날짜 생성
function generateWeekdays(activeDate) {
    const today = new Date();
    const startOfWeek = new Date(today);
    startOfWeek.setDate(today.getDate() - today.getDay());

    const weekdaySelector = document.getElementById("weekdaySelector");
    weekdaySelector.innerHTML = ""; // 초기화

    for (let week = 0; week < 2; week++) { // 2주일치 데이터 생성
        for (let i = 0; i < 7; i++) {
            const dayDate = new Date(startOfWeek);
            dayDate.setDate(startOfWeek.getDate() + i + week * 7); // 주차별 날짜 계산

            const fullDate = `${dayDate.getFullYear()}-${(dayDate.getMonth() + 1)
                .toString()
                .padStart(2, "0")}-${dayDate
                .getDate()
                .toString()
                .padStart(2, "0")}`;

            const date = dayDate.getDate(); // 날짜 (1~31)
            const day = daysOfWeek[dayDate.getDay()]; // 요일 이름

            const dayBox = document.createElement("div");
            dayBox.className = "day-box";
            if (fullDate === activeDate) {
                dayBox.classList.add("active"); // 서버에서 전달받은 날짜 활성화
            }

            dayBox.setAttribute("onclick", "toggleDay(this)");

            const isSaturday = dayDate.getDay() === 6;
            const isSunday = dayDate.getDay() === 0;

            dayBox.innerHTML = `
                <span class="date ${isSaturday ? 'std' : isSunday ? 'sd' : ''}">${date}</span>
                <span class="day ${isSaturday ? 'std' : isSunday ? 'sd' : ''}">${day}</span>
            `;

            weekdaySelector.appendChild(dayBox);
        }
    }
}

// 슬라이드 시작
function startDrag(event) {
    isDragging = true;
    startX = getPositionX(event);
    weekdaySelector.classList.add("grabbing");
}

// 슬라이드 중
function drag(event) {
    if (!isDragging) return;
    const currentPosition = getPositionX(event);
    currentTranslate = prevTranslate + currentPosition - startX;
    setSliderPosition();
}

// 슬라이드 종료
function endDrag() {
    isDragging = false;
    weekdaySelector.classList.remove("grabbing");

    const sliderWidth = document.querySelector(".weekday-selector").offsetWidth;
    const movedBy = currentTranslate - prevTranslate;

    if (movedBy < -sliderWidth / 4 && currentIndex < 1) {
        currentIndex += 1; // 다음 주로 이동
    }
    if (movedBy > sliderWidth / 4 && currentIndex > 0) {
        currentIndex -= 1; // 이전 주로 이동
    }

    setPositionByIndex();
}

// 슬라이드 위치 설정 함수
function setPositionByIndex() {
    const sliderWidth = document.querySelector(".weekday-selector").offsetWidth;
    currentTranslate = currentIndex * -sliderWidth; // 현재 슬라이드 위치 계산
    prevTranslate = currentTranslate;
    setSliderPosition();
}

// 슬라이드 CSS 위치 설정
function setSliderPosition() {
    const weekdaySelector = document.getElementById("weekdaySelector");
    weekdaySelector.style.transform = `translateX(${currentTranslate}px)`;
}

// 이벤트에서 X 좌표 얻기
function getPositionX(event) {
    return event.type.includes("mouse") ? event.pageX : event.touches[0].clientX;
}

// 클릭 시 활성화/비활성화 상태 변경
function toggleDay(element) {
    const activeClass = "active";
    const allBoxes = document.querySelectorAll(".day-box");
    allBoxes.forEach(box => box.classList.remove(activeClass));
    element.classList.add(activeClass);
}

// 초기화
document.addEventListener("DOMContentLoaded", () => {
    const activeDateElement = document.getElementById("active-date");
    const activeDate = activeDateElement ? activeDateElement.value : null;

    generateWeekdays(activeDate);

    // 슬라이더 초기 위치를 첫 번째 주로 설정
    setPositionByIndex();

    // 슬라이더 이벤트 등록
    const weekdaySelector = document.getElementById("weekdaySelector");

    weekdaySelector.addEventListener("mousedown", startDrag);
    weekdaySelector.addEventListener("mousemove", drag);
    weekdaySelector.addEventListener("mouseup", endDrag);
    weekdaySelector.addEventListener("mouseleave", endDrag);

    weekdaySelector.addEventListener("touchstart", startDrag);
    weekdaySelector.addEventListener("touchmove", drag);
    weekdaySelector.addEventListener("touchend", endDrag);
});
