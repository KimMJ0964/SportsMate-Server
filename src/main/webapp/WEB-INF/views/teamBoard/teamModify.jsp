<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/team/TeamEnrollForm.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"
	integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
	crossorigin="anonymous"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/teamBoard/teamModify.js"></script>
<title>SportsMate - 구단 창설</title>
</head>
<body>
	<div class="wrap">
		<jsp:include page="../common/header.jsp" />
		<div id="enroll-wrap">
			<form action="teamInfoModify.tm" class="enroll-form" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="tno" value="${teamInfo.teamNo}">
				<div class="user-profile-wrap">
					<img
						src="${pageContext.request.contextPath}/resources/images/user_default_profile.png"
						alt="" id="profileImg"> <input type="file"
						name="userProfile" id="userProfile" style="display: none">
				</div>
				<div class="input-wrap">
					<span class="form-title">구단명</span><br> <input type="text"
						name="teamName" value="${teamInfo.teamName }"
						placeholder="구단명을 입력해주세요." readonly="readonly">
				</div>
				<div class="input-wrap">
					<span class="form-title">활동 요일</span>
					<div class="day-select-wrap">
						<c:choose>
							<c:when test="${teamInfo.monday.toString() == 'Y'}">
								<div class="day-box selected" data-day="monday">월</div>
							</c:when>
							<c:otherwise>
								<div class="day-box" data-day="monday">월</div>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${teamInfo.tuesday.toString() == 'Y'}">
								<div class="day-box selected" data-day="tuesday">화</div>
							</c:when>
							<c:otherwise>
								<div class="day-box" data-day="tuesday">화</div>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${teamInfo.wednesday.toString() == 'Y'}">
								<div class="day-box selected" data-day="wednesday">수</div>
							</c:when>
							<c:otherwise>
								<div class="day-box" data-day="wednesday">수</div>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${teamInfo.thursday.toString() == 'Y'}">
								<div class="day-box selected" data-day="thursday">목</div>
							</c:when>
							<c:otherwise>
								<div class="day-box" data-day="thursday">목</div>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${teamInfo.friday.toString() == 'Y'}">
								<div class="day-box selected" data-day="friday">금</div>
							</c:when>
							<c:otherwise>
								<div class="day-box" data-day="friday">금</div>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${teamInfo.saturday.toString() == 'Y'}">
								<div class="day-box selected" data-day="saturday">토</div>
							</c:when>
							<c:otherwise>
								<div class="day-box" data-day="saturday">토</div>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${teamInfo.sunday.toString() == 'Y'}">
								<div class="day-box selected" data-day="sunday">일</div>
							</c:when>
							<c:otherwise>
								<div class="day-box" data-day="sunday">일</div>
							</c:otherwise>
						</c:choose>
					</div>
					<input type="hidden" name="activityDays" id="activityDays">
				</div>
				<div class="input-wrap">
					<span class="form-title">활동 시간대</span>
					<div class="day-select-wrap">
						
						<c:choose>
							<c:when test="${teamInfo.activityTime.toString() == 'morning'}">
								<div class="time-box selected" data-time="morning">
									<span class="time-label">아침</span> <span class="time-range">06
										~ 10시</span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="time-box" data-time="morning">
									<span class="time-label">아침</span> <span class="time-range">06
										~ 10시</span>
								</div>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${teamInfo.activityTime.toString() == 'day'}">
								<div class="time-box selected" data-time="day">
									<span class="time-label">낮</span> <span class="time-range">10
										~ 18시</span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="time-box" data-time="day">
									<span class="time-label">낮</span> <span class="time-range">10
										~ 18시</span>
								</div>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${teamInfo.activityTime.toString() == 'evening'}">
								<div class="time-box selected" data-time="evening">
									<span class="time-label">저녁</span> <span class="time-range">18
										~ 24시</span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="time-box" data-time="evening">
									<span class="time-label">저녁</span> <span class="time-range">18
										~ 24시</span>
								</div>
							</c:otherwise>
						</c:choose>
						
						<c:choose>
							<c:when test="${teamInfo.activityTime.toString() == 'midnight'}">
								<div class="time-box selected" data-time="midnight">
									<span class="time-label">심야</span> <span class="time-range">24
										~ 06시</span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="time-box" data-time="morning">
									<span class="time-label">심야</span> <span class="time-range">24
										~ 06시</span>
								</div>
							</c:otherwise>
						</c:choose>
						
					</div>
					<input type="hidden" name="activityTime">
				</div>
				<div class="input-wrap">
					<span class="form-title">활동 지역</span><br> <select
						name="activityArea" id="activityArea" data-region="${teamInfo.activityArea}">
						<option disabled hidden selected>활동 지역을 선택하세요.</option>
						<option value="000-001">서울시 강남구</option>
						<option value="000-002">서울시 강북구</option>
						<option value="000-003">서울시 종로구</option>
						<option value="000-004">서울시 중구</option>
						<option value="000-005">서울시 용산구</option>
						<option value="000-006">서울시 성동구</option>
						<option value="000-007">서울시 광진구</option>
						<option value="000-008">서울시 동대문구</option>
						<option value="000-009">서울시 중랑구</option>
						<option value="000-010">서울시 성북구</option>
						<option value="000-011">서울시 도봉구</option>
						<option value="000-012">서울시 노원구</option>
						<option value="000-013">서울시 노원구</option>
						<option value="000-014">서울시 은평구</option>
						<option value="000-015">서울시 서대문구</option>
						<option value="000-016">서울시 마포구</option>
						<option value="000-017">서울시 양천구</option>
						<option value="000-018">서울시 구로구</option>
						<option value="000-019">서울시 금천구</option>
						<option value="000-020">서울시 영등포구</option>
						<option value="000-021">서울시 동작구</option>
						<option value="000-022">서울시 관악구</option>
						<option value="000-023">서울시 서초구</option>
						<option value="000-024">서울시 송파구</option>
						<option value="000-025">서울시 강동구</option>
					</select>
				</div>
				<div class="input-wrap">
					<span class="form-title">구단 정원</span><br> <select
						name="teamMaxPerson" id="teamMaxPerson" data-person="${teamInfo.teamMaxPerson}" required>
					</select>
				</div>
				<span class="form-title">모집여부</span><br>
				<input type="checkbox" id="application" name="application" style="width: 40px; height: 40px;"
				    <c:choose>
				        <c:when test="${teamInfo.application == 'Y'}">
				            checked
				        </c:when>
				        <c:otherwise>
				        </c:otherwise>
				    </c:choose>>
				
				<div class="input-wrap">
					<span class="form-title">구단 소개</span><br>
					<textarea name="teamDescription" id="teamDescription" cols="50"
						rows="10" placeholder="구단 소개글을 입력하세요." style="resize: none">${teamInfo.teamDescription }</textarea>
				</div>
				<div class="submit-btn">
					<button type="submit" id="submit-btn">수정 완료</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
