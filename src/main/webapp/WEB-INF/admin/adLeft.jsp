<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>adContent.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body style="background-color: gray; color: white;">
<p><br/></p>
<div class="container text-center">
	<h5><a href="${ctp}/adMain.ad">관리자 메뉴</a></h5>
	<hr/>
	<p>
		<a href="${ctp}/" target="_top">홈으로</a>
	</p>
	<hr/>
	<p>
		<a href="#">방명록 리스트</a>
	</p>
	<hr/>
	<p>
		<a href="${ctp}/adMemList.ad" target="adContent">회원 관리</a>
	</p>
</div>
<p><br/></p>
</body>
</html>