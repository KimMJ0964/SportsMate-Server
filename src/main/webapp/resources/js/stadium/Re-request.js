document.addEventListener("DOMContentLoaded", () => {
    // 선택 변경 시 서버 요청
    const addressSelect = document.querySelector(".mt-region");
    const startTimeSelect = document.querySelector(".mt-starttime");
    const endTimeSelect = document.querySelector(".mt-endtime");

    function sendRequest() {
        const stadiumAddress = addressSelect.value;
        const stadiumStartTime = startTimeSelect.value;
        const stadiumEndTime = endTimeSelect.value;

        // 서버에 요청 (Ajax)
        fetch("/stadium/search", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                stadiumAddress,
                stadiumStartTime,
                stadiumEndTime,
            }),
        })
            .then((response) => response.json())
            .then((data) => {
                updateStadiumList(data); // 결과 처리
            })
            .catch((error) => {
                console.error("Error fetching stadium data:", error);
            });
    }

    function updateStadiumList(data) {
        const videoGrid = document.querySelector(".video-grid");
        videoGrid.innerHTML = ""; // 기존 리스트 초기화

        // 새로운 리스트 추가
        data.forEach((stadium) => {
            const stadiumHtml = `
                <div class="video-priview">
                    <div class="thumbnail-row">
                        <a href="detail.st">
                            <img src="/resources/images/field.png" alt="경기장" class="thumbnail" />
                        </a>
                    </div>
                    <div class="video-info-grid">
                        <div class="video-info">
                            <p class="vider-author">${stadium.stadiumAddress}</p>
                            <p class="vider-title">${stadium.stadiumName}</p>
                            <p class="vider-state">${stadium.stadiumCategory} ${stadium.selectedDate}</p>
                        </div>
                    </div>
                </div>
            `;
            videoGrid.insertAdjacentHTML("beforeend", stadiumHtml);
        });
    }

    // 이벤트 리스너 등록
    addressSelect.addEventListener("change", sendRequest);
    startTimeSelect.addEventListener("change", sendRequest);
    endTimeSelect.addEventListener("change", sendRequest);
});
