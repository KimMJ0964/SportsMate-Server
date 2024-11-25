function updateResults() {
    // 각 선택 요소의 값을 가져옵니다.
    const stadiumAddress = document.querySelector('.mt-region').value;
    const stadiumStartTime = document.querySelector('.mt-starttime').value;
    const stadiumEndTime = document.querySelector('.mt-endtime').value;

    // AJAX 요청
    fetch('searchStadium.st', {
        method: 'POST', // POST 요청을 사용합니다.
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: new URLSearchParams({
            stadiumAddress: stadiumAddress,
            stadiumStartTime: stadiumStartTime,
            stadiumEndTime: stadiumEndTime
        })
    })
        .then(response => response.text()) // 서버에서 응답받은 HTML
        .then(data => {
            // 결과를 표시할 영역 업데이트
            const resultContainer = document.querySelector('.video-grid');
            resultContainer.innerHTML = data;
        })
        .catch(error => console.error('Error:', error));
}
