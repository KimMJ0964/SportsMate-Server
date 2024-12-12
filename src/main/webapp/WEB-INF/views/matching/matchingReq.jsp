<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매칭</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/matching/matchingReq.css">
    
    <!-- jQuery -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/matching/kakaopay.js"></script>

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

        <div class="matching-container">
            <div class="matching-title">
                <h4>구장정보</h4>
            </div>
        
            <div class="match-info">
                <div>
                    <c:choose>
                        <c:when test="${ss.changeName != null}">
                            <img class="ground-thunb" src="${pageContext.request.contextPath}/resources/images/stadiumFile/${ss.changeName}" alt="">
                        </c:when>
                        <c:otherwise>
                            <img class="ground-thunb" src="${pageContext.request.contextPath}/resources/images/Logo.png" alt="">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div>
                    <p>${ss.stadiumAddress }</p>
                    <h4>${ss.stadiumName }</h4>
                    <p>경기일시</p>
                    <p>${mc.accessDate}</p>
                    <p>${mc.reservStart}~${mc.reservEnd}</p>
                </div>
            </div>
        </div>

		<c:if test="${ss.opponent != null}">
	        <div class="matching-container">
	            <div class="matching-title">
	                <h4>대전팀</h4>
	            </div>
	
	            <div class="match-a">
	                <div class="team-info">
                        <c:choose>
                            <c:when test="${ss.opChangeName != null}">
                                <img src="${pageContext.request.contextPath}/resources/images/profileFile/${ss.opChangeName}" alt="">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/resources/images/Logo.png" alt="">
                            </c:otherwise>
                        </c:choose>
	                    
	                    <h4>구단: ${ss.opponent }</h4>
	                </div>
	
	                <div class="team-detail">
	                    <b>전적</b>
	                    <p>${ss.result }</p>
	                </div>
	            </div>
	        </div>
        </c:if>

        <div class="matching-container">
            <div class="matching-title">
                <h4>경기일정</h4>
            </div>

            <div class="match-b">
                <div class="team-info">
                    <c:choose>
                            <c:when test="${ss.teamChangeName != null}">
                                <img src="${pageContext.request.contextPath}/resources/images/profileFile/${ss.teamChangeName}" alt="">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/resources/images/Logo.png" alt="">
                            </c:otherwise>
                        </c:choose>
                    <h4>구단: ${ss.teamName}</h4>
                </div>

                <div class="match-category">
                    <div>
                        <b>종목명</b>
                        <p>${ss.category }</p>
                    </div>
                    <div>
                        <b>심판</b>
                        <p>${ss.referee }</p>
                    </div>
                </div>

                <div class="team-detail">
                    <b>경기일시</b>
                    <p>${mc.accessDate}</p>
                    <p>${mc.reservStart}~${mc.reservEnd}</p>
                </div>
            </div>
        </div>

        <div class="matching-container">
            <div class="matching-title">
                <h4>결제</h4>
            </div>

            <div class="match-order">
                <form>
                    <input type="hidden" value="${ss.price }" id="price">
                    <input type="hidden" value="${ss.stadiumName }" id="stadium">
                    <div class="total">
                        <h4>대관료</h4>
                        <p>${ss.price }</p>
                    </div>
                    <div>
                        <h4>결제수단</h4>
                        <select name="" id="">
                            <option>카카오페이</option>
                        </select>

                        <div class="order-box">
                            <br>
                        </div>
                    </div>
                    <button id="btn-pay-ready">결제하기</button>
                </form>
            </div>
        </div>

        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    </div>
</body>
</html>