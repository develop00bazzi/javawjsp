<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- t1_CookiesDelete.jsp -->

<%
	Cookie[] cookies=request.getCookies();

	if(cookies!=null) {
		for(int i=0; i<cookies.length; i++) {
			// 쿠키 이름을 비교해서 필요한 값만 지우기도 가능.
			cookies[i].setMaxAge(0);	// 쿠키의 만료시간을 다시 0으로 설정하므로써 쿠키를 제거한다.
			response.addCookie(cookies[i]);	// 만료시간이 0이 된 쿠키를 다시 쿠키에 추가.	
		}
	}

%>

<script>
	alert("쿠키가 성공적으로 삭제되었습니다!");
	
	location.href="t1_CookiesMain.jsp";
</script>