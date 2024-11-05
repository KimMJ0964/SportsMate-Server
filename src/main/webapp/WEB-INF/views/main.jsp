<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">

    <!-- jQuery -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap" rel="stylesheet">
</head>
<body>
    <div class="wrap">
        <div class="main-content">
            <div class="inner-left">
                <div class="main-content-title">
                    <h4>실시간 랭킹</h4>
                </div>
                
            </div>

            <div class="inner-right">
                <div class="record-title">
                    <div class="main-content-title">
                        <h4>지역전적</h4>
                        <form action="">
                            <select class="form-select" id="sel1" name="sellist1">
                                <option>서울</option>
                                <option>평택</option>
                                <option>수원</option>
                                <option>오산</option>
                            </select>
                        </form>
                    </div>
                    <div class="main-content-record">
                        <div class="team-record">
                            <div class="team-A">
                                <img src="https://item.kakaocdn.net/do/1ee5c1aa96e8bf44535e86bdd3e19460617ea012db208c18f6e83b1a90a7baa7" class="radius-img" alt="">
                                <p>A팀</p>
                            </div>
                            <div class="record-score">
                                <h5>1:7</h5>
                            </div>
                            <div class="team-B">
                                <p>B팀</p>
                                <img src="https://item.kakaocdn.net/do/f7fd66dcf2080911a92c7ea0e2a8a7552df16ed7012359e344d47930e49e9310" class="radius-img" alt="">
                            </div>
                        </div>

                        <div class="team-record">
                            <div class="team-A">
                                <img src="https://item.kakaocdn.net/do/1ee5c1aa96e8bf44535e86bdd3e19460617ea012db208c18f6e83b1a90a7baa7" class="radius-img" alt="">
                                <p>A팀</p>
                            </div>
                            <div class="record-score">
                                <h5>1:7</h5>
                            </div>
                            <div class="team-B">
                                <p>B팀</p>
                                <img src="https://item.kakaocdn.net/do/f7fd66dcf2080911a92c7ea0e2a8a7552df16ed7012359e344d47930e49e9310" class="radius-img" alt="">
                            </div>
                        </div>

                        <div class="team-record">
                            <div class="team-A">
                                <img src="https://item.kakaocdn.net/do/1ee5c1aa96e8bf44535e86bdd3e19460617ea012db208c18f6e83b1a90a7baa7" class="radius-img" alt="">
                                <p>A팀</p>
                            </div>
                            <div class="record-score">
                                <h5>1:7</h5>
                            </div>
                            <div class="team-B">
                                <p>B팀</p>
                                <img src="https://item.kakaocdn.net/do/f7fd66dcf2080911a92c7ea0e2a8a7552df16ed7012359e344d47930e49e9310" class="radius-img" alt="">
                            </div>
                        </div>

                        <div class="team-record">
                            <div class="team-A">
                                <img src="https://item.kakaocdn.net/do/1ee5c1aa96e8bf44535e86bdd3e19460617ea012db208c18f6e83b1a90a7baa7" class="radius-img" alt="">
                                <p>A팀</p>
                            </div>
                            <div class="record-score">
                                <h5>1:7</h5>
                            </div>
                            <div class="team-B">
                                <p>B팀</p>
                                <img src="https://item.kakaocdn.net/do/f7fd66dcf2080911a92c7ea0e2a8a7552df16ed7012359e344d47930e49e9310" class="radius-img" alt="">
                            </div>
                        </div>

                        <div class="team-record">
                            <div class="team-A">
                                <img src="https://item.kakaocdn.net/do/1ee5c1aa96e8bf44535e86bdd3e19460617ea012db208c18f6e83b1a90a7baa7" class="radius-img" alt="">
                                <p>A팀</p>
                            </div>
                            <div class="record-score">
                                <h5>1:7</h5>
                            </div>
                            <div class="team-B">
                                <p>B팀</p>
                                <img src="https://item.kakaocdn.net/do/f7fd66dcf2080911a92c7ea0e2a8a7552df16ed7012359e344d47930e49e9310" class="radius-img" alt="">
                            </div>
                        </div>

                        <div class="team-record">
                            <div class="team-A">
                                <img src="https://item.kakaocdn.net/do/1ee5c1aa96e8bf44535e86bdd3e19460617ea012db208c18f6e83b1a90a7baa7" class="radius-img" alt="">
                                <p>A팀</p>
                            </div>
                            <div class="record-score">
                                <h5>1:7</h5>
                            </div>
                            <div class="team-B">
                                <p>B팀</p>
                                <img src="https://item.kakaocdn.net/do/f7fd66dcf2080911a92c7ea0e2a8a7552df16ed7012359e344d47930e49e9310" class="radius-img" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>