<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<div class="jumbotron" style="width:800px; margin:0 auto;">
		<h2 style="text-align:center;">전체 회원 리스트</h2>
		<hr/>
		<p style="text-align:center;"><img src="${pageContext.request.contextPath}/images/3.png" width="300px"/></p>
		<hr/>
		<div style="text-align:center;">
			<table class="table table-hover">
				<tr class="table-dark text-dark">
					<th>번호</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>성명</th>
					<th>포인트</th>
					<th>최근 방문 일자</th>
				</tr>
				<%--<c:forEach var="변수" items="객체명" varStatus="매개변수"> --%>
				<c:forEach var="vo" items="${vos}" varStatus="st">
					<tr>
						<td>${vo.idx}</td>
						<td>${vo.mid}</td>
						<td>${vo.pwd}</td>
						<td>${vo.name}</td>
						<td>${vo.point}</td>
						<td>${vo.lastDate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<hr/>
		<div style="text-align:center;">
		<p><a href="${pageContext.request.contextPath}/study/221120_Database/member.jsp" class="btn btn-primary form-control">돌아가기</a></p>
		</div>
		<hr/>
	</div>
</div>
<p><br/></p>
</body>
</html>