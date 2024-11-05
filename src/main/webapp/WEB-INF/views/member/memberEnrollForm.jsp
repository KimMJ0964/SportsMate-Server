<%--
  Created by IntelliJ IDEA.
  User: jun
  Date: 2024. 11. 5.
  Time: 12:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member/memberEnrollForm.css">
    <script
            src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/member/memberEnrollForm.js"></script>
    <title>Title</title>
</head>
<body>
    <div class="wrap">
        <div id="login-wrap">
            <form action="login.me" class="login-form">
                <div class="user-profile-wrap">
                    <img src="${pageContext.request.contextPath}/resources/images/user_default_profile.png" alt="" id="profileImg">
                    <input type="file" name="userProfile" id="userProfile" style="display: none">

                </div>
                <div class="input-wrap">
                    <span class="form-title">이메일</span> <br>
                    <input type="email" name="email" placeholder="이메일을 입력해주세요.">
                </div>
                <div class="input-wrap">
                    <span class="form-title">비밀번호</span><br>
                    <input type="password" name="pwd" placeholder="비밀번호를 입력해주세요.">
                </div>
                <div class="input-wrap">
                    <span class="form-title">비밀번호 확인</span><br>
                    <input type="password" name="pwdCheck" placeholder="비밀번호를 한 번 더 입력해주세요.">
                </div>
                <div class="input-wrap">
                    <span class="form-title">이름</span><br>
                    <input type="text" name="userName" placeholder="이름을 입력해주세요.">
                </div>
                <div class="input-wrap">
                    <span class="form-title">성별</span><br>
<%--                    <input type="text" name="userName" placeholder="이름을 입력해주세요.">--%>
                    <select name="gender" id="">
                        <option disabled hidden selected>성별</option>
                        <option value="male">남자</option>
                        <option value="female">여자</option>
                    </select>
                </div>
                <div class="input-wrap">
                    <span class="form-title">생년월일</span><br>
                    <div class="birth-wrap">
                        <div class="year-wrap">
                            <select name="" id="year"></select>
                        </div>
                        <div class="month-wrap">
                            <select name="" id="month"></select>
                        </div>
                        <div class="day-wrap">
                            <select name="" id="day"></select>
                        </div>
                    </div>
                </div>
                <div class="split-bar"></div>
                <div class="input-wrap">
                    <div class="category-checkBox-wrap">
                        <div class="category-checkBox">
                            <input type="checkbox" name="category" id="soccer" value="soccer">
                            <label for="soccer">축구</label>
                        </div>
                        <div class="category-checkBox">
                            <input type="checkbox" name="category" id="futsal" value="futsal">
                            <label for="futsal">풋살</label>
                        </div>
                        <div class="category-checkBox">
                            <input type="checkbox" name="category" id="basketball" value="basketball">
                            <label for="basketball">농구</label>
                        </div>
                        <div class="category-checkBox">
                            <input type="checkbox" name="category" id="baseball" value="baseball">
                            <label for="baseball">야구</label>
                        </div>
                    </div>
                </div>
                    <span class="category-name">축구</span><br>
                <div class="input-wrap">
                    <span class="form-title">포지션</span><br>
                    <select name="soccerPosition" id="soccerPosition">
                        <option value="LWF">LWF</option>
                        <option value="ST">ST</option>
                        <option value="RWF">RWF</option>
                        <option value="LM">LM</option>
                        <option value="CM">CM</option>
                        <option value="RM">RM</option>
                        <option value="LB">LB</option>
                        <option value="CB">CB</option>
                        <option value="RB">RB</option>
                        <option value="GK">GK</option>
                    </select>
                </div>
                <div class="input-wrap">
                    <span class="category-name">풋살</span><br><br>
                    <span class="form-title">포지션</span><br>
                    <select name="futsalPosition" id="futsalPosition">
                        <option value="ST">ST</option>
                        <option value="DF">DF</option>
                        <option value="GK">GK</option>
                    </select>
                </div>


                <input type="checkbox" name="saveId" id="saveId"> 이메일 저장
                <div class="submit-btn">
                    <button type="submit">로그인</button>
                </div>
                <div class="find-info-wrap">
                    <div class="find-info">
                        <a href="#">아이디/비밀번호 찾기</a>
                    </div>
                    <div class="enroll-member">
                        <a href="enrollSelect.me">회원가입</a>
                    </div>
                </div>
                <div class="split-bar"></div>
            </form>
        </div>
    </div>
</body>
</html>
