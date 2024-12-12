function openModal(memNo) {
    // 모달 창을 열기 - 'modalOverlay' 요소의 display 속성을 'flex'로 설정하여 보이게 함
    // document.getElementById('modalOverlay').style.display = 'flex';

}
// 경고 등록 이벤트 리스너
const requestWarning = ()=>{
    const memNo = $('input[type=hidden][name=memNo]').val();
    const pnReporter = $('input[type=hidden][name=pnReporter]').val();
    const pnGround = $('input[type=hidden][name=pnGround]').val();
    const pnContent = $('textarea[name=pnContent]').val();
    let data = {
        memNo,
        pnReporter,
        pnGround,
        pnContent,
    }
    // AJAX 호출
    insertPenalty(data,(res)=>{
        if(res === "XXXXY"){
            alert("경고 등록 성공");
            $('button[class=btn-close]').click();
            $(`button[data-memNo="${memNo}"]`).prop("disabled", true);
            $(`button[data-memNo="${memNo}"]`).removeClass("expose");
            $(`button[data-memNo="${memNo}"]`).addClass("disabled");
            $('#reason-for-report').val('');
        }else{
            alert("경고 등록 실패! 다시 시도하세요.");
        }
    })
}
const insertPenalty =(data, callback) =>{
    $.ajax({
        url: "warning_reason.gp",
        method: "POST",
        data,
        success: (res) =>callback(res),
        error:()=> console.log("경고 AJAX 요청 실패")
    })
}
const warningBtnClick = (event) =>{
        // Find the closest 'tr' ancestor of the clicked button
        const trElement = event.target.closest('tr');

        // Get data-memNo and the first td value
        const memNo = trElement.querySelector('.star-container.skill').getAttribute('data-memNo');
        const playerName = trElement.querySelector('td').textContent.trim();

        // Update the modal inputs
        const modal = document.getElementById('warningModal');
        modal.querySelector('input[name="memNo"]').value = memNo;
        modal.querySelector('#name-input').value = playerName;
}

document.addEventListener("DOMContentLoaded", function () {
    // DOM이 로드된 후 실행

    // 모든 경고 체크박스를 선택하여 warningCheckboxes에 저장
    const warningCheckboxes = document.querySelectorAll(".warning-checkbox");
    // 경고 컨테이너 요소를 선택하여 warningContainer에 저장
    const warningContainer = document.getElementById("warningContainer");

    // 각 경고 체크박스에 change 이벤트 리스너를 추가
    warningCheckboxes.forEach((checkbox) => {
        checkbox.addEventListener("change", function () {

            // 체크박스가 선택된 경우에만 모달을 열기
            if (checkbox.checked) {
                openModal();
            }

            // 모든 체크박스 중 하나라도 선택된 것이 있는지 확인
            const isChecked = Array.from(warningCheckboxes).some(cb => cb.checked);

            // 하나라도 선택된 것이 있으면 warningContainer를 표시, 없으면 숨김
            warningContainer.style.display = isChecked ? "block" : "none";
        });
    });
});


