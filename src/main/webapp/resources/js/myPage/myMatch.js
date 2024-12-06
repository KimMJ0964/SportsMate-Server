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

function getMyMatchInfo(category) {
    const urlParams = new URL(location.href).searchParams;

    const page = urlParams.get('page');

    console.log("페이지 : " + page)
    $.ajax({
        url: 'myMatchInfo.mp',
        type: 'GET',
        data: { category: category,
            page: page
         },
        success: function(response) {
            console.log("내 전적 : ", response);
            console.log("종목 : " + category);
            updateMatchTable(response);
        },
        error: function(error) {
            console.error("에러 :", error);
        }
    });
}

function updateMatchTable(matchInfo) {
    const tableBody = document.getElementById("match-table-body");
    tableBody.innerHTML = '';  // 테이블 초기화

    matchInfo.forEach(mi => {
        // tr 요소 생성
        const tr = document.createElement("tr");
        
        if (mi.myScore > mi.enemyScore) {
            tr.style.backgroundColor = "#f2f9ff";
        } else if (mi.myScore < mi.enemyScore) {
            tr.style.backgroundColor = "#fff7f7";
        } else {
            tr.style.backgroundColor = "#f2f2f2";
        }

        // 각 td 요소 생성
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
        
        // tbody에 tr 추가
        tableBody.appendChild(tr);
    });
}
