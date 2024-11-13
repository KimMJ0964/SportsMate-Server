function saveAndCloseModal() {
    // 입력된 값 가져오기
    const stadiumName = document.getElementById('stadiumName').value;
    const warningDate = document.getElementById('warningDate').value;
    const warningReason = document.getElementById('warningReason').value;

    // 값 출력 (여기서 실제로는 서버로 전송하거나 로컬에 저장할 수 있음)
    console.log('구장명:', stadiumName);
    console.log('경고 일시:', warningDate);
    console.log('경고 사유:', warningReason);

    // 모달 창 닫기
    document.getElementById('modalOverlay').style.display = 'none';

    // 입력 필드 초기화 (선택사항)
    document.getElementById('stadiumName').value = '';
    document.getElementById('warningDate').value = '';
    document.getElementById('warningReason').value = '';
}