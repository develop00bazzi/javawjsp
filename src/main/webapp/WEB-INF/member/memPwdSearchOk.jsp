<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">
	<h2>임시 비밀번호 발급 확인창</h2>
	<p>${sName}님의 임시 비밀번호 발급 결과입니다.</p>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>성명</th>
			<th>아이디</th>
			<th>임시 비밀번호</th>
		</tr>
		<tr>
			<td>${sName }</td>
			<td>${sMid }</td>
			<td>${sTempPassword }</td>
		</tr>
	</table>	
	<div class="form-group text-center">
		<button type="button" onclick="location.href='${ctp}/memLogin.mem';" class="btn btn-secondary">로그인 창으로 이동</button>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>