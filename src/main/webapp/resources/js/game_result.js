document.addEventListener("DOMContentLoaded", function() {
    // 모든 경고 체크박스 선택
    const warningCheckboxes = document.querySelectorAll(".warning-checkbox");
    const warningContainer = document.getElementById("warningContainer");

    warningCheckboxes.forEach((checkbox) => {
        checkbox.addEventListener("change", function() {
            // 하나라도 체크된 것이 있는지 확인
            const isChecked = Array.from(warningCheckboxes).some(cb => cb.checked);
                
            // 체크된 것이 있으면 표시, 없으면 숨김
            warningContainer.style.display = isChecked ? "block" : "none";
        });
    });
});
