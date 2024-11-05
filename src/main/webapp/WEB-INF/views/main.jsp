<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Nanum+Gothic&display=swap"
            rel="stylesheet">
    </head>

    <body>
        <div class="wrap">

            <jsp:include page="header.jsp" />

            <br>

            <jsp:include page="nav.jsp" />

            <!-- Carousel -->
            <div id="demo" class="carousel slide" data-bs-ride="carousel">

                <!-- Indicators/dots -->
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
                    <button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
                </div>

                <!-- The slideshow/carousel -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="${pageContext.request.contextPath}/resources/images/event-banner.png" alt="Los Angeles" class="d-block" style="width:100%">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/resources/images/event-banner.png" alt="Chicago" class="d-block" style="width:100%">
                    </div>
                    <div class="carousel-item">
                        <img src="${pageContext.request.contextPath}/resources/images/event-banner.png" alt="New York" class="d-block" style="width:100%">
                    </div>
                </div>

                <!-- Left and right controls/icons -->
                <button class="carousel-control-prev" type="button" data-bs-target="#demo" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#demo" data-bs-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </button>
            </div>

            <div class="category-wrap">

                <div class="category">축구</div>
                <div class="category">풋살</div>
                <div class="category">농구</div>
                <div class="category">야구</div>
            </div>

            <div class="main-content">

                <div class="inner-left">
                    <div class="main-content-title">
                        <h4>실시간 랭킹</h4>
                    </div>
                    <div class="real-time-rank">
                        <div class="rank-wrap">
                            <div class="rank">
                                1
                            </div>
                            <div class="team">
                                <img src="https://d31wz4d3hgve8q.cloudfront.net/media/emblem/51043_IMG_9132.jpeg"
                                    alt="Team Logo" class="team-logo">
                                <span class="team-name">우리동네FC</span>
                            </div>
                            <div class="point-wrap">
                                <div class="point">Point</div>
                                <div class="score">1245</div>
                            </div>
                        </div>
                        <div class="split-bar"></div>
                        <div class="rank-wrap">
                            <div class="rank">
                                1
                            </div>
                            <div class="team">
                                <img src="https://d31wz4d3hgve8q.cloudfront.net/media/emblem/51043_IMG_9132.jpeg"
                                    alt="Team Logo" class="team-logo">
                                <span class="team-name">우리동네FC</span>
                            </div>
                            <div class="point-wrap">
                                <div class="point">Point</div>
                                <div class="score">1245</div>
                            </div>
                        </div>
                        <div class="split-bar"></div>
                        <div class="rank-wrap">
                            <div class="rank">
                                1
                            </div>
                            <div class="team">
                                <img src="https://d31wz4d3hgve8q.cloudfront.net/media/emblem/51043_IMG_9132.jpeg"
                                    alt="Team Logo" class="team-logo">
                                <span class="team-name">우리동네FC</span>
                            </div>
                            <div class="point-wrap">
                                <div class="point">Point</div>
                                <div class="score">1245</div>
                            </div>
                        </div>
                        <div class="split-bar"></div>
                        <div class="rank-wrap">
                            <div class="rank">
                                1
                            </div>
                            <div class="team">
                                <img src="https://d31wz4d3hgve8q.cloudfront.net/media/emblem/51043_IMG_9132.jpeg"
                                    alt="Team Logo" class="team-logo">
                                <span class="team-name">우리동네FC</span>
                            </div>
                            <div class="point-wrap">
                                <div class="point">Point</div>
                                <div class="score">1245</div>
                            </div>
                        </div>
                        <div class="split-bar"></div>
                        <div class="rank-wrap">
                            <div class="rank">
                                1
                            </div>
                            <div class="team">
                                <img src="https://d31wz4d3hgve8q.cloudfront.net/media/emblem/51043_IMG_9132.jpeg"
                                    alt="Team Logo" class="team-logo">
                                <span class="team-name">우리동네FC</span>
                            </div>
                            <div class="point-wrap">
                                <div class="point">Point</div>
                                <div class="score">1245</div>
                            </div>
                        </div>
                        <div class="split-bar"></div>
                        <div class="rank-wrap">
                            <div class="rank">
                                1
                            </div>
                            <div class="team">
                                <img src="https://d31wz4d3hgve8q.cloudfront.net/media/emblem/51043_IMG_9132.jpeg"
                                    alt="Team Logo" class="team-logo">
                                <span class="team-name">우리동네FC</span>
                            </div>
                            <div class="point-wrap">
                                <div class="point">Point</div>
                                <div class="score">1245</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="inner-right">
                    <div class="record">
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
                                    <img src="https://item.kakaocdn.net/do/1ee5c1aa96e8bf44535e86bdd3e19460617ea012db208c18f6e83b1a90a7baa7"
                                        class="radius-img" alt="">
                                    <p>A팀</p>
                                </div>
                                <div class="record-score">
                                    <h5>1:7</h5>
                                </div>
                                <div class="team-B">
                                    <p>B팀</p>
                                    <img src="https://item.kakaocdn.net/do/f7fd66dcf2080911a92c7ea0e2a8a7552df16ed7012359e344d47930e49e9310"
                                        class="radius-img" alt="">
                                </div>
                            </div>

                            <div class="team-record">
                                <div class="team-A">
                                    <img src="https://item.kakaocdn.net/do/1ee5c1aa96e8bf44535e86bdd3e19460617ea012db208c18f6e83b1a90a7baa7"
                                        class="radius-img" alt="">
                                    <p>A팀</p>
                                </div>
                                <div class="record-score">
                                    <h5>1:7</h5>
                                </div>
                                <div class="team-B">
                                    <p>B팀</p>
                                    <img src="https://item.kakaocdn.net/do/f7fd66dcf2080911a92c7ea0e2a8a7552df16ed7012359e344d47930e49e9310"
                                        class="radius-img" alt="">
                                </div>
                            </div>

                            <div class="team-record">
                                <div class="team-A">
                                    <img src="https://item.kakaocdn.net/do/1ee5c1aa96e8bf44535e86bdd3e19460617ea012db208c18f6e83b1a90a7baa7"
                                        class="radius-img" alt="">
                                    <p>A팀</p>
                                </div>
                                <div class="record-score">
                                    <h5>1:7</h5>
                                </div>
                                <div class="team-B">
                                    <p>B팀</p>
                                    <img src="https://item.kakaocdn.net/do/f7fd66dcf2080911a92c7ea0e2a8a7552df16ed7012359e344d47930e49e9310"
                                        class="radius-img" alt="">
                                </div>
                            </div>

                            <div class="team-record">
                                <div class="team-A">
                                    <img src="https://item.kakaocdn.net/do/1ee5c1aa96e8bf44535e86bdd3e19460617ea012db208c18f6e83b1a90a7baa7"
                                        class="radius-img" alt="">
                                    <p>A팀</p>
                                </div>
                                <div class="record-score">
                                    <h5>1:7</h5>
                                </div>
                                <div class="team-B">
                                    <p>B팀</p>
                                    <img src="https://item.kakaocdn.net/do/f7fd66dcf2080911a92c7ea0e2a8a7552df16ed7012359e344d47930e49e9310"
                                        class="radius-img" alt="">
                                </div>
                            </div>

                            <div class="team-record">
                                <div class="team-A">
                                    <img src="https://item.kakaocdn.net/do/1ee5c1aa96e8bf44535e86bdd3e19460617ea012db208c18f6e83b1a90a7baa7"
                                        class="radius-img" alt="">
                                    <p>A팀</p>
                                </div>
                                <div class="record-score">
                                    <h5>1:7</h5>
                                </div>
                                <div class="team-B">
                                    <p>B팀</p>
                                    <img src="https://item.kakaocdn.net/do/f7fd66dcf2080911a92c7ea0e2a8a7552df16ed7012359e344d47930e49e9310"
                                        class="radius-img" alt="">
                                </div>
                            </div>

                            <div class="team-record">
                                <div class="team-A">
                                    <img src="https://item.kakaocdn.net/do/1ee5c1aa96e8bf44535e86bdd3e19460617ea012db208c18f6e83b1a90a7baa7"
                                        class="radius-img" alt="">
                                    <p>A팀</p>
                                </div>
                                <div class="record-score">
                                    <h5>1:7</h5>
                                </div>
                                <div class="team-B">
                                    <p>B팀</p>
                                    <img src="https://item.kakaocdn.net/do/f7fd66dcf2080911a92c7ea0e2a8a7552df16ed7012359e344d47930e49e9310"
                                        class="radius-img" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

			<jsp:include page="matching.jsp" />
			
            <jsp:include page="footer.jsp" />

        </div>
    </body>

    </html>