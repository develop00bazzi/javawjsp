<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>form.jsp</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>자료 전송 연습</h2>
	<div>
		<form name="myform" method="post" action="${pageContext.request.contextPath}/study/j221121_el_jstl/El2"/>
			<div>
				name: <input type="text" name="name" value="홍길동" class="form-control"/>
			</div>
			<div>
				su1: <input type="text" name="su1" value="100" class="form-control"/>
			</div>
			<div>취미: 
				<input type="checkbox" name="hobby" value="독서" checked/>독서
				<input type="checkbox" name="hobby" value="수영" />수영
				<input type="checkbox" name="hobby" value="등산" />등산
				<input type="checkbox" name="hobby" value="바둑" />바둑
				<input type="checkbox" name="hobby" value="승마" />승마
			</div>
			<div>
				<input type="submit" value="전송" class="btn btn-success form-control"/>
			</div>
		</form>
	</div>
</div>
<p><br/></p>
</body>
</html>