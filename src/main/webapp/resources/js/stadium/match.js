document.addEventListener("DOMContentLoaded", () => {
    const startTimeSelect = document.querySelector("#start-time");
    const endTimeSelect = document.querySelector("#end-time");
    const form = document.querySelector(".modal-form");
    const teamBNoInput = document.querySelector("input[name='teamBNo']");
    const teamNoInput = document.querySelector("input[name='teamNo']");
    const matchNoInput = document.querySelector("input[name='matchNo']");

    startTimeSelect.addEventListener("change", handleDateTimeSelection);
    endTimeSelect.addEventListener("change", handleDateTimeSelection);

    // 날짜와 시간 선택을 처리하는 함수
    function handleDateTimeSelection() {
        const selectedDate = document.getElementById("hidden-selected-date-2").value;
        const selectedStartTime = startTimeSelect.value;
        const selectedEndTime = endTimeSelect.value;

        if (selectedStartTime && selectedEndTime && selectedDate) {
            fetchPendingMatches(selectedDate, selectedStartTime, selectedEndTime);
        }
    }

    // 대기중인 매치를 가져오는 함수
    function fetchPendingMatches(selectedDate, selectedStartTime, selectedEndTime) {
        const stadiumNo = document.getElementById("stadium-info").dataset.stadiumNo;

        fetch("/your-endpoint-for-pending-matches", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                stadiumNo: stadiumNo,
                selectedDate: selectedDate,
                startTime: selectedStartTime,
                endTime: selectedEndTime
            })
        })
        .then(response => response.json())
        .then(data => {
            const pendingMatchesContainer = document.querySelector(".pending-matches");

            if (data.matches && data.matches.length > 0) {
                pendingMatchesContainer.innerHTML = data.matches.map(match => `
                    <p><strong>A팀 이름:</strong> ${match.teamName}</p>
                    <p><strong>A팀 평점:</strong> ${match.score}</p>
                    <p><strong>A팀 점수:</strong> ${match.teamPoint}</p>
                    <input type="hidden" name="matchNo" value="${match.matchNo}">
                `).join('');
            } else {
                pendingMatchesContainer.innerHTML = '<p class="text-muted">현재 대기중인 매치가 없습니다.</p>';
            }
        })
        .catch(error => {
            console.error("매치 조회 중 오류 발생:", error);
        });
    }

    // teamBNo가 없을 경우 기본값 설정
    if (teamBNoInput && !teamBNoInput.value) {
        teamBNoInput.value = 0; // 기본값 0 설정 (A팀만 신청 시)
    }

    // 폼 제출 시 teamBNo 설정 확인 및 수정
    form.addEventListener("submit", (event) => {
        // 현재 로그인한 팀 번호를 teamBNo로 설정 (예: B팀으로 신청)
        if (teamBNoInput && teamNoInput) {
            teamBNoInput.value = teamNoInput.value; // 현재 팀 번호를 teamBNo로 설정
        }

        // A팀만 신청할 경우 매치 번호는 0으로 설정
        if (matchNoInput) {
            matchNoInput.value = teamBNoInput.value === "0" ? 0 : data.matchNo; // B팀이 없으면 매치 번호 0으로 설정
        }
    });
});
