let eventFlag;  // 전역 변수로 선언하여 이벤트 지연을 처리합니다.
let isEmailValid = false;
let areTermsChecked = false;
let isPasswordConfirmed = false;
let isPasswordConditionMet = false;
$(document).ready(function () {
    toggleSubmit();
    $('#profileImg').on('click', profileUpload);
    setDateSelectBox();

    // 종목 체크박스 클릭 시 해당 info div 표시/숨김 처리
    $('input[type="checkbox"][name="category"]').on('change', function () {
        toggleInfoDisplay(this);
    });

    // 전체 동의 체크박스 클릭 시
    $('#entire-agreement').on('change', function () {
        toggleAllTerms(this);
        toggleSubmit();
    });

    // 개별 약관 체크박스 클릭 시 전체 동의 체크 상태 업데이트
    $('#terms-of-use, #privacy-agreement').on('change', function () {
        updateEntireAgreementStatus();
        toggleSubmit();
    });

    // 이메일 중복 확인
    $('.enroll-form input[name=memEmail]').on('keyup', emailCheck);

    // 비밀번호 조건 확인
    $('input[name="memPwd"]').on('keyup', checkPasswordCondition);

    // 비밀번호 일치 확인
    $('input[name="pwdCheck"]').on('focusout', checkPwd);
});



const profileUpload = () => {
    $('#userProfile').click();
    $('#userProfile').on('change', profileUpdate);
};

const profileUpdate = (ev) => {
    const file = ev.target.files[0];
    if (file) {
        const imgUrl = URL.createObjectURL(file);
        $('#profileImg').attr('src', imgUrl);
        $('#profileImg').on('load', () => URL.revokeObjectURL(imgUrl));
    }
};

const setDateSelectBox = () => {
    let now = new Date();
    let now_year = now.getFullYear();

    $("#year").append("<option disabled hidden selected>xxxx년</option>");
    $("#month").append("<option disabled hidden selected>xx월</option>");
    $("#day").append("<option disabled hidden selected>xx일</option>");

    for (var i = now_year; i >= 1950; i--) {
        $("#year").append("<option value='" + i + "'>" + i + " 년" + "</option>");
    }
    for (var i = 1; i <= 12; i++) {
        $("#month").append("<option value='" + i + "'>" + i + " 월" + "</option>");
    }
    for (var i = 1; i <= 31; i++) {
        $("#day").append("<option value='" + i + "'>" + i + " 일" + "</option>");
    }
};

const toggleInfoDisplay = (checkbox) => {
    const infoDiv = $('#' + checkbox.id + '-info');
    if (checkbox.checked) {
        infoDiv.show();
    } else {
        infoDiv.hide();
    }
};

const toggleAllTerms = (checkbox) => {
    areTermsChecked = $(checkbox).prop('checked');
    $('#terms-of-use, #privacy-agreement').prop('checked', areTermsChecked);
    toggleSubmit();
};

const updateEntireAgreementStatus = () => {
    areTermsChecked = $('#terms-of-use').prop('checked') && $('#privacy-agreement').prop('checked');
    $('#entire-agreement').prop('checked', areTermsChecked);
    toggleSubmit();
};

const toggleSubmit = () => {
    const submitBtn = $('#submitBtn');
    const isFormValid = isEmailValid && areTermsChecked && isPasswordConfirmed && isPasswordConditionMet;

    console.log("Form Valid:", isFormValid);  // 상태 로그
    console.log("Submit Button:", submitBtn); // 버튼 참조 로그
    // isFormValid 조건에 따라 버튼의 disabled 상태와 클래스를 업데이트합니다.
    submitBtn.prop('disabled', !isFormValid);

    if (isFormValid) {
        submitBtn.addClass('clickable').removeClass('none-clickable');
    } else {
        submitBtn.addClass('none-clickable').removeClass('clickable');
    }
};

const checkPwd = () => {
    const pwdEl = document.querySelector("input[name=memPwd]");
    const pwdCheckEl = document.querySelector("input[name=pwdCheck]");
    const checkPwdResult = document.querySelector("#checkPwdResult");
    checkPwdResult.style.display = "block";
    if (pwdEl.value !== pwdCheckEl.value) {
        pwdCheckEl.classList.add("red");
        pwdCheckEl.classList.remove("green");
        isPasswordConfirmed = false;
        checkPwdResult.innerText = "비밀번호가 일치하지 않습니다.";
        checkPwdResult.style.color = "red";
    } else {
        pwdCheckEl.classList.add("green");
        pwdCheckEl.classList.remove("red");
        isPasswordConfirmed = true;
        checkPwdResult.innerText = "비밀번호가 일치합니다.";
        checkPwdResult.style.color = "green";
    }
    toggleSubmit();
};

const checkPasswordCondition = (ev) => {
    clearTimeout(eventFlag);
    const str = ev.target.value;
    const checkPwdConditionEl = document.querySelector("#checkPwdCondition");
    if (str.length >= 1) {
        eventFlag = setTimeout(function () {
            checkPwdConditionEl.style.display = "block";
            const regex = /^[A-Za-z0-9]{6,16}$/;
            if (regex.test(str)) {
                ev.target.classList.add("green");
                ev.target.classList.remove("red");
                isPasswordConditionMet = true;
                checkPwdConditionEl.innerText = "비밀번호가 조건에 만족합니다.";
                checkPwdConditionEl.style.color = "green";
            } else {
                ev.target.classList.add("red");
                ev.target.classList.remove("green");
                isPasswordConditionMet = false;
                checkPwdConditionEl.innerText = "비밀번호가 조건에 만족하지 않습니다.";
                checkPwdConditionEl.style.color = "red";
            }
            toggleSubmit();
        }, 500);
    }
};

 window.onload = function(){
    	const phone = document.querySelector('#modify-phone-num').getAttribute('data-phone');
    	const birth = document.querySelector('#modify-birth-num').getAttribute('data-birth');
    	const add = document.querySelector('#modify-add').getAttribute('data-add');
    	
		const phoneParts = phone.split("-");
		const birthParts = birth.split("-");
		const addParts = add.split(".");
        
        document.getElementById('phone1').value = phoneParts[0];
        document.getElementById('phone2').value = phoneParts[1];
        document.getElementById('phone3').value = phoneParts[2];
        
        document.getElementById('year').value = birthParts[0];
        document.getElementById('month').value = birthParts[1];
        document.getElementById('day').value = birthParts[2];
        
        document.getElementById('baseAdd').value = addParts[0];
        document.getElementById('detailAdd').value = addParts[1];
        
    }
