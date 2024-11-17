$(document).ready(function () {
    // 지역 선택 이벤트 핸들러
    $('#searchArea').on('change', function () {
        selectArea($(this).val());
    });

    // 카테고리 클릭 이벤트 핸들러
    $('.category-wrap span').on('click', function (event) {
        clickCategory(event.target.id);
    });
});

// 지역 선택 시 호출되는 함수
const selectArea = (selectedValue) => {
    const category = $('.category-wrap .highlight').attr('id') || 'all'; // 선택된 category 유지
    const filter = $('select[name="filter"]').val(); // 필터 값 가져오기

    // 서버로 GET 요청 보내기
    const url = `memberRecruit.tm?category=${encodeURIComponent(category)}&searchArea=${encodeURIComponent(selectedValue)}&filter=${encodeURIComponent(filter)}&page=1`;
    window.location.href = url; // 페이지 이동
};

// 팀 상세 페이지로 이동
const clickDetailPate = (teamNo) => {
    const url = `recruit_detail.tm?tno=${teamNo}`;
    window.location.href = url;
};

// 카테고리 클릭 시 호출되는 함수
const clickCategory = (category) => {
    const searchArea = $('#searchArea').val(); // 현재 선택된 searchArea 가져오기
    const filter = $('select[name="filter"]').val(); // 필터 값 가져오기

    // URL 생성
    let url = `memberRecruit.tm?category=${encodeURIComponent(category)}&filter=${encodeURIComponent(filter)}&page=1`;

    // searchArea가 선택된 경우에만 URL에 추가
    if (searchArea) {
        url += `&searchArea=${encodeURIComponent(searchArea)}`;
    }

    window.location.href = url; // 페이지 이동
};

