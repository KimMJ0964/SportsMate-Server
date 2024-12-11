function openModal(matchNo) {
    document.getElementById('matchNo').value = matchNo; // 예약 번호 설정
    document.getElementById('modal').style.display = 'block'; // 모달 표시
}

function closeModal() {
    document.getElementById('modal').style.display = 'none'; // 모달 숨김
}

// 환불 처리 함수
function submitRefund(event) {
    // 이벤트 기본 동작(폼 제출)을 방지합니다.
    event.preventDefault();

    // 환불 요청을 전송하기 위해 폼 데이터를 가져옵니다.
    const form = document.getElementById('refundForm'); // 환불 요청 폼의 DOM 요소를 가져옴
    const formData = new FormData(form); // 폼 데이터를 FormData 객체로 변환

    // 서버로 POST 요청을 보냅니다.
    fetch(form.action, { // 폼의 `action` 속성을 사용해 요청 URL을 설정
        method: 'POST', // HTTP 메서드를 POST로 설정
        body: formData, // 요청 본문으로 FormData 객체를 전달
    })
        .then(response => {
            // HTTP 응답 상태 코드가 200번대가 아니면 에러를 발생시킵니다.
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json(); // 응답 데이터를 JSON 형식으로 파싱하여 반환
        })
        .then(data => {
            if (data.success) {
                alert("환불처리 되었습니다."); // 환불 성공 알림 표시

                closeModal(); // 모달 창 닫기

                // 서버로부터 성공 응답을 받은 후 해당 예약 항목을 UI에서 제거
                const matchNo = formData.get('matchNo'); // 폼 데이터에서 예약 번호를 가져옴
                const elementToRemove = document.querySelector(`[data-match-no="${matchNo}"]`);
                // 예약 번호와 일치하는 데이터 속성을 가진 DOM 요소를 선택

                if (elementToRemove) {
                    elementToRemove.remove(); // 해당 DOM 요소를 UI에서 제거
                }
            } else {
                alert("환불처리에 실패했습니다.");
            }
        })
        .catch(error => {
            console.error("Error:", error);
            alert("환불처리 중 문제가 발생했습니다.");
        });
}
