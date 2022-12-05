<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- t3_SessionSave.jsp -->

<%
	
	request.setCharacterEncoding("UTF-8");

	String mid = request.getParameter("mid")==null || request.getParameter("mid").equals("") ? "hkd1234" : request.getParameter("mid");
	int age = request.getParameter("age")==null || request.getParameter("age").equals("") ? 20 : Integer.parseInt(request.getParameter("age"));
	String nickName = request.getParameter("nickName")==null || request.getParameter("nickName").equals("") ? "홍장군" : request.getParameter("nickName");
	String name = request.getParameter("name")==null || request.getParameter("name").equals("") ? "홍길동" : request.getParameter("name");
	
	session.setAttribute("sMid",mid);
	session.setAttribute("sAge",age);
	session.setAttribute("sNickName",nickName);
	session.setAttribute("sName",name);

%>

<script>
	alert("${sName}님 세션 저장이 성공적으로 되었습니다!");
	location.href="t3_SessionMain.jsp";
</script>