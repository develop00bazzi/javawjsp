<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies=request.getCookies();

	String mid="";
	
	if(cookies!=null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				mid=cookies[i].getValue();
				pageContext.setAttribute("mid",mid);
				break;
			}
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>t2_Login.jsp</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="t2_LoginOk.jsp">
		<div class="jumbotron">
			<h1 style="text-align:center;">로그인</h1>
			<div>
				<p>아이디</p>
				<input type="text" name="mid" value="${mid}"class="form-control" autofocus/>
			</div>
			<br/>	
			<div>
				<p>비밀번호</p>
				<input type="password" name="pwd" class="form-control"/>
			</div>
			<br/>
			<div>
				<p><input type="submit" value="로그인" class="btn btn-success form-control"/></p>
				<br/>
				<p><input type="reset" value="재입력" class="btn btn-danger form-control	"/></p>
			</div>
		</div>
	</form>
</div>
<p><br/></p>
</body>
</html>