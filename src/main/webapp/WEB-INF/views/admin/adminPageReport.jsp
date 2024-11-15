<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>신고관리</title>
            <!-- bootstrap -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- jQuery -->
            <script src="https://code.jquery.com/jquery-3.7.1.min.js"
                integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
            <script src="https://code.jquery.com/ui/1.14.0/jquery-ui.min.js"
                integrity="sha256-Fb0zP4jE3JHqu+IBB9YktLcSjI1Zc6J2b6gTjB0LpoM=" crossorigin="anonymous"></script>

            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/adminPageReport.css">
            <script src="${pageContext.request.contextPath}/resources/js/admin/adminPageReport.js"></script>
            <!-- font -->
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
                rel="stylesheet">
        </head>

        <body>
            <div class="wrap">

                <jsp:include page="/WEB-INF/views/common/header.jsp" />

                <br>

                <jsp:include page="/WEB-INF/views/common/nav.jsp" />

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
                    <c:forEach var="report" items="${list}">
                        <div class="victory-container">
                            <div class="victory-row">
                                <div class="team-info">
                                    <form action="blockUser.me" method="post">
                                        <input type="hidden" name="memNo" value="${report.memNo}">
                                        <input type="hidden" name="pnNo" value="${report.pnNo}">
                                        <table>
                                            <tr>
                                                <td>
                                                    <p><b>경기장:</b> ${report.stadiumName}</p>
                                                </td>
                                                <td>
                                                    <p><b>신고일:</b> ${report.repDate}</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <p><b>신고자:</b> 유저-${report.pnReporter}</p>
                                                </td>
                                                <td>
                                                    <p><b>신고대상:</b> 유저-${report.memNo}</p>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <p><b>신고사유:</b> ${report.pnContent}</p>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="report-btns">
                                            <button class="cancle-btn">거절</button>
                                            <button type="submit" class="report-btn">승인</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

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

                    <!-- 등록 버튼 -->
                    <button class="registration-button">뒤로가기</button>
                </div>

                <jsp:include page="/WEB-INF/views/common/footer.jsp" />
            </div>
        </body>

        </html>
