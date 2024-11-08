<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>구름 정보 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <style>
        img {
            width: 1000px;
            height: 500px;
            object-fit: cover;
        }
        .container {
            display: flex;
            margin-top: 20px;
        }
        .main-content {
            flex: 3;
        }
        .sidebar {
            flex: 2;
            margin-left: 20px;
        }
        .info-box {
            border: 1px solid black;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            margin-top: 0; /* 위쪽 여백 제거 */
        }
        .info-section {
            display: flex;
            justify-content: space-between; /* 왼쪽과 오른쪽 정렬 */
        }
    </style>
</head>
<body>
<div class="wrap">
    <jsp:include page="header.jsp" />
    <br>
    <jsp:include page="nav.jsp" />
    <br>

    <div>
        <img src="resources/images/stadium.png" alt="Stadium Image" />
    </div>

    <div class="info-section">
        <div class="main-content">
            <div class="info-box">
                <h3>지역 날씨</h3>
            </div>

            <div class="info-box">
                <ul>
                    <h3>구장 정보</h3>
                    <li><strong>이용 안내:</strong> 이용 가능 시간, 요금 등</li>
                    <li><strong>편의시설:</strong>
                        <ul>
                            <li>화장실</li>
                            <li>주차장</li>
                            <li>음료수 자판기</li>
                        </ul>
                    </li>
                </ul>
            </div>
            
             <div class="info-box">
                <ul>
                    <h3>매치 진행방식</h3>
                    <li><strong>이용 안내:</strong> 이용 가능 시간, 요금 등</li>
                    <li><strong>편의시설:</strong>
                        <ul>
                            <li>화장실</li>
                            <li>주차장</li>
                            <li>음료수 자판기</li>
                        </ul>
                    </li>
                </ul>
            </div>
                   
			<div class="info-box">
                <ul>
                    <h3>매치 진행방식</h3>
                    <li><strong>이용 안내:</strong> 이용 가능 시간, 요금 등</li>
                    <li><strong>편의시설:</strong>
                        <ul>
                            <li>화장실</li>
                            <li>주차장</li>
                            <li>음료수 자판기</li>
                        </ul>
                    </li>
                </ul>
            </div>
            
            <div class="info-box">
                <ul>
                    <h3>매치 진행방식</h3>
                    <li><strong>이용 안내:</strong> 이용 가능 시간, 요금 등</li>
                    <li><strong>편의시설:</strong>
                        <ul>
                            <li>화장실</li>
                            <li>주차장</li>
                            <li>음료수 자판기</li>
                        </ul>
                    </li>
                </ul>
            </div>
            
            <div class="info-box">
                <ul>
                    <h3>매치 진행방식</h3>
                    <li><strong>이용 안내:</strong> 이용 가능 시간, 요금 등</li>
                    <li><strong>편의시설:</strong>
                        <ul>
                            <li>화장실</li>
                            <li>주차장</li>
                            <li>음료수 자판기</li>
                        </ul>
                    </li>
                </ul>
            </div>                       
        </div>

        <aside class="sidebar">
            <div class="info-box">
                <p>풋살</p>
                <p>서울 영등포 SKY 풋살파크 B구장</p>
                <p>서울 영등포구 선유로 43길 19</p> <button>지도 보기</button>
                <hr>
                <p>가격: 200,000원</p>
                <button>신청하기</button>
            </div>
        </aside>
    </div>

    <jsp:include page="footer.jsp" />
</div>
</body>
</html>
