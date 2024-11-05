<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RankingPage</title>
<link
   href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
   rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    #wrap {
        width: 1200px;
    }
   * {
      margin: 0 auto;
      box-sizing: b;
   }
   /* header css */
   .header-container {
       display: flex;                    /* Flexbox 사용 */
       justify-content: space-between;   /* 좌우 간격을 최대로 */
       align-items: center;              /* 수직 가운데 정렬 */
       height: 90px;
       margin-left: 10%;
       margin-right: 10%;
       margin-top: 15px;
   }
   
   .header-logo {
       display: flex;                    /* Flexbox 사용 */
       align-items: center;              /* 수직 정렬 */
       font-family: "Bebas Neue", sans-serif;
       font-size: 50px;
   }
   
   .header-logo img {
       width: 74px;                     /* 로고 이미지 크기 설정 */
       margin-right: 8px;               /* 이미지와 텍스트 간의 간격 설정 */
   }
   
   .header-logo p {
       margin: 0;                       /* 텍스트의 기본 여백 제거 */
   }
   
   .header-input {
       display: flex;                   /* Flexbox 사용 */
       align-items: center;             /* 수직 정렬 */
       width: 600px;                    /* 전체 너비 설정 */
       border: 1px solid #1D87FA;      /* 경계선 설정 */
       border-radius: 8px;             /* 모서리 둥글게 */
       height: 40px;                   /* 높이 설정 */
       margin-top: 15px;               /* 상단 여백 설정 */
   }
   
   .header-input input {
       flex: 1;                         /* 입력 필드가 가능한 모든 공간을 차지하도록 설정 */
       width: 550px;    
       border: none;                    /* 기본 테두리 제거 */
       height: 90%;                    /* 높이를 부모와 맞춤 */
       padding-left: 10px;              /* 왼쪽 패딩 추가 */
       border-radius: 8px;              /* 모서리 둥글게 */
       outline: none;                   /* 포커스 시 기본 테두리 제거 */
   }
   
   .header-input img {
       width: 30px;                     /* 검색 버튼 이미지 크기 조정 */
       height: 30px;                    /* 높이를 부모와 맞춤 */
       margin-left: 8px;                /* 입력 필드와 이미지 간의 여백 설정 */
   }
   
   .header-userImg {
       display: flex;                   /* Flexbox 사용 */
       align-items: center;             /* 수직 정렬 */
   }
   
   .header-userImg img {
       width: 50px;                     /* 프로필 이미지 크기 설정 */
   }
   
   .header-appTop {
       display: flex;                    /* Flexbox 사용 */
       justify-content: space-between;   /* 양 끝으로 정렬 */
       align-items: center;              /* 수직 가운데 정렬 */
       height: 60px;                     /* 높이 설정 */
       padding: 0 10%;                   /* 좌우 패딩 추가 */
   }
   /* Footer css */
   body {
      margin: 0 auto;
      box-sizing: border-box;
      font-family: 'Noto Sans KR', sans-serif; /* 나눔고딕 설정 */
   }
   
   .footer {
      display: block;
      margin-top: 50px;
      background-color: #3C3636;
      height: 230px;
      color: white;
      padding-left: 15px;
      padding-top: 10px;
      padding-bottom: 15px;
      position: relative;
      @media (max-width : 430px) {
         display : none;   
      }
   }
   
   .footer p {
      font-size: 10px;
   }

   .footer h3 {
      font-size: 20px;
   }
   
   .sixall-mem {
      position: absolute;
      right: 2%;
   }
   .img-group {
      position: absolute;
      right: 2%;
      bottom: 10%;
      display: flex;
      gap: 20px;
   }
   
   .img-group img {
      width: 36px;
      height: 36px;
   }

    /* 매칭 테이블 */
    table {
            width: 50%;
            margin: auto;
            border-collapse: collapse;
            text-align: center;
        }
        tr {
            border-left: none;
            border-right: none;
        }
        td {
            padding: 8px;
            border-top: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
        }
        .point {
            font-size: 0.8em;
            color: #888;
        }

   /* 미디어쿼리 css */
   @media (max-width: 430px) {
       .header-container {
           display: none; /* 430px 이하에서는 header-container를 숨김 */
       }
      
       .additional-container {
           display: flex; /* 추가적인 container는 보이도록 설정 */
           flex-direction: column; /* 세로 방향으로 배치 */
           align-items: center;     /* 가운데 정렬 */
           width: 100%; /* 너비를 100%로 설정 */
       }
      
      .header-logo {
          display: flex;
          align-items: center;
          font-family: "Bebas Neue", sans-serif;
          font-size: 24px;
      }
      
      .header-userImg {
         padding-left: 30px;
      }
      
      .header-logo img {
          width: 60px;                     /* 로고 이미지 크기 설정 */
          margin-right: 8px;               /* 이미지와 텍스트 간의 간격 설정 */
      }
      
      .header-logo p {
          margin: 0;                       /* 텍스트의 기본 여백 제거 */
      }
      
       .header-input {
           width: 80%; /* 입력 필드 너비를 100%로 설정 */
           margin-top: 10px; /* 상단 여백 추가 */
       }
       
       .header-userImg img {
          width: 35px;                     /* 프로필 이미지 크기 설정 */
      }
   }

   @media (min-width: 431px) {
       .additional-container {
           display: none; /* 431px 이상에서는 추가적인 container를 숨김 */
       }
   }

