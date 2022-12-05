<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- t1_CookiesSave.jsp -->

<%
	String mid="hkd1234";
	Cookie cookieMid=new Cookie("cMid",mid);	// 저장소 맨앞 알파벳 붙여주기! 저장소별로 구분하기 위해서
	cookieMid.setMaxAge(60*60*24);	// 쿠키의 만료 시간: 단위 '초', 1일(60*60*24)
	
	String pwd="1234";
	Cookie cookiePwd=new Cookie("cPwd",pwd);	// 저장소 맨앞 알파벳 붙여주기! 저장소별로 구분하기 위해서
	cookiePwd.setMaxAge(60*60*24);	// 쿠키의 만료 시간: 단위 '초', 1일(60*60*24)
	
	String job="학생";
	Cookie cookieJob=new Cookie("cJob",job);	// 저장소 맨앞 알파벳 붙여주기! 저장소별로 구분하기 위해서
	cookieJob.setMaxAge(60*60*24);	// 쿠키의 만료 시간: 단위 '초', 1일(60*60*24)
	
	/* 쿠키를 클라이언트에 저장하는 작업, 즉 사용자 컴퓨터에 저장. */
	
	response.addCookie(cookieMid);
	response.addCookie(cookiePwd);
	response.addCookie(cookieJob);
%>

<script>
	alert("쿠키가 성공적으로 저장되었습니다!");
	
	location.href="t1_CookiesMain.jsp";
</script>