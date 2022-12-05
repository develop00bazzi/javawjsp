<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>join.jsp</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
		function fCheck() {
			
			// 폼의 내용을 가져와서 유효성 검사 처리
			
			let mid=document.getElementById("mid").value;
			
			if(mid.trim()=="") {
				alert("아이디를 입력하세요. ");
				document.getElementById("mid").focus();
			}
			
			else {
				myform.submit();
			}
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="${pageContext.request.contextPath}/study/database/JoinOK">
		<div class="jumbotron" style="width:500px; margin:0 auto;">
			<h1 style="text-align:center;">회원가입</h1>
			<div>
				<p>아이디</p>
				<input type="text" name="mid" id="mid" required class="form-control" autofocus/>
			</div>
			<br/>	
			<div>
				<p>비밀번호</p>
				<input type="password" name="pwd" id="mid" required class="form-control"/>
			</div>
			<div>
				<p>성명</p>
				<input type="text" name="name" id="name" required class="form-control"/>
			</div>
			<br/>
			<div>
				<p><input type="button" value="회원가입" onclick="fCheck()" class="btn btn-success form-control"/></p>
				<br/>
				<p><input type="reset" value="다시 입력" class="btn btn-primary form-control"/></p>
				<br/>
				<p><input type="button" value="돌아가기" onclick="locaion.href='${pageContext.request.contextPath}/study/221120_Database/login.jsp';" class="btn btn-danger form-control"/></p>
			</div>
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>