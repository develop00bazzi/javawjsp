<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="/study/221117/error/error500.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>test2.jsp</title>
	<jsp:include page="../../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>에러 코드 발생 페이지 2</h2>
	<%
		int su=10/0;
	%>
</div>
<p><br/></p>
</body>
</html>