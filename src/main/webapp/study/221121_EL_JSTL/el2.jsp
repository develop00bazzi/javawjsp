<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!-- 경로 지정할때 항상 경로를 길게 쓰기가 귀찮아서  JSTL을 이용해서 짧게 지정 후 EL 표기법으로 간단하게 지정 -->
<!-- 템플릿 지정할때 템플릿에서 $는 예약어라서 $에다가 $ 하나 더 붙여야 한다. -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>el2.jsp</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<h3>form 값을 통해서 전달받은 배열 값들의 처리</h3>
	<p>선택한 취미는?
		${hobbys[0]} /${hobbys[1]} /${hobbys[2]} /${hobbys[3]} /${hobbys[4]} /
		<!-- el문에서는 제어문을 쓰기가 어려움.. -->
	</p>
	<hr/>
	<h5>forEach를 활용한 배열 값의 출력</h5>
	<p>
		<c:forEach var="hobby" items="${hobbys}" varStatus="st">
			${hobby} /
		</c:forEach> 
	</p>
	<hr/>
	<p>
		<a href="${ctp}/study/221121_EL_JSTL/form2.jsp" class="btn btn-success">돌아가기</a>
	</p>
	<hr/>
	
</div>
<p><br/></p>
</body>
</html>