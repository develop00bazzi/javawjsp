<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
		function pCheck() {
			let pageSize=document.getElementById("pageSize").value;
			location.href="${ctp}/adMemList.ad?pageSize="+pageSize;
		}
	</script>
</head>
<body>
<div class="container">
	<br/>
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>아이디</th>
			<th>별명</th>
			<th>성명</th>
			<th>탈퇴 유무</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${vo.idx }</td>
				<td><a href="${ctp}/adMemInfor.ad?mid=${vo.mid}&pag=${pag}">${vo.mid }</a></td>
				<td>${vo.nickName }</td>
				<td>${vo.name }	<c:if test="${sLevel==0 && vo.userInfor=='비공개'}"><font color="red">비공개</font></c:if></td>
				<td>
					<c:if test="${vo.userDel=='OK' }"><font color="red">탈퇴 신청</font></a></c:if>
					<c:if test="${vo.userDel!='OK' }"><font color="blue">가입 상태</font></c:if>
				</td>
			</tr>
		</c:forEach>
		<tr><td colspan="8" class="m-0 p-0"></td></tr>
	</table>
</div>
</body>
</html>