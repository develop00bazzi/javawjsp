<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>jstl2.jsp</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>반복 처리 (forEach문)</h2>
	<pre>
		문법 1: < c : forEach var="변수" items="$ {배열 / 객체명}" varStatus="매개변수"">
					수행할 내용~
			  < / c: forEach>
			  
		문법 2: < c : forEach var="변수" begin="초기값" end="최종값" step="증감값" varStatus="매개변수" >
					수행할 내용~
			  < / c: forEach>
		문법 3: < c : forTokens var="변수" items="$ {배열/객체명} " delims="구분기호" >
					수행할 내용~
			  < / c: forEach>
			  기호가 들어간 자료들 처리할때 상당히 편함
	</pre>
	<p> 사용 예 1: <br/>
		<c:forEach var="i" begin="1" end="10" step="1">
			${i}. 안녕/ &nbsp;
		</c:forEach>
	</p>
	<p> 사용 예 2: <br/>
		<c:forEach begin="1" end="10" step="1" varStatus="st">
			${st.index} / ${st.count} / ${st.first} / ${st.last} </br>
			<!-- 객체에서 꺼낸 값들은 인덱스가 0부터 시작하지만 forEach문은 인덱스가 1부터 시작 -->
		</c:forEach>
	</p>
	<%
		String hobbys="등산/낚시/수영/바둑/영화 감상";
		pageContext.setAttribute("hobbys", hobbys);
	%>
	<p> 사용 예 3: 특정기호(토큰)을 이용한 분리: forTokens	 <br/>
		<c:forTokens var="hobby" items="${hobbys}" delims="/" varStatus="st">
			${st.count}.${hobby} </br>
			<!-- 객체에서 꺼낸 값들은 인덱스가 0부터 시작하지만 forEach문은 인덱스가 1부터 시작 -->
		</c:forTokens>
	</p>
	<hr/>
	
	<p>
		문제 1: 전송된 '취미' 중에서 '바둑'은 빨강색, '수영'은 파란색으로, 나머지는 있는 그대로 출력하시오.<br/>
	</p>
	<p>
		<c:forTokens var="hobby" items="${hobbys}" delims="/" varStatus="st">
			<c:choose>
				<c:when test="${hobby == '바둑'}"><font color="red">${hobby}</font><br/></c:when>
				<c:when test="${hobby == '수영'}"><font color="blue">${hobby}</font><br/></c:when>
				<c:otherwise>${hobby}<br/></c:otherwise>
			</c:choose>
			<!-- 객체에서 꺼낸 값들은 인덱스가 0부터 시작하지만 forEach문은 인덱스가 1부터 시작 -->
		</c:forTokens>
	</p>
	<hr/>
	<h3>2중 for문 활용 (구구단)</h3>
	<p>이중 반복문을 활용하여 3단에서 5단까지의 구구단을 출력하시오.</p>
	<c:forEach var="i" begin="3" end="5">
		${i}단<br/>
		<c:forEach var="j" begin="1" end="9">
			${i}*${j}=${i*j}<br/>
		</c:forEach>
		====================<br/>
	</c:forEach>
</div>
<p><br/></p>
</body>
</html>