<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%--    <jsp:forward page="WEB-INF/views/main.jsp"/>--%>
<%--    <jsp:include page="WEB-INF/views/main.jsp"/>--%>
    <c:redirect url="/main" />
    <p>Redirecting to the main page...</p>
</body>
</html>