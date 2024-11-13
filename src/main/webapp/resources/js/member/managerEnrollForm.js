$(document).ready(function () {
    // 종목 체크박스 클릭 시 해당 체크박스 외 나머지 체크 해제
    $(`input[type="checkbox"][name="category"]`).on('click', function() {
        checkToRadio($(this));
    });

    // 전체 동의 체크박스 클릭 시
    $('#entire-agreement').on('change', function() {
        toggleAllTerms(this);
        toggleSubmit();
    });

    // 개별 약관 체크박스 클릭 시 전체 동의 체크 상태 업데이트
    $('#terms-of-use, #privacy-agreement').on('change', function() {
        updateEntireAgreementStatus();
        toggleSubmit();
    });

    setDateSelectBox(); // 연도 selectBox option 추가

});

// 클릭된 체크박스를 제외하고 모든 체크박스를 해제
const checkToRadio = (checkbox) => {
    // 클릭된 체크박스를 제외하고 다른 모든 체크박스를 해제
    $(`input[type="checkbox"][name="category"]`).not(checkbox).prop('checked', false);
    // 클릭된 체크박스의 상태를 유지
    checkbox.prop('checked', true);
};

const setDateSelectBox = () =>{
    let now = new Date();
    let now_year = now.getFullYear();

    $("#year").append("<option disabled hidden selected>1999 년</option>");
    $("#month").append("<option disabled hidden selected>01 월</option>");
    $("#day").append("<option disabled hidden selected>01 일</option>");

    for(var i = now_year; i >= 1950; i--){
        $("#year").append("<option value='"+ i +"'>"+ i + " 년" +"</option>");
    }
    for (var i = 1; i <= 12; i++){
        $("#month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
    }
    for (var i = 1; i <= 31; i++){
        $("#day").append("<option value='" + i + "'>" + i + " 일" + "</option>");
    }
};

// 전체 동의 체크박스 클릭 시 개별 체크박스 상태 변경
const toggleAllTerms = (checkbox) => {
    const isChecked = $(checkbox).prop('checked');
    $('#terms-of-use').prop('checked', isChecked);
    $('#privacy-agreement').prop('checked', isChecked);
};

// 개별 약관 체크박스 클릭 시 전체 동의 체크 상태 업데이트
const updateEntireAgreementStatus = () => {
    const allChecked = $('#terms-of-use').prop('checked') && $('#privacy-agreement').prop('checked');
    $('#entire-agreement').prop('checked', allChecked);
};

// 제출 버튼 활성화/비활성화
const toggleSubmit = () => {
    const allChecked = $('#terms-of-use').prop('checked') && $('#privacy-agreement').prop('checked');
    const submitBtn = $('button[type="submit"]');
    submitBtn.prop('disabled', !allChecked); // 둘 다 체크되면 활성화, 아니면 비활성화
    if(submitBtn.prop('disabled')){
        submitBtn.prop('class','none-clickable');
    }else{
        submitBtn.prop('class','clickable');
    }
};
