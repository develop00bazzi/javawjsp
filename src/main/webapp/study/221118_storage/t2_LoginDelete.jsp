<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- t2_LoginDelete -->

<%
	Cookie[] cookies=request.getCookies();

	String mid="";

	if(cookies!=null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("cMid")) {
				mid=cookies[i].getValue();
				pageContext.setAttribute("mid",mid);
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);	
				break;
			}
		}
	}

%>

<script>
	alert("'${mid}'님 쿠키의 아이디가 성공적으로 삭제되었습니다!");
	location.href="t2_LoginMember.jsp?mid=${mid}";
</script>