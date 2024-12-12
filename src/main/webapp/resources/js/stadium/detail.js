const currentDate2 = document.querySelector(".current-date-2"),
      daysTag2 = document.querySelector(".days-2"),
      prevNextIcon2 = document.querySelectorAll("#prev-2, #next-2");

let date2 = new Date(),
    currYear2 = date2.getFullYear(),
    currMonth2 = date2.getMonth();

const months2 = [  
    "1월", "2월", "3월", "4월", "5월", "6월",
    "7월", "8월", "9월", "10월", "11월", "12월"
];

let selectedDateElement = null; // 현재 선택된 날짜를 추적

const renderCalendar2 = () => {
    let firstDayofMonth2 = new Date(currYear2, currMonth2, 1).getDay(),
        lastDateofMonth2 = new Date(currYear2, currMonth2 + 1, 0).getDate(),
        lastDayofMonth2 = new Date(currYear2, currMonth2, lastDateofMonth2).getDay(),
        lastDateofLastMonth2 = new Date(currYear2, currMonth2, 0).getDate();
    
    let liTag2 = "";

    // 이전 달 날짜
    for (let i = firstDayofMonth2; i > 0; i--) {
        liTag2 += `<li class="inactive-2">${lastDateofLastMonth2 - i + 1}</li>`;
    }

    // 현재 달 날짜
    for (let i = 1; i <= lastDateofMonth2; i++) {
        let isPast2 = currYear2 === date2.getFullYear() && currMonth2 === date2.getMonth() && i < date2.getDate() ? "past-2" : "";
        let dayOfWeek2 = new Date(currYear2, currMonth2, i).getDay();
        let isSaturday2 = !isPast2 && dayOfWeek2 === 6 ? "saturday-2" : ""; 
        let isSunday2 = !isPast2 && dayOfWeek2 === 0 ? "sunday-2" : ""; 
        liTag2 += `<li class="${isPast2} ${isSaturday2} ${isSunday2}" data-date="${currYear2}-${(currMonth2 + 1).toString().padStart(2, "0")}-${i.toString().padStart(2, "0")}">${i}</li>`;
    }

    // 다음 달 날짜
    for (let i = lastDayofMonth2; i < 6; i++) {
        liTag2 += `<li class="inactive-2">${i - lastDayofMonth2 + 1}</li>`;
    }

    currentDate2.innerText = `${currYear2} ${months2[currMonth2]}`;
    daysTag2.innerHTML = liTag2;

    // 날짜 클릭 이벤트 추가
    document.querySelectorAll(".days-2 li").forEach(day => {
        if (!day.classList.contains("past-2") && !day.classList.contains("inactive-2")) {
            day.addEventListener("click", () => {
                const selectedDate2 = day.dataset.date;

                // 기존 선택된 날짜 스타일 제거
                if (selectedDateElement) {
                    selectedDateElement.classList.remove("active-2");
                }

                // 새 선택된 날짜 스타일 추가
                day.classList.add("active-2");
                selectedDateElement = day;

                // 선택된 날짜 값을 hidden input에 저장
                const hiddenInput2 = document.getElementById("hidden-selected-date-2"); 
                if (hiddenInput2) {
                    hiddenInput2.value = selectedDate2;
                }
            });
        }
    });
};

renderCalendar2();

prevNextIcon2.forEach(icon => {
    icon.addEventListener("click", () => {
        currMonth2 = icon.id === "prev-2" ? currMonth2 - 1 : currMonth2 + 1;

        if (currMonth2 < 0) {
            currMonth2 = 11;
            currYear2 -= 1;
        }

        if (currMonth2 > 11) {
            currMonth2 = 0;
            currYear2 += 1;
        }

        renderCalendar2();
    });
});

$(document).ready(function () {
    // 시간 데이터를 HH:mm:ss 형식으로 변환하는 함수
    function formatTimeToSeconds(time) {
        if (time && time.length === 5) {
            return time + ":00"; // "19:00" → "19:00:00"
        }
        return time; // 이미 "HH:mm:ss" 형식이면 그대로 반환
    }

    $('#start-time, #end-time').change(function () {
        const selectedDate = $('#hidden-selected-date-2').val();
        const startTime = formatTimeToSeconds($('#start-time').val());
        const endTime = formatTimeToSeconds($('#end-time').val());
        const stadiumNo = $('#stadium-id').val(); // 경기장 ID

        if (selectedDate && startTime && endTime) {
            $.ajax({
                url: '/SportsMate/stadium/teams', // AJAX 요청 경로
                method: 'POST',
                contentType: 'application/json', // JSON 요청
                data: JSON.stringify({
                    accessDate: selectedDate,
                    startTime: startTime,
                    endTime: endTime,
                    stadiumNo: stadiumNo
                }),
                success: function (response) {
				    console.log(response);
				
				    // 응답의 ajaxstatus가 'XXXXY'인 경우 처리
				    if (response.ajaxstatus === 'XXXXY') {
				        console.log("성공");
				        console.log("response : "+response);
						console.log("팀번호 : "+response.teamANo);
				
				
				        // 응답 데이터를 HTML 요소로 업데이트
				        const teamName = response.teamName || "팀 이름 없음";
				        const score = response.score || "0";
				        const teamPoint = response.teamPoint || "0";
				        const teamANo =response.teamANo;
				        console.log("teamANo : " + teamANo);
				
				        $('.pending-matches').html(`
				            <div class="team-info">
				                <p><strong>팀 이름:</strong> ${teamName}</p>
				                <p><strong>평점:</strong> ${score}</p>
				                <p><strong>팀 점수:</strong> ${teamPoint}</p>
				            </div>
				        `);
						$('#ajax').html(`						    
							<input type="hidden" name="teamBNo" value=""> <!-- B팀 번호 -->
					      	<input type="hidden" name="matchNo" value=""> <!-- 매치 번호 -->	
					      	`);			
						 // Hidden Input 값 설정
							// Hidden Input 값 설정
							const currentTeamANo = $('input[type=hidden][name=teamANo]').val(); // 기존 teamANo 값을 가져옴
							$('input[type=hidden][name=teamBNo]').val(currentTeamANo); // teamBNo에 기존 teamANo 값 설정
							$('input[type=hidden][name=teamANo]').val(teamANo);
							$('input[type=hidden][name=matchNo]').val(response.matchNo); 
				
				    } else {
				        // 성공은 했지만 데이터가 없는 경우 처리
				        console.log("성공은 했는데 데이터가 없습니다.");
				        $('.pending-matches').html(`
				            <div class="team-info">
				                <p class="text-muted">현재 대기중인 매치가 없습니다.</p>
				            </div>
				        `);
				    }
				    
			       
				},

                error: function (xhr, status, error) {
                    console.error("AJAX 요청 오류 발생:");
                    console.error("응답 내용: ", xhr.responseText);
                    console.error("HTTP 상태 코드: ", xhr.status);
                    console.error("에러 메시지: ", error);
                }
            });
        } else {
            console.warn("선택된 날짜, 시작 시간, 종료 시간이 유효하지 않습니다.");
        }
    });
});
