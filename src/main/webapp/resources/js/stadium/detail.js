// 서버에서 종목 데이터 가져오기 (예제 데이터 사용)
const fetchSportsData = async () => {
    // 예제 종목 데이터 (DB에서 가져오는 시뮬레이션)
    return ["축구", "풋살", "야구", "농구"];
};

// 종목별 시간 데이터 매핑
const timeDataMapping = {
    "축구": ["10:00", "12:00", "14:00", "16:00"],
    "풋살": ["09:00", "11:00", "13:00", "15:00"],
    "야구": ["08:00", "10:30", "13:30", "17:30"],
    "농구": ["07:00", "09:00", "11:00", "13:00"]
};

// 종목별 시간 간격 생성
const createTimeIntervals = (times) => {
    const intervals = [];
    for (let i = 0; i < times.length - 1; i++) {
        intervals.push(`${times[i]} - ${times[i + 1]}`);
    }
    return intervals;
};

// DOM 요소
const timeSelect = document.getElementById("time-options");
const selectedSportElement = document.getElementById("selected-sport");

// 특정 종목에 대한 시간 옵션 로드
const loadTimeOptions = async (selectedSport) => {
    try {
        // 선택된 종목에 해당하는 시간 데이터 가져오기
        const times = timeDataMapping[selectedSport] || [];
        
        // 시간 간격 생성
        const intervals = createTimeIntervals(times);

        // 기존 옵션 초기화
        timeSelect.innerHTML = '<option value="">--시간 선택--</option>';

        // 시간 간격으로 옵션 추가
        intervals.forEach((interval) => {
            const option = document.createElement("option");
            option.value = interval;
            option.textContent = interval;
            timeSelect.appendChild(option);
        });
    } catch (error) {
        console.error("시간 데이터를 로드하는 중 오류 발생:", error);
    }
};

// 페이지 로드 시 종목 선택 및 시간 데이터 로드
const init = async () => {
    try {
        // 종목 데이터 가져오기 (예: 서버에서 선택된 종목을 받아오는 로직)
        const sportsData = await fetchSportsData();

        // 첫 번째 종목 선택 (예제에서는 '축구'가 선택된 상태로 설정)
        const selectedSport = sportsData[0];

        // 선택된 종목 표시
        selectedSportElement.textContent = selectedSport;

        // 시간 옵션 로드
        await loadTimeOptions(selectedSport);
    } catch (error) {
        console.error("초기화 중 오류 발생:", error);
    }
};

// 초기화 함수 실행
document.addEventListener("DOMContentLoaded", init);
