<!-- 지시자(디렉티브) : 초기 환경을 설정할때 주로 사용한다. -->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>test2</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<p><br/></p>
<div class="container">
	<!-- HTML 주석 -->
	<%-- 이곳은 JSP 주석입니다. --%>
	<h2>이곳은 221111 폴더의 test1.jsp입니다.</h2>
	<%	// 스크립 틀릿(자바를 코드 작성하는 공간)
		// 이곳은 자바 한줄 주석
		/*
			여기는 자바 여러줄 주석
			..
			...
			....
		*/
		
		System.out.println("이곳은 jsp 파일 입니다.");
	
		out.println("<font color='red'><b>이곳은 jsp의 out메소드</font> 입니다.</b>");
	%>
	<hr/>
	<%="안녕하세요. 이곳은 <b>표현식(Expression)</b> 내부입니다.<br/>" %>
</div>
<p><br/></p>
</body>
</html>