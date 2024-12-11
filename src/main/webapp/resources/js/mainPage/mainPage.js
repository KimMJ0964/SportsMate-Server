// 모든 category 요소를 선택
const categories = document.querySelectorAll('.category');

// 각 요소에 클릭 이벤트 추가
categories.forEach(category => {
    category.addEventListener('click', function () { // 일반 함수로 변경
        // 모든 요소에서 'active' 클래스 제거
        categories.forEach(cat => cat.classList.remove('active'));
        // 클릭된 요소에 'active' 클래스 추가
        category.classList.add('active');

        // 선택한 카테고리의 data-value 가져오기
        selectedCategory = category.getAttribute('data-value'); // 'this' 대신 'category'

        console.log(selectedCategory);

        fetchMainRanking(selectedCategory);

        var selectedValue = $('#activityArea').val();

        fetchMatchResults(selectedValue, selectedCategory);

        fetchMainMatching(selectedCategory);
    });
});

$(document).ready(function () {
    fetchMainMatching()
    fetchMainRanking()

    // 드롭다운 메뉴 변경 시 실행
    $('#activityArea').change(function () {
        var selectedValue = $(this).val();
        fetchMatchResults(selectedValue);
    });

    // 페이지 로드 시 기본 값으로 실행
    var initialValue = $('#activityArea').val(); // 기본 선택 값
    fetchMatchResults(initialValue);
});

// 지역 매치
function fetchMatchResults(selectedValue, selectedCategory) {
    $('.main-content-record').empty();

    console.log("지역 : " + selectedValue + " / 종목 : " + selectedCategory)

    $.ajax({
        url: 'mainRegionMatch.mn',
        type: 'POST',
        data: {
            activityArea: selectedValue,
            category: selectedCategory
        },
        success: function (response) {
            console.log('Response:', response);

            if (response.status === 'success') {
                $('#matchResults').empty();

                var matches = response.matches;
                matches.forEach(function (match) {
                    var teamAProfile = match.teamAProfile
                        ? `/SportsMate/resources/images/userProFile/${match.teamAProfile}`
                        : '/SportsMate/resources/images/user_default_profile.png';
                    var teamBProfile = match.teamBProfile
                        ? `/SportsMate/resources/images/userProFile/${match.teamBProfile}`
                        : '/SportsMate/resources/images/user_default_profile.png';

                    var matchHtml = `
                            <div class="team-record">
                                <div class="team-A">
                                    <img src="${teamAProfile}" class="radius-img" alt="">
                                    <div class="team-record-name"><b>${match.teamAName}</b></div>
                                </div>
                                <div class="record-score">
                                    <h5>${match.scoreA} : ${match.scoreB}</h5>
                                </div>
                                <div class="team-B">
                                    <div class="team-record-name"><b>${match.teamBName}</b></div>
                                    <img src="${teamBProfile}" class="radius-img" alt="">
                                </div>
                            </div>
                    `;

                    $('.main-content-record').append(matchHtml);
                });
            } else {
                console.error('Error:', response.message);
            }
        },
        error: function (xhr, status, error) {
            console.error('Error: ' + error);
        }
    });
}

// 구단 랭킹
function fetchMainRanking(selectedCategory) {  // selectedCategory를 매개변수로 받음
    $('.real-time-rank').empty(); // 기존 내용을 초기화

    $.ajax({
        url: 'mainRanking.mn', // 요청 URL
        type: 'GET',
        data: { category: selectedCategory }, // 선택한 카테고리 값을 서버로 전달
        dataType: 'json', // 서버 응답을 JSON으로 처리
        success: function (response) {
            console.log('Ranking Response:', response);

            // 응답 데이터를 DOM에 추가
            response.forEach(function (team, index) {
                // teamProfile 값 확인 후 이미지 설정
                var teamProfile = team.teamProfile
                    ? `/SportsMate/resources/images/userProFile/${team.teamProfile}`
                    : '/SportsMate/resources/images/user_default_profile.png';

                const rankItem = `
                    <div class="rank-wrap">
                        <div class="rank">${index + 1}</div>
                        <div class="team">
                            <img src="${teamProfile}" alt="Team Profile" class="team-profile">
                            <span class="team-name">${team.teamName}</span>
                        </div>
                        <div class="point-wrap">
                            <div class="point">Point</div>
                            <div class="score">${team.teamPoint}</div>
                        </div>
                    </div>
                    <div class="split-bar"></div>`;

                $('.real-time-rank').append(rankItem);
            });
        },
        error: function (xhr, status, error) {
            console.error('Ranking Error: ' + error);
        }
    });
}

