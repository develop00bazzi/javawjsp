<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 
	MVC 2패턴 사용하면 EL 표기법만 사용하면 모두 다 출력이 가능.
 -->
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>main.jsp</title>
	<%--<%@ include file="../../include/bs4.jsp" %> --%>
  <jsp:include page="../../include/bs4.jsp"></jsp:include>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/study/1116h/product.css">
</head>
<body>
<div class="container">
	<!-- 헤더영역('메뉴/로고' 를 표시한다. -->
  <div id="header">
    <br/>
  	<%-- <%@ include file="menu.jsp" %> --%>
  	<jsp:include page="menu.jsp"></jsp:include>
  </div>
  <!-- 본문영역 -->
  <div id="content">
	  <br/>
	  <div class="text-center">
		  <h2>이곳은 메인 화면 입니다</h2>
		  <hr/>
		  <p><img src="${pageContext.request.contextPath}/images/1.png" width="400px"/></p>
	  </div>
		<br/>
  </div>
  <div id="footer">
    <%-- <%@ include file="footer.jsp" %> --%>
    <jsp:include page="footer.jsp"></jsp:include>
    <br/>
  </div>
</div>
</body>
</html>