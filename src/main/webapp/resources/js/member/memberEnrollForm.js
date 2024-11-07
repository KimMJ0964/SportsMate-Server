$(document).ready(function() {
    $('#profileImg').on('click', profileUpload);
    setDateSelectBox(); // 연도 selectBox option 추가

    // 종목 체크박스 클릭 시 해당 info div 표시/숨김 처리
    $('input[type="checkbox"][name="category"]').on('change', function() {
        toggleInfoDisplay(this);
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
});

const profileUpload = ()=> {
    $('#userProfile').click();
    $('#userProfile').on('change', profileUpdate);
};

const profileUpdate = (ev) =>{
    const file = ev.target.files[0]; // 선택한 사진 가져오기
    if(file){
        const imgUrl = URL.createObjectURL(file); //  임시 URL을 생성
        $('#profileImg').attr('src',imgUrl);
        $('#profileImg').on('load', ()=> URL.revokeObjectURL(imgUrl)); // 임시 URL 메모리 해제
    }
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

// 체크박스 클릭 시 해당 종목의 info div를 표시/숨김
const toggleInfoDisplay = (checkbox) => {
    const infoDiv = $('#' + checkbox.id + '-info');
    if (checkbox.checked) {
        infoDiv.show();
    } else {
        infoDiv.hide();
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
