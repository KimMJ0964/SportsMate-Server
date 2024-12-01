document.addEventListener("DOMContentLoaded", () => {
    const modal = document.getElementById("subscription");
    const timeOptions = document.getElementById("time-options");

    modal.addEventListener("show.bs.modal", () => {
        const stadiumInfo = document.getElementById("stadium-info");
        const stadiumNo = stadiumInfo.dataset.stadiumNo;
        const stadiumCategory = stadiumInfo.dataset.stadiumCategory;

        console.log("Stadium No:", stadiumNo);
        console.log("Stadium Category:", stadiumCategory);

        // 시간 옵션 생성
        function generateTimeOptions(startHour, endHour, interval) {
            timeOptions.innerHTML = '<option value="">--시간 선택--</option>';
            for (let hour = startHour; hour < endHour; hour += interval) {
                const option = `${hour.toString().padStart(2, "0")}:00 ~ ${(hour + interval).toString().padStart(2, "0")}:00`;
                timeOptions.innerHTML += `<option value="${option}">${option}</option>`;
            }
        }

        if (stadiumCategory === "soccer" || stadiumCategory === "풋살") {
            generateTimeOptions(6, 24, 2);
        } else if (stadiumCategory === "야구") {
            timeOptions.innerHTML = `
                <option value="09:00 ~ 12:00">09:00 ~ 12:00</option>
                <option value="15:00 ~ 18:00">15:00 ~ 18:00</option>
            `;
        } else if (stadiumCategory === "농구") {
            generateTimeOptions(6, 24, 1);
        } else {
            console.warn("알 수 없는 카테고리입니다.");
        }
    });
});
