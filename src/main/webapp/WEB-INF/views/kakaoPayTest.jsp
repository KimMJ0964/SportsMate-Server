<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

	<button id="btn-pay-ready">카카오페이</button>
	<script>
	    // 카카오페이 결제 팝업창 연결
	    $(function() {
	        $("#btn-pay-ready").click(function(e) {
	            // 아래 데이터 외에도 필요한 데이터를 원하는 대로 담고, Controller에서 @RequestBody로 받으면 됨
	            let data = {
	                name: 'KH구장',    // 카카오페이에 보낼 대표 상품명
	                totalPrice: 100000000 // 총 결제금액
	            };
	          
	            $.ajax({
	                type: 'POST',
	                url: 'payMatch.st',
	                data: JSON.stringify(data),
	                contentType: 'application/json',
	                success: function(response) {
	                    location.href = response.next_redirect_pc_url;
	                },
	                error: function(){
	                	console.log("결제실패");
	                }
	            });
	        });
	    });
	</script>
</body>
</html>