</style>
</head>
<body>
    <div id="wrap">
        <div class="header-container">
            <div class="header-logo">
            <div>
                <a class="header-logo" href="index.jsp">
                    <img src="resources/img/SportMateLogo.png" />
                </a>
            </div>
            <div>
                <p> SportMate </p>
            </div>
            </div>
            <div class="header-input">
            <form id="searchPlaceForm" action="List.sm" method="get">
                <input placeholder="구장명을 입력하시오." /> <img
                    src="resources/img/search-btn.png" onclick="submitForm()" style="cursor: pointer;" />
            </form>
            </div>
            <div class="header-userImg">
                <a href="login.me">
                <img src="resources/img/user_profile.png" />
            </a>
            </div>
        </div>
    
        <div class="additional-container">
            <div class="header-appTop">
            <div class="header-logo">
                <a class="header-logo" href="index.jsp">
                    <img src="resources/img/SportMateLogo.png" />
                </a>
                <p> SportMate</p>
            </div>
            <div class="header-userImg">
                <a href="login.me">
                    <img src="resources/img/user_profile.png" />
                </a>
            </div>
            </div>
            <div class="header-input">
            <form id="searchPlaceForm" action="List.sm" method="get">
                <input placeholder="구장명을 입력하시오." /> <img
                    src="resources/img/search-btn.png" onclick="submitForm()" style="cursor: pointer;" />
            </form>
            </div>
        </div>
    </div>
    <p>실시간 랭킹</p>
    <p>축구, 풋살, 야구, 농구</p>
    <div>
        <table>
            <tr>
                <td>1</td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>2</td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>3</td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>4</td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>5</td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>6</td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>7</td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>8</td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>9</td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
            <tr>
                <td>10</td>
                <td>우리동네FC</td>
                <td><div class="point">Point</div>1389</td>
            </tr>
        </table>
    </div>

    <div class="footer">
        <p class="sixall-mem">TEAM: 6ALL | 조장 이철규 | DBA 김민재 | 형상관리자 이명건 |
        이슈관리자 김현준 | 일정관리자 강주원</p>
        <h3>SportsMate.com</h3>
        <p>팀 스포츠의 시작, 온라인으로 쉽고 빠르게!</p>
        <br />
        <p>SportMate | 서울 강남구 테헤란로14길 6 남도빌딩 3층 | 대표 메일
        contact@sportsmate.com | 마케팅 제안 admin@sportsmate.com</p>
        <p>언론, 연구 team@sportsmate.com | 02-123-4567 | 주식회사 KH정보교육원 | 사업자번호
        123-45-67890 | 대표 이철규 | 통신판매업 신고 2024-서울강남-1234</p>
        <br />
        <p>Copyright SportsMate All rights reserved.</p>
        <div class="img-group">
        <img src="resources/img/Facebook.png" />
        <img src="resources/img/Instagram.png" />
        <img src="resources/img/Youtube.png" />
        <img src="resources/img/Twitter.png" />
        </div>
    </div>
  
     
    <script>
        function submitForm() {
            document.getElementById("searchPlaceForm").submit(); // 폼 제출
        }
    </script>
  
</body>
</html>