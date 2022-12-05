<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	Cookie[] cookies=request.getCookies();

	String mid="";
	String mid1="";
	mid1=request.getParameter("mid");
	
	if(cookies!=null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				mid=cookies[i].getValue();
				pageContext.setAttribute("mid",mid);
				break;
			}
		}
	}
	
	String imsiMid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	if(mid.equals("")) pageContext.setAttribute("mid", imsiMid);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>t2_LoginMember.jsp</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>회원 전용방</h2>
	<p><font color="blue">${mid}</font>님 로그인 중입니다.</p>
	<hr/>
	<p><img src="${pageContext.request.contextPath}/images/5.png" width="300px"/></p>
	<hr/>
	<div>
	<p><a href="${pageContext.request.contextPath}/study/221118_storage/t2_LoginDelete.jsp" class="btn btn-primary form-control">쿠키 아이디 삭제</a></p>
	<p><a href="${pageContext.request.contextPath}/study/221118_storage/t2_LogOut.jsp?mid=${mid}" class="btn btn-primary form-control">로그아웃</a></p>
	</div>
	<hr/>
</div>
<p><br/></p>
</body>
</html>