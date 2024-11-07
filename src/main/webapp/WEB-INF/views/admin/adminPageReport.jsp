<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>신고관리</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminPageReport.css">

    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
        rel="stylesheet">
</head>

<body>
    <div class="wrap">

        <jsp:include page="/WEB-INF/views/header.jsp" />

        <br>

        <jsp:include page="/WEB-INF/views/nav.jsp" />

        <div class="report-container">
            <div class="headname-container">
                <div class="gamersult-row">
                    <div class="team-info">
                        <img src="${pageContext.request.contextPath}/resources/images/report-match.png"
                            alt="경기 결과 로고" class="gameresult-logo">
                        <div class="team-details">
                            <h4 class="head-name">경기 신고 관리</h4>
                        </div>
                    </div>
                    <div class="checkbox-container">
                    </div>
                </div>
            </div>
        </div>

        <div class="result-container">
            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <form action="">
                            <table>
                                <tr>
                                    <td>
                                        <p><b>경기장:</b> xx경기장</p>
                                    </td>
                                    <td>
                                        <p><b>신고일:</b> 24.01.01</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p><b>신고자:</b> 심판1</p>
                                    </td>
                                    <td>
                                        <p><b>신고대상:</b> 비매너유저1</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <p><b>신고사유:</b> 나쁜사람임</p>
                                    </td>
                                </tr>
                            </table>
                            <div class="report-btns">
                                <button class="cancle-btn">거절</button>
                                <button class="report-btn">승인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <form action="">
                            <table>
                                <tr>
                                    <td>
                                        <p><b>경기장:</b> xx경기장</p>
                                    </td>
                                    <td>
                                        <p><b>신고일:</b> 24.01.01</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p><b>신고자:</b> 심판1</p>
                                    </td>
                                    <td>
                                        <p><b>신고대상:</b> 비매너유저1</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <p><b>신고사유:</b> 나쁜사람임</p>
                                    </td>
                                </tr>
                            </table>
                            <div class="report-btns">
                                <button class="cancle-btn">거절</button>
                                <button class="report-btn">승인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <form action="">
                            <table>
                                <tr>
                                    <td>
                                        <p><b>경기장:</b> xx경기장</p>
                                    </td>
                                    <td>
                                        <p><b>신고일:</b> 24.01.01</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p><b>신고자:</b> 심판1</p>
                                    </td>
                                    <td>
                                        <p><b>신고대상:</b> 비매너유저1</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <p><b>신고사유:</b> 나쁜사람임</p>
                                    </td>
                                </tr>
                            </table>
                            <div class="report-btns">
                                <button class="cancle-btn">거절</button>
                                <button class="report-btn">승인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <form action="">
                            <table>
                                <tr>
                                    <td>
                                        <p><b>경기장:</b> xx경기장</p>
                                    </td>
                                    <td>
                                        <p><b>신고일:</b> 24.01.01</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p><b>신고자:</b> 심판1</p>
                                    </td>
                                    <td>
                                        <p><b>신고대상:</b> 비매너유저1</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <p><b>신고사유:</b> 나쁜사람임</p>
                                    </td>
                                </tr>
                            </table>
                            <div class="report-btns">
                                <button class="cancle-btn">거절</button>
                                <button class="report-btn">승인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="victory-container">
                <div class="victory-row">
                    <div class="team-info">
                        <form action="">
                            <table>
                                <tr>
                                    <td>
                                        <p><b>경기장:</b> xx경기장</p>
                                    </td>
                                    <td>
                                        <p><b>신고일:</b> 24.01.01</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p><b>신고자:</b> 심판1</p>
                                    </td>
                                    <td>
                                        <p><b>신고대상:</b> 비매너유저1</p>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <p><b>신고사유:</b> 나쁜사람임</p>
                                    </td>
                                </tr>
                            </table>
                            <div class="report-btns">
                                <button class="cancle-btn">거절</button>
                                <button class="report-btn">승인</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <!-- 등록 버튼 -->
            <button class="registration-button">뒤로가기</button>
        </div>

        <jsp:include page="/WEB-INF/views/footer.jsp" />
    </div>
</body>

</html>