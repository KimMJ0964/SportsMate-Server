window.onload = function() {
    const activeButton = document.querySelector('.sport-btn.active');
    if (activeButton) {
        const category = activeButton.getAttribute('data-category');
        getMyMatchInfo(category);
    }
};

document.querySelectorAll('.sport-btn').forEach(button => {
    button.addEventListener('click', function() {
        // 기존 활성화된 버튼에서 active 클래스 제거
        document.querySelectorAll('.sport-btn').forEach(btn => btn.classList.remove('active'));
        // 현재 클릭된 버튼에 active 클래스 추가
        this.classList.add('active');

        const category = this.getAttribute('data-category');
        // 새로운 종목을 선택할 때 기존 데이터를 초기화하고 새 데이터를 가져옴
        getMyMatchInfo(category);
    });
});
