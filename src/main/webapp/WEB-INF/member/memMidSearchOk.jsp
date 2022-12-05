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
	<h2>아이디 검색 결과</h2>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>닉네임</th>
			<th>아이디</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${st.count}</td>
				<%-- <td>${vo.nickName}</td> --%>
				<td>*${fn:substring(vo.nickName,1,fn:length(vo.nickName))}</td>
				<%-- <td>${vo.mid}</td> --%>
				<td>**${fn:substring(vo.mid,2,fn:length(vo.mid))}</td>
			</tr>
		</c:forEach>
	</table>
	<div class="form-group text-center">
		<button type="button" onclick="location.href='${ctp}/memLogin.mem';" class="btn btn-secondary">로그인 창으로 이동</button>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>