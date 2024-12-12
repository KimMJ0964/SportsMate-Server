document.addEventListener("DOMContentLoaded", () => {
    // 폼 요소와 hidden input 요소 가져오기
    const form = document.querySelector(".modal-form");
    const matchNoInput = document.querySelector("input[name='matchNo']");
    const teamBNoInput = document.querySelector("input[name='teamBNo']");
    const teamNoInput = document.querySelector("input[name='teamNo']");

    // 기본값 설정: matchNo와 teamBNo가 비어있으면 기본값 0으로 설정
    if (matchNoInput && !matchNoInput.value) {
        matchNoInput.value = 0; // matchNo 기본값 0 설정
    }

    if (teamBNoInput && !teamBNoInput.value) {
        teamBNoInput.value = 0; // teamBNo 기본값 0 설정
    }

    // 폼 제출 시 teamBNo 및 matchNo 설정 확인 및 수정
    form.addEventListener("submit", (event) => {
        // 현재 로그인한 팀 번호를 teamBNo로 설정 (예: B팀으로 신청)
        if (teamBNoInput && teamNoInput) {
            teamBNoInput.value = teamNoInput.value; // 현재 팀 번호를 teamBNo로 설정
        }

        // 디버깅: 제출 데이터 확인
        console.log("폼 제출 데이터:", {
            matchNo: matchNoInput.value,
            teamBNo: teamBNoInput.value,
        });
    });
});
