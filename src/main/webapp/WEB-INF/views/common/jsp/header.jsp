<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>header</title>
<link
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	* {
		margin: 0 auto;
		box-sizing: b;
	}
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
	    width: 60%;                    /* 전체 너비 설정 */
	    border: 1px solid #1D87FA;      /* 경계선 설정 */
	    border-radius: 8px;             /* 모서리 둥글게 */
	    height: 40px;                   /* 높이 설정 */
	    margin-top: 15px;               /* 상단 여백 설정 */
	}
	
	.header-input input {
	    flex: 1;                         /* 입력 필드가 가능한 모든 공간을 차지하도록 설정 */
	    width: 90%;    
	    border: none;                    /* 기본 테두리 제거 */
	    height: 90%;                    /* 높이를 부모와 맞춤 */
	    padding-left: 10px;              /* 왼쪽 패딩 추가 */
	    border-radius: 8px;              /* 모서리 둥글게 */
	    outline: none;                   /* 포커스 시 기본 테두리 제거 */
	}
	
	#searchPlaceForm {
		width: 100%;
	}
	
	.header-input img {
	    width: 30px;                     /* 검색 버튼 이미지 크기 조정 */
	    height: 30px;                    /* 높이를 부모와 맞춤 */
	    margin-left: auto;
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
	
	@media (max-width: 430px) {
	
		.header-input input {
		    width: 80%;                  /* 포커스 시 기본 테두리 제거 */
		}
		
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
	
	<script>
	    function submitForm() {
	        document.getElementById("searchPlaceForm").submit(); // 폼 제출
	    }
	</script>
</body>
</html>