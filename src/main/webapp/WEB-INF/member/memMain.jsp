<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memMain.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">
	<h2>회원 전용방</h2>
	<hr/>
	<p><font color="blue"><b>${sNickName}</b></font>님 로그인 중</p>
	<p>현재 <font color="blue"><b>${strLevel}</b></font>등급입니다.</p>
	<%-- <c:if test="${photo!=""}"> --%>
		<p><img src="${ctp}/data/member/${photo}"></p>
	<%-- </c:if> --%>
	<p>누적 포인트: ${point}</p>
	<p>최종 접속일: ${lastDate}</p>
	<p>총 방문 횟수: ${visitCnt}</p>
	<p>오늘 방문 횟수: ${todayCnt}</p>
	<hr/>
	<h4>활동 내역</h4>
	<p>방명록에 올린 글 수: ${sGuListCnt}</p>
	<p>게시판에 올린 글 수</p>
	<p>자료실에 올린 글 수</p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>