<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>접근실패!</h1>
<h2><c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage() }" /></h2>
<h2><c:out value="${errorMessage} }"/></h2>

</body>
</html>