$(document).ready(function () {
    function fetchMatchResults(selectedValue) {
        $('.main-content-record').empty();
        
        $.ajax({
            url: 'mainRegionMatch.mn',
            type: 'POST',
            data: { activityArea: selectedValue },
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
                                        <p>${match.teamAName}</p>
                                    </div>
                                    <div class="record-score">
                                        <h5>${match.scoreA}:${match.scoreB}</h5>
                                    </div>
                                    <div class="team-B">
                                        <p>${match.teamBName}</p>
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

    // 드롭다운 메뉴 변경 시 실행
    $('#activityArea').change(function () {
        var selectedValue = $(this).val();
        fetchMatchResults(selectedValue);
    });

    // 페이지 로드 시 기본 값으로 실행
    var initialValue = $('#activityArea').val(); // 기본 선택 값
    fetchMatchResults(initialValue);
});