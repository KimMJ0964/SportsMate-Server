<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 정보 수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/myPage/myPageModify.css?after">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/default.css">
<style>
</style>
</head>
<body>
	<div class="wrap">
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<br>
		<jsp:include page="/WEB-INF/views/common/nav.jsp" />
		<div id="login-wrap">
			<form action="member_enroll.me" class="enroll-form" method="post"
				enctype="multipart/form-data">
				<div class="user-profile-wrap">
					<img
						src="${pageContext.request.contextPath}/resources/images/user_default_profile.png"
						alt="" id="profileImg"> <input type="file"
						name="userProfile" id="userProfile" style="display: none">
				</div>
				<div class="input-wrap">
					<span class="form-title">이메일</span> <br> <input type="email"
						name="memEmail" placeholder="이메일을 입력해주세요." readonly="readonly">
				</div>
				<div class="input-wrap">
					<span class="form-title">이름</span><br> <input type="text"
						name="memName" placeholder="이름을 입력해주세요." readonly="readonly">
				</div>
				<div class="input-wrap">
					<span class="form-title">성별</span><br> <select
						name="memGender" id="">
						<option disabled hidden selected>성별</option>
						<option value="male">남자</option>
						<option value="female">여자</option>
					</select>
				</div>
				<div class="input-wrap">
					<span class="form-title">생년월일</span><br>
					<div class="birth-wrap">
						<div class="year-wrap">
							<select name="year" id="year"></select>
						</div>
						<div class="month-wrap">
							<select name="month" id="month"></select>
						</div>
						<div class="day-wrap">
							<select name="day" id="day"></select>
						</div>
					</div>
				</div>
				<div class="input-wrap">
					<span class="form-title">핸드폰 번호</span><br>
					<div class="birth-wrap">
						<div class="year-wrap">
							<select name="phone1" id="phone1">
								<option value="010">010</option>
							</select>
						</div>
						<div class="month-wrap">
							<input type="number" name="phone2" id="phone2" maxlength="4">
						</div>
						<div class="day-wrap">
							<input type="number" name="phone3" id="phone3" maxlength="4">
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
							<input type="checkbox" name="category" id="basketball"
								value="basketball"> <label for="basketball">농구</label>
						</div>
						<div class="category-checkBox">
							<input type="checkbox" name="category" id="baseball"
								value="baseball"> <label for="baseball">야구</label>
						</div>
					</div>
				</div>
				<div id="soccer-info">
					<span class="category-name">축구</span><br>
					<div class="input-wrap">
						<span class="form-title">포지션</span><br> <select
							name="soccerPosition" id="soccerPosition">
							<option disabled hidden selected>포지션을 선택해 주세요.</option>
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
						<span class="form-title">실력 수준</span><br> <select
							name="soccerSkill" id="soccerSkill">
							<option disabled hidden selected>실력 수준을 선택해 주세요.</option>
							<option value="pro1">프로1</option>
							<option value="pro2">프로2</option>
							<option value="pro3">프로3</option>
							<option value="semiPro1">세미프로1</option>
							<option value="semiPro2">세미프로2</option>
							<option value="semiPro3">세미프로3</option>
							<option value="amateur1">아마추어1</option>
							<option value="amateur2">아마추어2</option>
							<option value="amateur3">아마추어3</option>
							<option value="beginner1">비기너1</option>
							<option value="beginner2">비기너2</option>
							<option value="beginner3">비기너3</option>
						</select>
						<div class="description-skill-wrap">
							<div>프로 : 고등학교 이상 대학, 프로 선수 실력</div>
							<div>세미프로 : 일반인 중 에이스, 안정적인 벨런스를 가진 실력</div>
							<div>아마추어 : 기본기를 어느정도 갖추고 실전 경험을 쌓는 중</div>
							<div>비기너 : 시작한지 얼마 안돼 서툰 기본기</div>
						</div>
					</div>
					<div class="split-bar"></div>
				</div>
				<div id="futsal-info">
					<span class="category-name">풋살</span><br>
					<div class="input-wrap">
						<span class="form-title">포지션</span><br> <select
							name="futsalPosition" id="futsalPosition">
							<option disabled hidden selected>포지션을 선택해 주세요.</option>
							<option value="ST">ST</option>
							<option value="DF">DF</option>
							<option value="GK">GK</option>
						</select>
					</div>
					<div class="input-wrap">
						<span class="form-title">실력 수준</span><br> <select
							name="futsalSkill" id="futsalSkill">
							<option disabled hidden selected>실력 수준을 선택해 주세요.</option>
							<option value="pro1">프로1</option>
							<option value="pro2">프로2</option>
							<option value="pro3">프로3</option>
							<option value="semiPro1">세미프로1</option>
							<option value="semiPro2">세미프로2</option>
							<option value="semiPro3">세미프로3</option>
							<option value="amateur1">아마추어1</option>
							<option value="amateur2">아마추어2</option>
							<option value="amateur3">아마추어3</option>
							<option value="beginner1">비기너1</option>
							<option value="beginner2">비기너2</option>
							<option value="beginner3">비기너3</option>
						</select>
						<div class="description-skill-wrap">
							<div>프로 : 고등학교 이상 대학, 프로 선수 실력</div>
							<div>세미프로 : 일반인 중 에이스, 안정적인 벨런스를 가진 실력</div>
							<div>아마추어 : 기본기를 어느정도 갖추고 실전 경험을 쌓는 중</div>
							<div>비기너 : 시작한지 얼마 안돼 서툰 기본기</div>
						</div>
					</div>
					<div class="split-bar"></div>
				</div>

				<div id="basketball-info">
					<span class="category-name">농구</span><br>
					<div class="input-wrap">
						<span class="form-title">포지션</span><br> <select
							name="basketballPosition" id="basketballPosition">
							<option disabled hidden selected>포지션을 선택해 주세요.</option>
							<option value="ST">ST</option>
							<option value="DF">DF</option>
							<option value="GK">GK</option>
						</select>
					</div>
					<div class="input-wrap">
						<span class="form-title">실력 수준</span><br> <select
							name="basketballSkill" id="basketballSkill">
							<option disabled hidden selected>실력 수준을 선택해 주세요.</option>
							<option value="pro1">프로1</option>
							<option value="pro2">프로2</option>
							<option value="pro3">프로3</option>
							<option value="semiPro1">세미프로1</option>
							<option value="semiPro2">세미프로2</option>
							<option value="semiPro3">세미프로3</option>
							<option value="amateur1">아마추어1</option>
							<option value="amateur2">아마추어2</option>
							<option value="amateur3">아마추어3</option>
							<option value="beginner1">비기너1</option>
							<option value="beginner2">비기너2</option>
							<option value="beginner3">비기너3</option>
						</select>
						<div class="description-skill-wrap">
							<div>프로 : 고등학교 이상 대학, 프로 선수 실력</div>
							<div>세미프로 : 일반인 중 에이스, 안정적인 벨런스를 가진 실력</div>
							<div>아마추어 : 기본기를 어느정도 갖추고 실전 경험을 쌓는 중</div>
							<div>비기너 : 시작한지 얼마 안돼 서툰 기본기</div>
						</div>
					</div>
					<div class="split-bar"></div>
				</div>

				<div id="baseball-info">
					<span class="category-name">야구</span><br>
					<div class="input-wrap">
						<span class="form-title">포지션</span><br> <select
							name="baseballPosition" id="baseballPosition">
							<option disabled hidden selected>포지션을 선택해 주세요.</option>
							<option value="ST">ST</option>
							<option value="DF">DF</option>
							<option value="GK">GK</option>
						</select>
					</div>
					<div class="input-wrap">
						<span class="form-title">실력 수준</span><br> <select
							name="baseballSkill" id="baseballSkill">
							<option disabled hidden selected>실력 수준을 선택해 주세요.</option>
							<option value="pro1">프로1</option>
							<option value="pro2">프로2</option>
							<option value="pro3">프로3</option>
							<option value="semiPro1">세미프로1</option>
							<option value="semiPro2">세미프로2</option>
							<option value="semiPro3">세미프로3</option>
							<option value="amateur1">아마추어1</option>
							<option value="amateur2">아마추어2</option>
							<option value="amateur3">아마추어3</option>
							<option value="beginner1">비기너1</option>
							<option value="beginner2">비기너2</option>
							<option value="beginner3">비기너3</option>
						</select>
						<div class="description-skill-wrap">
							<div>프로 : 고등학교 이상 대학, 프로 선수 실력</div>
							<div>세미프로 : 일반인 중 에이스, 안정적인 벨런스를 가진 실력</div>
							<div>아마추어 : 기본기를 어느정도 갖추고 실전 경험을 쌓는 중</div>
							<div>비기너 : 시작한지 얼마 안돼 서툰 기본기</div>
						</div>
						<div class="split-bar"></div>
					</div>
				</div>

				<div class="submit-btn">
					<button type="submit">수정 완료</button>
					<div class="pwd-btn" data-bs-toggle="modal" data-bs-target="#modifyPwdModal">비밀번호 변경</div>
					<div class="back-btn">수정 취소</div>
				</div>
			</form>
		</div>
	</div>
	
				<div class="modal fade" id="modifyPwdModal" tabindex="-1" aria-labelledby="voteModalLabel" aria-hidden="true">
				    <div class="modal-dialog">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title" id="voteModalLabel">비밀번호 변경</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <div class="input-wrap">
									<span class="form-title">현재 비밀번호</span> <br> <input type="password"
										name="rePwd" placeholder="현재 비밀번호을 입력해주세요.">
								</div>
								<br>
								<div class="input-wrap">
									<span class="form-title">비밀번호 확인</span> <br> <input type="password"
										name="rePwdCheck" placeholder="현재 비밀번호을 재입력해주세요.">
								</div>
								<br>
								<div class="input-wrap">
									<span class="form-title">비밀번호 변경</span> <br> <input type="password"
										name="rePwdChange" placeholder="변경할 비밀번호을 입력해주세요.">
								</div>
				            </div>
				            <div class="modal-footer">
				                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				                <button type="button" class="btn btn-primary">완료</button>
				            </div>
				        </div>
				    </div>
				</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>