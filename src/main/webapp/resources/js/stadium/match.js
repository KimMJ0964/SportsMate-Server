document.addEventListener("DOMContentLoaded", () => {
    // 폼 요소와 hidden input 요소 가져오기
    const form = document.querySelector(".modal-form");
    const teamBNoInput = document.querySelector("input[name='teamBNo']");
    const teamNoInput = document.querySelector("input[name='teamNo']");

    // teamBNo가 없을 경우 기본값 설정
    if (teamBNoInput && !teamBNoInput.value) {
        teamBNoInput.value = 0; // 기본값 0 설정
    }

    // 폼 제출 시 teamBNo 설정 확인 및 수정
    form.addEventListener("submit", (event) => {
        // 현재 로그인한 팀 번호를 teamBNo로 설정 (예: B팀으로 신청)
        if (teamBNoInput && teamNoInput) {
            teamBNoInput.value = teamNoInput.value; // 현재 팀 번호를 teamBNo로 설정
        }
    });
});