// 별점 평가 기능 - 반별 선택 가능
document.querySelectorAll('.star-container').forEach(container => {
    // 각 별점 컨테이너 안의 모든 별 요소를 선택하여 stars에 저장
    const stars = container.querySelectorAll('.star');

    // 별의 채우기 상태를 업데이트하는 함수
    function updateStars(rating) {
        // 각 별에 대해 클래스 제거 후, 현재 rating에 맞춰 'full' 또는 'half' 클래스 추가
        stars.forEach(star => {
            star.classList.remove('full', 'half'); // 초기화
            const starValue = parseFloat(star.getAttribute('data-value')); // 별의 값
            if (starValue <= rating) {
                star.classList.add('full'); // rating보다 작거나 같으면 전체 채움
            } else if (starValue - 0.5 === rating) {
                star.classList.add('half'); // 반별로 채움
            }
        });
    }

    // 마우스를 별 위로 올렸을 때 이벤트 처리
    container.addEventListener('mouseover', function (event) {
        const star = event.target.closest('.star'); // 마우스가 위치한 별 요소 선택
        if (star) {
            const rect = star.getBoundingClientRect(); // 별 요소의 위치와 크기 정보
            const isHalf = (event.clientX - rect.left) < (rect.width / 2); // 마우스가 별의 절반을 넘었는지 확인
            const rating = parseFloat(star.getAttribute('data-value')) - (isHalf ? 0.5 : 0); // rating을 반별로 계산
            updateStars(rating); // 해당 rating에 맞춰 별 업데이트
        }
    });

    // 별을 클릭하여 rating을 설정
    container.addEventListener('click', function (event) {
        const star = event.target.closest('.star'); // 클릭한 별 요소
        if (star) {
            const rect = star.getBoundingClientRect(); // 별 요소의 위치와 크기 정보
            const isHalf = (event.clientX - rect.left) < (rect.width / 2); // 마우스가 별의 절반을 넘었는지 확인
            const rating = parseFloat(star.getAttribute('data-value')) - (isHalf ? 0.5 : 0); // rating을 반별로 계산
            container.setAttribute('data-rating', rating); // 별점 컨테이너에 현재 rating을 저장
            updateStars(rating); // 별 업데이트
        }
    });

    // 마우스가 별점 영역을 벗어났을 때 이벤트 처리
    container.addEventListener('mouseleave', function () {
        const rating = parseFloat(container.getAttribute('data-rating')) || 0; // 저장된 rating 값이 없으면 0으로 설정
        updateStars(rating); // rating에 따라 별 업데이트
    });
});

const getRating = () => {
    const memArr = document.querySelectorAll('.star-container'); // 모든 star-container 요소 선택
    const memData = []; // 결과를 저장할 객체 배열
    const result = {};
    memArr.forEach(element => {
        const memNo = element.getAttribute('data-memNo'); // data-memNo 값을 가져옴
        const rating = element.getAttribute('data-rating'); // data-rating 값을 가져옴
        const teamNo = element.getAttribute('data-teamNo'); // data-teamNo 값을 가져옴
        const isSkill = element.classList.contains('skill'); // skill인지 확인
        const isManner = element.classList.contains('manner'); // manner인지 확인

        // 배열에서 해당 memNo 객체를 찾기
        let memObj = memData.find(item => item.memNo === memNo);

        if (!memObj) {
            // 해당 memNo 객체가 없으면 새로 추가
            memObj = {memNo: memNo, teamNo: teamNo, skill: null, manner: null};
            memData.push(memObj);
        }

        // skill 또는 manner 값 설정
        if (isSkill) {
            memObj.skill = rating;
        } else if (isManner) {
            memObj.manner = rating;
        }
    });
    const teamANo = $('input[type=hidden][name=teamANo]').val();
    const teamBNo = $('input[type=hidden][name=teamBNo]').val();
    const matchNo = $('input[type=hidden][name=matchNo]').val();
    const teamAScore = $('#team-a-checkbox').val();
    const teamBScore = $('#team-b-checkbox').val();
    console.log()
    console.log(memData); // 결과 출력
    result.ratings = memData;
    result.teamScore = {
        matchNo: matchNo,
        teamANo: teamANo,
        teamAScore: teamAScore,
        teamBNo: teamBNo,
        teamBScore: teamBScore
    };
    result.matchNo = matchNo;
    console.log(result)
    return result;
};

const clickRegisterBtn = () => {
    setGameResult(getRating(), (res) => {
        if(res === 'XXXXY'){
            alert("경기 결과 등록 성공")
            location.href = 'gamefinish.gp';
        }
    })
}

const setGameResult = (data, callBack) => {
    $.ajax({
        url: "game_result.gp",
        method: "POST",
        data: data,
        contentType: "application/json",
        data: JSON.stringify(data),
        success: (res) => callBack(res),
        error: () => {
            console.log("경기 결과 작성 AJAX 요청 실패");
        }
    })
}
