// 모든 category 요소를 선택
const categories = document.querySelectorAll('.category');

// 각 요소에 클릭 이벤트 추가
categories.forEach(category => {
    category.addEventListener('click', function () { // 일반 함수로 변경
        // 모든 요소에서 'active' 클래스 제거
        categories.forEach(cat => cat.classList.remove('active'));
        // 클릭된 요소에 'active' 클래스 추가
        category.classList.add('active');

        // 선택한 카테고리의 data-value 가져오기
        selectedCategory = category.getAttribute('data-value'); // 'this' 대신 'category'

        console.log(selectedCategory);

        fetchMainRanking(selectedCategory);

        var selectedValue = $('#activityArea').val();

        fetchMatchResults(selectedValue, selectedCategory);
    });
});

$(document).ready(function () {
    fetchMainMatching()
    fetchMainRanking()

    // 드롭다운 메뉴 변경 시 실행
    $('#activityArea').change(function () {
        var selectedValue = $(this).val();
        fetchMatchResults(selectedValue);
    });

    // 페이지 로드 시 기본 값으로 실행
    var initialValue = $('#activityArea').val(); // 기본 선택 값
    fetchMatchResults(initialValue);
});

// 지역 매치
function fetchMatchResults(selectedValue, selectedCategory) {
    $('.main-content-record').empty();

    console.log("지역 : " + selectedValue + " / 종목 : " + selectedCategory)

    $.ajax({
        url: 'mainRegionMatch.mn',
        type: 'POST',
        data: {
            activityArea: selectedValue,
            category: selectedCategory
        },
        success: function (response) {
            console.log('Response:', response);

            if (response.status === 'success') {
                $('#matchResults').empty();

                var matches = response.matches;
                matches.forEach(function (match) {
                    var teamAProfile = match.teamAProfile
                        ? `/SportsMate/resources/images/userProFile/${match.teamAProfile}`
                        : '/SportsMate/resources/images/user_default_profile.png';
                    var teamBProfile = match.teamBProfile
                        ? `/SportsMate/resources/images/userProFile/${match.teamBProfile}`
                        : '/SportsMate/resources/images/user_default_profile.png';

                    var matchHtml = `
                            <div class="team-record">
                                <div class="team-A">
                                    <img src="${teamAProfile}" class="radius-img" alt="">
                                    <p><b>${match.teamAName}</b></p>
                                </div>
                                <div class="record-score">
                                    <h5>${match.scoreA}:${match.scoreB}</h5>
                                </div>
                                <div class="team-B">
                                    <p><b>${match.teamBName}</b></p>
                                    <img src="${teamBProfile}" class="radius-img" alt="">
                                </div>
                            </div>
                    `;

                    $('.main-content-record').append(matchHtml);
                });
            } else {
                console.error('Error:', response.message);
            }
        },
        error: function (xhr, status, error) {
            console.error('Error: ' + error);
        }
    });
}

// 구단 랭킹
function fetchMainRanking(selectedCategory) {  // selectedCategory를 매개변수로 받음
    $('.real-time-rank').empty(); // 기존 내용을 초기화

    $.ajax({
        url: 'mainRanking.mn', // 요청 URL
        type: 'GET',
        data: { category: selectedCategory }, // 선택한 카테고리 값을 서버로 전달
        dataType: 'json', // 서버 응답을 JSON으로 처리
        success: function (response) {
            console.log('Ranking Response:', response);

            // 응답 데이터를 DOM에 추가
            response.forEach(function (team, index) {
                // teamProfile 값 확인 후 이미지 설정
                var teamProfile = team.teamProfile
                    ? `/SportsMate/resources/images/userProFile/${team.teamProfile}`
                    : '/SportsMate/resources/images/user_default_profile.png';

                const rankItem = `
                    <div class="rank-wrap">
                        <div class="rank">${index + 1}</div>
                        <div class="team">
                            <img src="${teamProfile}" alt="Team Profile" class="team-profile">
                            <span class="team-name">${team.teamName}</span>
                        </div>
                        <div class="point-wrap">
                            <div class="point">Point</div>
                            <div class="score">${team.teamPoint}</div>
                        </div>
                    </div>
                    <div class="split-bar"></div>`;

                $('.real-time-rank').append(rankItem);
            });
        },
        error: function (xhr, status, error) {
            console.error('Ranking Error: ' + error);
        }
    });
}

// 매치중인 매치
function fetchMainMatching() {
    $('.tableContainer').empty(); // 기존 내용을 초기화

    $.ajax({
        url: 'mainMatching.mn', // 요청 URL
        type: 'GET',
        dataType: 'json', // 서버 응답을 JSON으로 처리
        success: function (response) {
            console.log('Matching Response:', response);


            response.forEach(function (match) {
                const rankItem = `
                    <div class="table-cell-container">
                        <div class="table-cell time">${match.reservStart} ~ ${match.reservEnd}</div>
                        <div class="table-cell location">${match.stadiumName}</div>
                            <div class="table-cell">
                                <button class="match-btn">매칭하기</button>
                            </div>
                    </div>
                `;
                $('.tableContainer').append(rankItem); // 최종 테이블 행 추가
            });

        },
        error: function (xhr, status, error) {
            console.error('Matching Error: ' + error);
        }
    });
}