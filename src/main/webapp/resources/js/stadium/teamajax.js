$(document).ready(function () {
    // 시간 데이터를 HH:mm:ss 형식으로 변환하는 함수
    function formatTimeToSeconds(time) {
        if (time && time.length === 5) {
            return time + ":00"; // "19:00" → "19:00:00"
        }
        return time; // 이미 "HH:mm:ss" 형식이면 그대로 반환
    }

    $('#start-time, #end-time').change(function () {
        const selectedDate = $('#hidden-selected-date-2').val();
        const startTime = formatTimeToSeconds($('#start-time').val());
        const endTime = formatTimeToSeconds($('#end-time').val());
        const stadiumNo = $('#stadium-id').val(); // 경기장 ID

        if (selectedDate && startTime && endTime) {
            $.ajax({
                url: '/SportsMate/stadium/teams', // AJAX 요청 경로
                method: 'POST',
                contentType: 'application/json', // 올바른 Content-Type 설정
                data: JSON.stringify({
                    accessDate: selectedDate,
                    startTime: startTime,
                    endTime: endTime,
                    stadiumNo: stadiumNo
                }),
                success: function (response) {
                    const pendingMatchesContainer = $('.pending-matches');
                    pendingMatchesContainer.empty(); // 기존 내용을 초기화

                    if (response.length > 0) {
                        response.forEach(function (team) {
                            const teamHtml = `
                                <div class="team-info">
                                    <p><strong>팀 이름:</strong> ${team.teamName}</p>
                                    <p><strong>평점:</strong> ${team.score}</p>
                                    <p><strong>팀 점수:</strong> ${team.teamPoint}</p>
                                </div>`;
                            pendingMatchesContainer.append(teamHtml);
                        });
                    } else {
                        pendingMatchesContainer.html('<p class="text-muted">현재 대기중인 매치가 없습니다.</p>');
                    }
                },
                error: function (xhr, status, error) {
				    console.error('오류 발생:', xhr.responseText); // 서버 응답 내용을 출력
				    console.error('HTTP 상태 코드:', xhr.status); // HTTP 상태 코드
				    console.error('에러 메시지:', error); // 에러 메시지
				}
            });
        }
    });
});
