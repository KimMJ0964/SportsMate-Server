function addSearch(zipcodeId, baseAddId, detailAddId){
    new daum.Postcode({
        oncomplete: function (data) {
            let addr = ''; // 주소 변수
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.roadAddress;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById(zipcodeId).value = data.zonecode;
            document.getElementById(baseAddId).value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById(detailAddId).focus();
        }
    }).open();
}


function confirmDelete() {
    if (confirm("정말로 구장을 삭제하시겠습니까?")) {
        location.href = "${pageContext.request.contextPath}/stadium_manager/delete";
    }
}

document.addEventListener('DOMContentLoaded', function() {
    const add = document.querySelector('#modify-add').getAttribute('data-add') || '';
    const addParts = add.split(",").map(part => part.trim()); // 공백 제거 추가

    document.getElementById('memberBaseAdd').value = addParts[0] || ''; // 값이 없을 경우 대비
    document.getElementById('memberDetailAdd').value = addParts[1] || ''; // 값이 없을 경우 대비
});



