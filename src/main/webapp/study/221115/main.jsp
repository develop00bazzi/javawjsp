<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sw=request.getParameter("sw")==null?"":request.getParameter("sw");
%>
<!-- 기본적인 페이지 설정 -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>main.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<style>
	body {
		width:1000px;
		margin:0px auto;
		pagging:0px;
	}
	#header {
		background-color:aqua;
		text-align:center;
		height:80px;
	}
	#footer {
		background-color:#ccc;
		text-align:center;
		height:80px;
	}
	#content {
		background-color:#fff;
		text-align:center;
	}
</style>
<body>
<p><br/></p>
<div class="container">

	<!-- 헤더 영역 (메뉴 / 로고 를 표시한다.) -->

	<div id="header">
		<%@ include file="menu.jsp" %>
		<!-- include 지시자 -->
	</div>
	
	<!-- 본문 영역 -->
	<div id="content">
	<br/>
	<% if(sw.equals("guest")) { %>
		<%@ include file="guest.jsp" %>
	<%} else if(sw.equals("board")) { %>
		<%@ include file="board.jsp" %>
	<%} else if(sw.equals("pds")) { %>
		<%@ include file="pds.jsp" %>
	<%} else if(sw.equals("photo")) { %>
		<%-- <%@ include file="photo.jsp" %> --%>
		<jsp:include page="photo.jsp"></jsp:include>
	
	<%} else { %>
	<h2>이곳은 메인 화면 입니다.</h2>
	<p><img src="../../images/3.png" width="600px"/></p>
	<% } %>
	<br/>
	</div>
	<!-- 푸터 영역 (Copyright나 주소, 소속, 작성자 등을 기술. )-->
	<div id="footer">
		<%@ include file="footer.jsp" %>
	</div>
</div>
<p><br/></p>
</body>
</html>