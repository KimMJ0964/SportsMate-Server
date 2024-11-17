<%--
  Created by IntelliJ IDEA.
  User: jun
  Date: 2024. 11. 15.
  Time: 01:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/team/memberRecruitList.css">
    <title>SportsMate - 단원 모집</title>
</head>
<body>
    <div class="wrap">
        <jsp:include page="../common/header.jsp" />
        <jsp:include page="../common/nav.jsp" />
        <div class="recruit-list-wrap">
            <div id="title">단원모집</div>
            <div class="category-wrap">
                <span class="soccer">축구</span>
                <span class="futsal">풋살</span>
                <span class="basketball">농구</span>
                <span class="baseball">야구</span>
            </div>
            <div class="filter-wrap">
                <select name="searchArea" id="searchArea">
                    <option value="" disabled hidden selected>지역선택</option>
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
                <select name="filter" id="">
                    <option value="latest">최신순</option>
                </select>
            </div>
            <div class="list-wrap">
                <div class="content-wrap" onclick="location.href = 'recruit_detail.tm'">
                    <div class="team-logo-wrap">
                        <img src="${pageContext.request.contextPath}/resources/images/team1.png" alt="">
                    </div>
                    <div class="team-info-wrap">
                        <p>우리동네 FC</p>
                        <p class="memberCount"><img src="${pageContext.request.contextPath}/resources/images/userIcon.svg" alt="">26</p>
                        <p>서울 송파 , 아마추어 2</p>
                    </div>
                </div>
                <div class="content-wrap">
                    <div class="team-logo-wrap">
                        <img src="${pageContext.request.contextPath}/resources/images/team1.png" alt="">
                    </div>
                    <div class="team-info-wrap">
                        <p>우리동네 FC</p>
                        <p class="memberCount"><img src="${pageContext.request.contextPath}/resources/images/userIcon.svg" alt="">26</p>
                        <p>서울 송파 , 아마추어 2</p>
                    </div>
                </div>
                <div class="content-wrap">
                    <div class="team-logo-wrap">
                        <img src="${pageContext.request.contextPath}/resources/images/team1.png" alt="">
                    </div>
                    <div class="team-info-wrap">
                        <p>우리동네 FC</p>
                        <p class="memberCount"><img src="${pageContext.request.contextPath}/resources/images/userIcon.svg" alt="">26</p>
                        <p>서울 송파 , 아마추어 2</p>
                    </div>
                </div>
                <div class="content-wrap">
                    <div class="team-logo-wrap">
                        <img src="${pageContext.request.contextPath}/resources/images/team1.png" alt="">
                    </div>
                    <div class="team-info-wrap">
                        <p>우리동네 FC</p>
                        <p class="memberCount"><img src="${pageContext.request.contextPath}/resources/images/userIcon.svg" alt="">26</p>
                        <p>서울 송파 , 아마추어 2</p>
                    </div>
                </div>
                <div class="content-wrap">
                    <div class="team-logo-wrap">
                        <img src="${pageContext.request.contextPath}/resources/images/team1.png" alt="">
                    </div>
                    <div class="team-info-wrap">
                        <p>우리동네 FC</p>
                        <p class="memberCount"><img src="${pageContext.request.contextPath}/resources/images/userIcon.svg" alt="">26</p>
                        <p>서울 송파 , 아마추어 2</p>
                    </div>
                </div>
                <div class="content-wrap">
                    <div class="team-logo-wrap">
                        <img src="${pageContext.request.contextPath}/resources/images/team1.png" alt="">
                    </div>
                    <div class="team-info-wrap">
                        <p>우리동네 FC</p>
                        <p class="memberCount"><img src="${pageContext.request.contextPath}/resources/images/userIcon.svg" alt="">26</p>
                        <p>서울 송파 , 아마추어 2</p>
                    </div>
                </div>
                <div class="content-wrap">
                    <div class="team-logo-wrap">
                        <img src="${pageContext.request.contextPath}/resources/images/team1.png" alt="">
                    </div>
                    <div class="team-info-wrap">
                        <p>우리동네 FC</p>
                        <p class="memberCount"><img src="${pageContext.request.contextPath}/resources/images/userIcon.svg" alt="">26</p>
                        <p>서울 송파 , 아마추어 2</p>
                    </div>
                </div>

            </div>
        </div>
        <jsp:include page="../common/footer.jsp" />

    </div>
</body>
</html>
