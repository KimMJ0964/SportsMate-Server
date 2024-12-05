document.addEventListener("DOMContentLoaded", () => {
    const modal = document.getElementById("subscription");

    modal.addEventListener("show.bs.modal", () => {
        const startTimeSelect = document.querySelector("#start-time");
        const endTimeSelect = document.querySelector("#end-time");

        // DOM 요소 존재 여부 확인
        if (!startTimeSelect || !endTimeSelect) {
            console.error("시작 시간 또는 종료 시간 select 요소를 찾을 수 없습니다.");
            return;
        }

        // 시간 간격 설정
        const timeIntervals = {
            soccer: 2,
            풋살: 2,
            야구: 3,
            농구: 1,
        };

        const stadiumCategory = document.getElementById("stadium-info").dataset.stadiumCategory;
        console.log("Stadium Category:", stadiumCategory);

        const interval = timeIntervals[stadiumCategory] || 2; // 기본값 2시간

        // 기존 옵션 초기화
        startTimeSelect.textContent = "";
        endTimeSelect.textContent = "";

        // 시작 시간 생성
        const defaultOptionStart = document.createElement("option");
        defaultOptionStart.value = "";
        defaultOptionStart.textContent = "--시작 시간 선택--";
        startTimeSelect.appendChild(defaultOptionStart);

        for (let hour = 6; hour < 24; hour++) {
            const option = document.createElement("option");
            const formattedHour = hour.toString().padStart(2, "0"); // 2자리 형식으로 변환
            option.value = `${formattedHour}:00`; // "06:00" 형식으로 설정
            option.textContent = `${formattedHour}:00`;
            startTimeSelect.appendChild(option);
        }

        // 끝 시간 초기화 및 생성
        const defaultOptionEnd = document.createElement("option");
        defaultOptionEnd.value = "";
        defaultOptionEnd.textContent = "--끝 시간 선택--";
        endTimeSelect.appendChild(defaultOptionEnd);

        startTimeSelect.addEventListener("change", () => {
            const selectedStartHour = parseInt(startTimeSelect.value.split(":")[0], 10);

            // 종료 시간 초기화
            endTimeSelect.textContent = "";
            const defaultOptionEnd = document.createElement("option");
            defaultOptionEnd.value = "";
            defaultOptionEnd.textContent = "--끝 시간 선택--";
            endTimeSelect.appendChild(defaultOptionEnd);

            if (!isNaN(selectedStartHour)) {
                const calculatedEndHour = selectedStartHour + interval;
                if (calculatedEndHour <= 24) {
                    const formattedEndHour = calculatedEndHour.toString().padStart(2, "0"); // 2자리 형식으로 변환
                    const endOption = document.createElement("option");
                    endOption.value = `${formattedEndHour}:00`; // "08:00" 형식으로 설정
                    endOption.textContent = `${formattedEndHour}:00`;
                    endTimeSelect.appendChild(endOption);
                } else {
                    console.warn("종료 시간이 24시를 초과합니다.");
                }
            }
        });
    });
});
