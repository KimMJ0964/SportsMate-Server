<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="orderInfo.st" method="post">
        구장번호
        <input type="number" name="stadiumNo"> <br>
        a팀번호
        <input type="number" name="teamANo"> <br>
        b팀번호
        <input type="number" name="teamBNo"> <br>
        가격
        <input type="number" name="price"> <br>
        선택일
        <input type="date" name="date"> <br>
        <button>제출</button>
    </form>
</body>
</html>