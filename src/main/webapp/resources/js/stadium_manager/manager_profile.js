document.addEventListener("DOMContentLoaded", function() {
    // 연도 추가 (1900년부터 현재 연도까지)
    const yearSelect = document.getElementById("birth-year");
    const currentYear = new Date().getFullYear();
    for (let year = currentYear; year >= 1900; year--) {
        const option = document.createElement("option");
        option.value = year;
        option.text = `${year}년`;
        yearSelect.appendChild(option);
    }

    // 월 추가 (1월부터 12월까지)
    const monthSelect = document.getElementById("birth-month");
    for (let month = 1; month <= 12; month++) {
        const option = document.createElement("option");
        option.value = month;
        option.text = `${month}월`;
        monthSelect.appendChild(option);
    }

    // 일 추가 (1일부터 31일까지)
    const daySelect = document.getElementById("birth-day");
    for (let day = 1; day <= 31; day++) {
        const option = document.createElement("option");
        option.value = day;
        option.text = `${day}일`;
        daySelect.appendChild(option);
    }
});