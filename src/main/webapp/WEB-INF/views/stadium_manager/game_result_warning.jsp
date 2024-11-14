<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>경기 결과 - 경고 모달폼</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/stadium_manager/game_result_warning.css">

    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
        rel="stylesheet">

</head>
<body>
    <div class="wrap">
        <div class="modal-overlay" id="modalOverlay">
            <div class="warning-container">
                <div class="wnmenu-box">
                    <h2>경고</h2> <br>
                    <h4>구장명</h4> 
                    <input type="text" id="stadiumName" class="warning-input" placeholder="     구장명을 입력해주세요.">

                    <h4>경고 일시</h4>
                    <input type="text" id="warningDate" class="warning-input" placeholder="     20xx년 xx월 xx일">

                    <h4>경고 사유</h4>
                    <input type="text" id="warningReason" class="warning-input2" placeholder="    경고 사유를 입력해주세요.">

                </div>

                <button class="Registration-button" onclick="saveAndCloseModal()">등록하기</button>

            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/resources/js/game_result_warning.js"></script>
</body>
</html>