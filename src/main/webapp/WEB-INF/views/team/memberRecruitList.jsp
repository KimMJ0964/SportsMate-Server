<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/team/memberRecruitList.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/team/memberRecruitList.css">
    <title>SportsMate - 단원 모집</title>
</head>
<body>
    <div class="wrap">
        <jsp:include page="../common/header.jsp"/>
        <jsp:include page="../common/nav.jsp"/>
        <div class="recruit-list-wrap">
            <div id="title">단원모집</div>
            <div class="category-wrap">
                <span id="soccer" class="soccer ${category == 'soccer' ? 'highlight' : ''}">축구</span>
                <span id="futsal" class="futsal ${category == 'futsal' ? 'highlight' : ''}">풋살</span>
                <span id="basketball" class="basketball ${category == 'basketball' ? 'highlight' : ''}">농구</span>
                <span id="baseball" class="baseball ${category == 'baseball' ? 'highlight' : ''}">야구</span>
            </div>
            <div class="filter-wrap">
                <select name="searchArea" id="searchArea">
                    <c:choose>
                        <c:when test="${searchArea eq 'all'}">
                            <option value="all">지역 전체</option>
                        </c:when>
                        <c:when test="${empty searchArea}">
                            <option value="all" selected>지역 전체</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${searchArea}">${searchArea}</option>
                            <option value="all">지역 전체</option>
                        </c:otherwise>
                    </c:choose>
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
                <c:if test="${empty RecruitList}">
                    <span class="no-list">등록된 단원 모집이 없습니다.</span>
                </c:if>
                <c:forEach var="item" items="${RecruitList}">
                    <%--                    <div class="content-wrap" onclick="location.href = 'recruit_detail.tm?tno=${item.teamNo}'">--%>
                    <div class="content-wrap" onclick="clickDetailPate(${item.teamNo})">
                        <div class="team-logo-wrap">
                            <img src="${pageContext.request.contextPath}/resources/images/userProFile/${item.changeName}"
                                 alt="">
                        </div>
                        <div class="team-info-wrap">
                            <p id="team-name">${item.teamName}</p>
                            <p class="memberCount"><img
                                    src="${pageContext.request.contextPath}/resources/images/userIcon.svg"
                                    alt="">${item.teamMemberCount}</p>
                            <p>${item.activityArea}</p>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <div id="pagenation">
                <nav>
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${pi.currentPage != 1 || (pi.startPage / pi.boardLimit)  > 1}">
                                <li class="page-item">
                                    <a href="adminReport.me?category=${category}&cpage=1"
                                       class="page-link">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item disabled">
                                    <a href="#" class="page-link">
                                        <span aria-hidden="true">&laquo;</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pi.currentPage > 1}">
                                <li class="page-item">
                                    <a href="adminReport.me?category=${category}&cpage=${pi.currentPage - 1}"
                                       class="page-link">
                                        <span aria-hidden="true">&lt;</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item disabled">
                                    <a href="#" class="page-link">
                                        <span aria-hidden="true">&lt;</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}" step="1">
                            <c:choose>
                                <c:when test="${page == pi.currentPage}">
                                    <li class="page-item active"><a class="page-link" href="#">${page}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link"
                                                             href="adminReport.me?category=${category}&cpage=${page}">${page}</a>
                                    </li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:choose>
                            <c:when test="${pi.currentPage < pi.maxPage}">
                                <li class="page-item">
                                    <a href="adminReport.me?category=${category}&cpage=${pi.currentPage + 1}"
                                       class="page-link">
                                        <span aria-hidden="true">&gt;</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item disabled">
                                    <a href="#" class="page-link">
                                        <span aria-hidden="true">&gt;</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                        <c:choose>
                            <c:when test="${pi.currentPage eq pi.maxPage}">
                                <li class="page-item disabled">
                                    <a href="#" class="page-link">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:when
                                    test="${pi.currentPage  < pi.maxPage and pi.maxPage > 1}">
                                <li class="page-item">
                                    <a href="adminReport.me?category=${category}&cpage=${pi.maxPage}"
                                       class="page-link">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:when test="${(pi.endPage / boardLimit)  < pi.maxPage}">
                                <li class="page-item">
                                    <a href="adminReport.me?category=${category}&cpage=${pi.endPage + 1}"
                                       class="page-link">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item disabled">
                                    <a href="#" class="page-link">
                                        <span aria-hidden="true">&raquo;</span>
                                    </a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </nav>
            </div>

        </div>
        <jsp:include page="../common/footer.jsp"/>

    </div>
</body>
</html>
