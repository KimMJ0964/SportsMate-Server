<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <br>
        <jsp:include page="../common/nav.jsp"/>
        <div class="recruit-list-wrap">
            <div id="title">단원모집</div>
            <div class="content-wrap">
                <div class="team-logo-wrap">
                    <c:choose>
                        <c:when test="${detailInfo.teamProfileChangeName ne null}">
                            <img src="${pageContext.request.contextPath}/resources/images/userProFile/${detailInfo.teamProfileChangeName}"
                                 alt="">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/resources/images/user_default_profile.png"/>
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="team-info-wrap">
                    <p class="team-name">${detailInfo.teamName}</p>
                    <p class="memberCount"><img src="${pageContext.request.contextPath}/resources/images/userIcon.svg"
                                                alt="">${detailInfo.memberCount}</p>
                    <p>${detailInfo.activityArea}</p>
                </div>
            </div>
        </div>
        <div class="team-description-wrap">
            <c:choose>
                <c:when test="${detailInfo.thumbnailChangeName ne null}">
                    <%-- 구단 미니홈피 베너 이미지 디렉터리로 수정 필요 --%>
                    <img src="${pageContext.request.contextPath}/resources/images/userProFile/${detailInfo.teamProfileChangeName}"
                         alt="">
                </c:when>
                <c:otherwise>
                    <img src="${pageContext.request.contextPath}/resources/images/RecruitTemp.png" alt="">
                </c:otherwise>
            </c:choose>

            <div>${detailInfo.teamDescription}</div>
        </div>
        <div class="btn-wrap">
            <c:choose>
                <c:when test="${loginMember != null}">
                    <button type="button" id="back-list-btn" onclick="history.back()">목록으로 가기</button>
                    <button type="button" id="apply-btn" data-bs-toggle="modal" data-bs-target="#applyNow">신청하기</button>
                </c:when>
                <c:otherwise>
                    <button type="button" id="back-list-btn" onclick="history.back()">목록으로 가기</button>
                </c:otherwise>
            </c:choose>

        </div>
    </div>
    <!-- The Modal -->
    <div class="modal fade" id="applyNow">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">가입 신청</h4>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <!-- Modal body -->
                <div class="modal-body">
                    <form action="enroll.tm" method="post" class="modal-form">
                        <input type="hidden" name="teamNo" value="${detailInfo.teamNo}">
                        <input type="hidden" name="memNo" value="${loginMember.memNo}">
                        <div class="content-wrap center">
                            <div class="team-logo-wrap">
                                <c:choose>
                                    <c:when test="${detailInfo.teamProfileChangeName ne null}">
                                        <img src="${pageContext.request.contextPath}/resources/images/userProFile/${detailInfo.teamProfileChangeName}"
                                             alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/resources/images/user_default_profile.png"/>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="team-info-wrap">
                                <p class="team-name">${detailInfo.teamName}</p>
                                <p class="memberCount"><img
                                        src="${pageContext.request.contextPath}/resources/images/userIcon.svg"
                                        alt="">${detailInfo.memberCount}</p>
                                <p>${detailInfo.activityArea}</p>
                            </div>
                        </div>
                        <div id="apply-from-wrap">
                            <textarea name="introduce" id="recruit" cols="30" rows="10"
                                      placeholder="구단 가입 신청서를 작성해주세요."></textarea>
                            <span>가입 신청시 회원가입시 작성된 정보가 함께 넘어갑니다.</span>
                            <span>구단에게는 내 프로필이 공개되고, 신청을 수락하면 내 연락처를 볼 수 있습니다.</span>
                            <span>원활한 소통을 위해 개인정보 제3자 제공에 동의합니다.</span>
                            <button type="submit">가입 신청</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
