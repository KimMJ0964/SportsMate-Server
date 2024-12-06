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
        
        카테고리
        <select name="category">
            <option value="soccer">축구</option>
            <option value="baseball">야구</option>
            <option value="basketball">농구</option>
            <option value="footsal">풋살</option>
        </select> <br>

        선택일
        <input type="date" name="accessDate"> 

        <input type="time" name="reservEnd">

        <input type="time" name="reservStart"> <br>

        <button>제출</button>
    </form>
</body>
</html>