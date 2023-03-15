<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- hurl로는 http://localhost:8003/ea/views/2_standardAction/02_include.jsp-->
	<h1> 여기는 02_forward.jsp이다.</h1>
	
	<jsp::forward page="footer.jsp">
	<!-- 나중에 if else 분기쳐서 나타내는 페이지 포워딩 기능 -->
	
</body>
</html>