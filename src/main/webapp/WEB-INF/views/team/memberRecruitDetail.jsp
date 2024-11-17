<%--
  Created by IntelliJ IDEA.
  User: jun
  Date: 2024. 11. 16.
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/team/memberRecruitDetail.css">

    <%--  bt5 Modal  --%>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>SportsMate - 단원 모집</title>
</head>
<body>
    <div class="wrap">
        <jsp:include page="../common/header.jsp"/>
        <jsp:include page="../common/nav.jsp"/>
        <div class="recruit-list-wrap">
            <div id="title">단원모집</div>
            <div class="content-wrap">
                <div class="team-logo-wrap">
                    <img src="${pageContext.request.contextPath}/resources/images/team1.png" alt="">
                </div>
                <div class="team-info-wrap">
                    <p>우리동네 FC</p>
                    <p class="memberCount"><img src="${pageContext.request.contextPath}/resources/images/userIcon.svg"
                                                alt="">26</p>
                    <p>서울 송파 , 아마추어 2</p>
                </div>
            </div>
        </div>
        <div class="team-description-wrap">
            <img src="${pageContext.request.contextPath}/resources/images/RecruitTemp.png" alt="">
            <textarea name="" id="" cols="50" rows="10" readonly >안녕하세요 ! 풋살과 축구를 좋아하는 사람이라면 누구나 함께 할 수 있는 팀을 만들고 싶습니다! 팀원이 충원되기 전까지는 정기적인 매치 보다는 팀원들끼리 시간 조율을 통해 플랩 신청 후 같이 운동 하는 시간 만들겠습니다 ! ! 송파 축구장이 아니더라도 가능합니다 (송파 전 지역) 풋살과 축구에 열정과 관심이 조금이라도 있으신 분들은 편하게 가입신청 해주세요 ^^특히 ! 공차고 싶은 날인데 혼자서 참여하기 좀 그렇다 하시는 분, 타지역에서 오셔서 같이 공 찰 사람이 없는 분들은 빨리 가입하셔서 기존 회원분들이랑 같이 참여 할 수 있도록 해요 ! !인원이 더 모이면 자체전 및 타팀과의 팀매치 진행 예정입니다.</textarea>
        </div>
        <div class="btn-wrap">
            <button type="button" id="back-list-btn">목록으로 가기</button>
            <button type="button" id="apply-btn" data-bs-toggle="modal" data-bs-target="#myModal">신청하기</button>
        </div>
    </div>
    <!-- The Modal -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">가입 신청</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    Modal body..
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>

</body>
</html>
