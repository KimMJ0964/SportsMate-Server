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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
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