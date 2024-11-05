$(document).ready(function() {
    $('#profileImg').on('click', profileUpload);
    setDateSelectBox(); // 연도 selectBox option 추가
});
const profileUpload = ()=> {
    $('#userProfile').click();
    $('#userProfile').on('change',profileUpdate);
}
const profileUpdate = (ev) =>{
    const file = ev.target.files[0]; // 선택한 사진 가져오기
    if(file){
        const imgUrl = URL.createObjectURL(file); //  임시 URL을 생성
        $('#profileImg').attr('src',imgUrl); //
        $('#profileImg').on('load',()=> URL.revokeObjectURL(imgUrl)); // 임시 URL 메모리 해제
    }
}
const setDateSelectBox = () =>{
    let now = new Date();
    let now_year = now.getFullYear();

    $("#year").append("<option disabled hidden selected>1999 년</option>");
    $("#month").append("<option disabled hidden selected>01 월</option>")
    $("#day").append("<option disabled hidden selected>01 일</option>")

    // 1950년 부터 올해까지
    for(var i = now_year; i >= 1950; i--){
        $("#year").append("<option value='"+ i +"'>"+ i + " 년" +"</option>");
    }
    for (var i = 1; i<=12; i++){
        $("#month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
    }
    for (var i = 1; i<=31; i++){
        $("#day").append("<option value='" + i + "'>" + i + " 일" + "</option>");
    }
}