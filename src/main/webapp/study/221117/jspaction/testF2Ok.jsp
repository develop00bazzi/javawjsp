<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 앞에서 전송된 값들을 변수에 담는 작업 -->

<%-- 

<c:set var="name" value="${param.name}"/>
<c:set var="gender" value="${param.gender}"/>
<c:set var="age" value="${param.age}"/>
<c:set var="job" value="${param.job}"/>
<c:set var="address" value="${param.address}"/>

--%>



<!-- 자바 클래스(VO)를 사용하여 넘어온 값들을 저장하는 작업 -->

<!-- 자바 클래스는 JSP 액션 태그 (jsp:useBean)를 사용한다. -->

<jsp:useBean id="vo" class="study.j221117.Test1VO"/> 

<!-- 생성된 클래스에 값을 넣을때: jsp:setProperty 태그 사용 -->
<!-- 생성된 클래스에 값을 꺼낼때: jsp:getProperty 태그 사용 -->

<jsp:setProperty property="name" name="vo"/>
<jsp:setProperty property="gender" name="vo"/>
<jsp:setProperty property="age" name="vo"/>
<jsp:setProperty property="job" name="vo"/>
<jsp:setProperty property="address" name="vo"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../../include/bs4.jsp"></jsp:include>
</head>
<body>

<p><br/></p>
<div class="container">
	<h2>전송된 자료 결과 보기2</h2>
	<p>
		<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td>${name} / <jsp:getProperty property="name" name="vo"/></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${gender} / <jsp:getProperty property="gender" name="vo"/></td>
			</tr>
			<tr>
				<th>나이</th>
				<td>${age} / <jsp:getProperty property="age" name="vo"/></td>
			</tr>
			<tr>
				<th>직업</th>
				<td>${job} / <jsp:getProperty property="job" name="vo"/></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${address} / <jsp:getProperty property="address" name="vo"/></td>
			</tr>
		</table>
	</p>
	<hr/>
	<p><a href="${pageContext.request.contextPath}/study/221117/jspaction/test1.jsp" class="btn btn-primary form-control">돌아가기</a></p>
</div>
<p><br/></p>
</body>
</html>