// 매치중인 매치
// 활동 지역 값 변경 시 콘솔 출력
const regionSelect = document.getElementById("activityAreaTwo");
const startTimeSelect = document.querySelector(".mt-starttime");
const endTimeSelect = document.querySelector(".mt-endtime");

// 활동 지역 값 변경 시 fetchMainMatching 호출
regionSelect.addEventListener("change", () => {
    fetchMainMatching();
});

// 시작 시간 값 변경 시 fetchMainMatching 호출
startTimeSelect.addEventListener("change", () => {
    fetchMainMatching();
});

// 종료 시간 값 변경 시 fetchMainMatching 호출
endTimeSelect.addEventListener("change", () => {
    fetchMainMatching();
});

function fetchMainMatching(selectedCategory) {
    $('.tableContainer').empty(); // 기존 내용을 초기화
    console.log("선택된 지역:", selectedCategory);
    console.log("선택된 지역:", regionSelect.value);
    console.log("시작 시간:", startTimeSelect.value);
    console.log("종료 시간:", endTimeSelect.value);
    console.log("선택 날짜:", selectedDate);

    $.ajax({
        url: 'mainMatching.mn', // 요청 URL
        type: 'GET',
        data: { category: selectedCategory,
                region: regionSelect.value,
                starttime: startTimeSelect.value,
                endtime: endTimeSelect.value,
                date: selectedDate
         },
        dataType: 'json', // 서버 응답을 JSON으로 처리
        success: function (response) {
            console.log('Matching Response:', response);
            response.forEach(function (match) {
                const rankItem = `
                    <div class="table-cell-container">
                        <div class="table-cell time">${match.reservStart} ~ ${match.reservEnd}</div>
                        <div class="table-cell location">${match.stadiumName}</div>
                            <div class="table-cell">
                                <button class="match-btn" onclick="location.href = 'detail.st?stadiumNo=${match.stadiumNo}&selectedDate=${selectedDate}'">매칭하기</button>
                            </div>
                    </div>
                    <hr class="table-rank-hr">
                `;
                $('.tableContainer').append(rankItem); // 최종 테이블 행 추가
            });

        },
        error: function (xhr, status, error) {
            console.error('Matching Error: ' + error);
        }
    });
}

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
let selectedDate = ""; // 전역 변수로 선언

// 오늘 날짜를 가져와 selectedDate에 설정
const today = new Date();

// 날짜 형식을 "yyyy-MM-dd" 형식으로 변경
selectedDate = today.toISOString().split('T')[0];

function toggleDay(element) {
  const activeClass = "active";
  const allBoxes = document.querySelectorAll(".day-box");
  allBoxes.forEach(box => box.classList.remove(activeClass));
  element.classList.add(activeClass);

  const date = element.querySelector(".date").innerText;
  const day = element.querySelector(".day").innerText;
  const today = new Date();
  const year = today.getFullYear();
  const month = String(today.getMonth() + 1).padStart(2, '0');

  // 선택된 날짜를 전역 변수에 저장
  selectedDate = `${year}.${month}.${date}`;

  const links = document.querySelectorAll(".video-priview a");
  links.forEach(link => {
    const href = link.getAttribute("href");
    const newHref = `${href}&selectedDate=${encodeURIComponent(selectedDate)}`;
    link.setAttribute("href", newHref);
  });

  console.log("날짜가 링크에 추가됨:", selectedDate);

  fetchMainMatching();
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
