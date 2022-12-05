<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>t4_ApplicationMain.jsp</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>어플리케이션 연습 메인 메뉴</h2>
	<hr/>
	<form name="myform" method="post" action="t4_ApplicationSave.jsp">
		<table class="table">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid" value="${sMid}" autofocus class="form-control"/></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="nickName" value="${sNickName}" class="form-control"/></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" name="age" value="${sAge}" class="form-control"/></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" value="${sName}" class="form-control"/></td>
			</tr>
		</table>
		<div class="row">
			<div class="col"><input type="submit" value="Application 저장 (서버 기동 후 처음 1회만 수행!)" class="btn btn-success form-control" /></div>
			<div class="col"><a href="t4_ApplicationCheck.jsp" class="btn btn-success form-control">어플리케이션 확인</a></div>
			<div class="col"><a href="t4_ApplicationDeleteAll.jsp" class="btn btn-success form-control">전체 어플리케이션 삭제</a></div>
			<div class="col"><a href="t4_ApplicationDelNick.jsp" class="btn btn-success form-control">닉네임 어플리케이션 삭제</a></div>
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>