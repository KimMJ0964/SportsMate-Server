
function openModal(reservationNo) {
    document.getElementById('reservationNo').value = reservationNo; // 예약 번호 설정
    document.getElementById('modal').style.display = 'block'; // 모달 표시
}

function closeModal() {
    document.getElementById('modal').style.display = 'none'; // 모달 숨김
}

// 환불 처리
function submitRefund(event) {
    event.preventDefault(); // 기본 폼 제출 방지
    const form = document.getElementById('refundForm');
    const formData = new FormData(form);

    fetch(form.action, {
        method: 'POST',
        body: formData,
    })
        .then(response => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then(data => {
            if (data.success) {
                alert("환불처리 되었습니다.");
                closeModal(); 
                const reservationNo = formData.get('reservationNo');
                const elementToRemove = document.querySelector(`[data-reservation-no="${reservationNo}"]`);
                if (elementToRemove) {
                    elementToRemove.remove();
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