// 요일 이름 배열
const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];

// 요일과 날짜를 생성하는 함수
function generateWeekdays(activeDate) {
  const today = new Date(); // 현재 날짜 가져오기
  const startOfWeek = new Date(today); // 이번 주 시작일 계산
  startOfWeek.setDate(today.getDate() - today.getDay()); // 이번 주 첫 번째 요일(일요일)로 설정

  const weekdaySelector = document.getElementById("weekdaySelector"); // 슬라이드 컨테이너 요소 가져오기
  weekdaySelector.innerHTML = ""; // 기존 내용 초기화

  for (let week = 0; week < 2; week++) { // 총 2주치 데이터를 생성
    const weekSlide = document.createElement("div"); // 주 단위 슬라이드 생성
    weekSlide.className = "swiper-slide"; // Swiper 슬라이드 클래스 추가

    for (let i = 0; i < 7; i++) { // 각 주의 7일씩 생성
      const dayDate = new Date(startOfWeek); // 날짜 생성
      dayDate.setDate(startOfWeek.getDate() + i + week * 7); // 해당 주의 특정 날짜 계산

      const fullDate = `${dayDate.getFullYear()}-${(dayDate.getMonth() + 1)
        .toString()
        .padStart(2, "0")}-${dayDate
        .getDate()
        .toString()
        .padStart(2, "0")}`; // yyyy-mm-dd 형식으로 날짜 포맷

      const date = dayDate.getDate(); // 날짜 (1~31)
      const day = daysOfWeek[dayDate.getDay()]; // 요일 이름
      const isSaturday = dayDate.getDay() === 6; // 토요일 여부
      const isSunday = dayDate.getDay() === 0; // 일요일 여부

      // 개별 날짜 요소 생성
      const dayBox = document.createElement("div");
      dayBox.className = `day-box ${fullDate === activeDate ? "active" : ""}`; // 활성화된 날짜 강조
      dayBox.innerHTML = `
        <span class="date ${isSaturday ? 'std' : isSunday ? 'sd' : ''}">${date}</span>
        <span class="day ${isSaturday ? 'std' : isSunday ? 'sd' : ''}">${day}</span>
      `;

      // 클릭 이벤트 추가 (활성화 상태 변경)
      dayBox.addEventListener("click", () => toggleDay(dayBox));

      weekSlide.appendChild(dayBox); // 주 단위 슬라이드에 날짜 추가
    }

    weekdaySelector.appendChild(weekSlide); // Swiper Wrapper에 주 단위 슬라이드 추가
  }
}

// 날짜 선택 시 활성화 상태를 변경하는 함수
function toggleDay(element) {
  const activeClass = "active"; // 활성화 클래스 이름
  const allBoxes = document.querySelectorAll(".day-box"); // 모든 날짜 박스 가져오기
  allBoxes.forEach(box => box.classList.remove(activeClass)); // 기존 활성화 상태 초기화
  element.classList.add(activeClass); // 선택한 날짜 활성화

  // 선택한 날짜 정보 가져오기
  const date = element.querySelector(".date").innerText; // 날짜 텍스트
  const day = element.querySelector(".day").innerText; // 요일 텍스트
  const today = new Date();
  const year = today.getFullYear(); // 현재 연도
  const month = String(today.getMonth() + 1).padStart(2, '0'); // 현재 월 (01~12)

  // 선택된 날짜를 특정 형식으로 조합 (예: 2024.12.06.수)
  const selectedDate = `${year}.${month}.${date}.${day}`;

  // 선택된 날짜를 링크에 추가 (예: href에 selectedDate 파라미터 추가)
  const links = document.querySelectorAll(".video-priview a"); // 링크 요소 가져오기
  links.forEach(link => {
    const href = link.getAttribute("href"); // 기존 href 값 가져오기
    const newHref = `${href}&selectedDate=${encodeURIComponent(selectedDate)}`; // 선택된 날짜 추가
    link.setAttribute("href", newHref); // 새 href 설정
  });

  console.log("날짜가 링크에 추가됨:", selectedDate); // 디버깅 로그
}

// DOM 로드 이후 초기화
document.addEventListener("DOMContentLoaded", () => {
  const activeDateElement = document.getElementById("active-date"); // 활성화된 날짜 요소
  const activeDate = activeDateElement ? activeDateElement.value : null; // 활성화된 날짜 값 가져오기

  generateWeekdays(activeDate); // 날짜 생성 함수 호출

  // Swiper.js 초기화 (1주씩 표시)
  new Swiper(".swiper-container", {
    slidesPerView: 1, // 한 번에 한 주만 표시
    spaceBetween: 10, // 슬라이드 간 간격
    allowTouchMove: true, // 터치 및 드래그 활성화
    centeredSlides: true, // 슬라이드를 정렬하지 않고 자연스럽게
  });
});
