document.addEventListener('DOMContentLoaded', () => {
    const applyButton = document.querySelector('.btn-primary'); // 신청하기 버튼
    const form = document.querySelector('.modal-form'); // 신청 폼
    const teamBNoInput = form.querySelector('input[name="teamBNo"]'); // B팀 번호 숨김 필드
    const matchNoInput = form.querySelector('input[name="matchNo"]'); // 매치 번호 숨김 필드

    applyButton.addEventListener('click', () => {
        const matchItem = document.querySelector('.match-item'); // 매치 데이터가 포함된 DOM
        const matchNo = matchItem.getAttribute('data-matchno'); // 매치 번호
        const isBTeam = form.getAttribute('data-teamb'); // B팀 여부 (true/false)

        if (isBTeam === 'true') {
            const teamANo = matchItem.getAttribute('data-teamano'); // A팀 번호 가져오기
            const teamBNo = form.querySelector('input[name="teamANo"]').value; // 현재 로그인한 팀 번호

            teamBNoInput.value = teamBNo; // B팀 번호 설정
            matchNoInput.value = matchNo; // 매치 번호 설정
        } else {
            teamBNoInput.value = ''; // B팀 번호는 비워둠
            matchNoInput.value = matchNo; // A팀 신청도 매치 번호 포함
        }

        // 폼 제출
        form.submit();
    });
});
