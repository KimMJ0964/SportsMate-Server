$(document).ready(()=>{
    setDateSelectBox();
})
const setDateSelectBox = () => {
    let now = new Date();
    let now_year = now.getFullYear();

    // 기본값 추가 (value="")로 설정
    $("#year").append('<option value="" disabled hidden selected>xxxx년</option>');
    $("#month").append('<option value="" disabled hidden selected>xx월</option>');
    $("#day").append('<option value="" disabled hidden selected>xx일</option>');

    for (let i = now_year; i >= 1950; i--) {
        $("#year").append(`<option value="${i}">${i} 년</option>`);
    }
    for (let i = 1; i <= 12; i++) {
        $("#month").append(`<option value="${i}">${i} 월</option>`);
    }
    for (let i = 1; i <= 31; i++) {
        $("#day").append(`<option value="${i}">${i} 일</option>`);
    }
};
