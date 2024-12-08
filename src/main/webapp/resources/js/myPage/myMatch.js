/**
 * 
 */

window.onload = function() {
    const activeButton = document.querySelector('.sport-btn.active');
    if (activeButton) {
        const category = activeButton.getAttribute('data-category');
        getMyMatchInfo(category);
    }
};

document.querySelectorAll('.sport-btn').forEach(button => {
    button.addEventListener('click', function() {
        document.querySelectorAll('.sport-btn').forEach(btn => btn.classList.remove('active'));
        this.classList.add('active');

        const category = this.getAttribute('data-category');

        getMyMatchInfo(category);
    });
});

let allMatchInfo = [];  // 전체 매치 데이터를 저장할 배열
let currentIndex = 0;   // 현재까지 표시된 데이터의 인덱스

function getMyMatchInfo(category) {
    $.ajax({
        url: 'myMatchInfo.mp',
        type: 'GET',
        data: { category: category },
        success: function(response) {
            console.log("내 전적 : ", response);
            console.log("종목 : " + category);
            allMatchInfo = response;  // 모든 매치 정보를 저장
            currentIndex = 0;         // 초기화, 첫 번째 항목부터 시작
            updateMatchTable();       // 처음 10개 항목 표시
        },
        error: function(error) {
            console.error("에러 :", error);
        }
    });
}

function updateMatchTable() {
    const tableBody = document.getElementById("match-table-body");

    // 한 번에 10개씩만 표시
    const nextMatches = allMatchInfo.slice(currentIndex, currentIndex + 10);

    nextMatches.forEach(mi => {
        const tr = document.createElement("tr");

        if (mi.myScore > mi.enemyScore) {
            tr.style.backgroundColor = "#f2f9ff";
        } else if (mi.myScore < mi.enemyScore) {
            tr.style.backgroundColor = "#fff7f7";
        } else {
            tr.style.backgroundColor = "#f2f2f2";
        }

        tr.innerHTML = `
            <td>${mi.myTeamPoint}</td>
            <td>
                <div class="team-cell">
                    <img src="${mi.myTeamProfile ? '/SportsMate/resources/images/userProFile/' + mi.myTeamProfile : '/SportsMate/resources/images/user_default_profile.png'}" alt="" class="team-logo">
                    <span>${mi.myTeamName}</span>
                </div>
            </td>
            <td><b>${mi.myScore}</b></td>
            <td>VS</td>
            <td><b>${mi.enemyScore}</b></td>
            <td>
                <div class="team-cell">
                    <img src="${mi.enemyTeamProfile ? '/SportsMate/resources/images/userProFile/' + mi.enemyTeamProfile : '/SportsMate/resources/images/user_default_profile.png'}" alt="" class="team-logo">
                    <span>${mi.enemyTeamName}</span>
                </div>
            </td>
            <td>${mi.enemyTeamPoint}</td>
        `;

        tableBody.appendChild(tr);
    });

    currentIndex += 10;  // 10개 항목을 추가했으므로 currentIndex를 10 증가

    // 데이터가 더 이상 없으면 "더 보기" 버튼 숨김
    if (currentIndex >= allMatchInfo.length) {
        document.getElementById('load-more-button').style.display = 'none';
    }
}

// "더 보기" 버튼 클릭 시 호출되는 함수
function loadMoreMatches() {
    updateMatchTable();  // 다음 10개 항목 추가
}