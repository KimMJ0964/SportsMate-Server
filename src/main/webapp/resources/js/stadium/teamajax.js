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
                contentType: 'application/json', // JSON 요청
                data: JSON.stringify({
                    accessDate: selectedDate,
                    startTime: startTime,
                    endTime: endTime,
                    stadiumNo: stadiumNo
                }),
                success: function (response) {
                    const matchNoInput = $("input[name='matchNo']");
                    const teamANoInput = $("input[name='teamANo']");
                    const teamBNoInput = $("input[name='teamBNo']");
                    const teamNoInput = $("input[name='teamNo']"); // 현재 로그인된 팀 번호

                    if (response.length > 0) {
                        // 매치가 존재할 경우: 서버에서 A팀 번호와 매치 번호를 가져옴
                        matchNoInput.val(response[0].matchNo); // 매치 번호 설정
                        teamANoInput.val(response[0].teamANo); // A팀 번호 설정
                        teamBNoInput.val(teamNoInput.val()); // 현재 로그인 팀을 B팀으로 설정
                    } else {
                        // 매치가 없을 경우 기본값 설정
                        matchNoInput.val(0); // 매치 번호 초기화
                        teamANoInput.val(0); // A팀 번호 초기화
                        teamBNoInput.val(teamNoInput.val()); // B팀 번호는 현재 로그인된 팀 번호
                    }

                    // 디버깅: Hidden Input 값 확인
                    console.log("Hidden Input 설정 완료:", {
                        matchNo: matchNoInput.val(),
                        teamANo: teamANoInput.val(),
                        teamBNo: teamBNoInput.val(),
                    });
                },
                error: function (xhr, status, error) {
                    console.error("AJAX 요청 오류 발생:");
                    console.error("응답 내용: ", xhr.responseText);
                    console.error("HTTP 상태 코드: ", xhr.status);
                    console.error("에러 메시지: ", error);
                }
            });
        } else {
            console.warn("선택된 날짜, 시작 시간, 종료 시간이 유효하지 않습니다.");
        }
    });
});
