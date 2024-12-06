// 요일 이름 배열
const daysOfWeek = ["일", "월", "화", "수", "목", "금", "토"];

// 요일과 날짜를 생성하는 함수
function generateWeekdays(activeDate) {
    const today = new Date(); // 현재 날짜 가져오기
    const startOfWeek = new Date(today); // 이부 주 시작일 계산
    startOfWeek.setDate(today.getDate() - today.getDay()); // 이번 주 첫 번째 요일(일요일)로 설정

    const weekdaySelector = document.getElementById("weekdaySelector"); // 슬라이드 컨테이너 요소 가져오기

    for (let week = 0; week < 2; week++) { // 총 2주치 데이터를 생성
        for (let i = 0; i < 7; i++) { // 7일씩 반복
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
            
			// 슬라이드 개별 요소 생성
            const dayBox = document.createElement("div");
	      	dayBox.className = `swiper-slide ${fullDate === activeDate ? "active" : ""}`; // 활성화된 날짜 강조
	      	dayBox.innerHTML = `
	        	<span class="date ${isSaturday ? 'std' : isSunday ? 'sd' : ''}">${date}</span>
	        	<span class="day ${isSaturday ? 'std' : isSunday ? 'sd' : ''}">${day}</span>
	      	`;

			// 클릭 이벤트 추가 (활성화 상태 변경)
            dayBox.addEventListener("click", () => toggleDay(dayBox));

      		// 슬라이드 컨테이너에 추가
      		weekdaySelector.appendChild(dayBox);
		}
	}
}

// 날짜 선택 시 활성화 상태를 변경하는 함수
function toggleDay(element) {
  const activeClass = "active"; // 활성화 클래스 이름
  const allBoxes = document.querySelectorAll(".swiper-slide"); // 모든 슬라이드 가져오기
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

  // Swiper.js 초기화
  new Swiper(".swiper-container", {
    slidesPerView: 7, // 한 화면에 보여질 슬라이드 수
    spaceBetween: 10, // 슬라이드 간 간격 (px 단위)
    navigation: {
      nextEl: ".swiper-button-next", // 다음 슬라이드 버튼
      prevEl: ".swiper-button-prev", // 이전 슬라이드 버튼
    },
    breakpoints: {
      640: {
        slidesPerView: 5, // 작은 화면에서는 슬라이드 5개만 표시
      },
      768: {
        slidesPerView: 7, // 큰 화면에서는 슬라이드 7개 표시
      },
    },
  });
});
