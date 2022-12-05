<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>el3.jsp</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>EL을 통한 배열 처리 2</h2>
	<hr/>
	<%
		int[] num1=new int[5];
		for(int i=0; i<num1.length; i++) {
			num1[i]=(i+1)*10;
		}
		pageContext.setAttribute("num1",num1);

		int[] num2={10,2,3,4,50};
		pageContext.setAttribute("num2",num2);
	%>
	
	<h4>num1 배열에 담긴 값을 forEach를 통한 출력</h4>
	<c:forEach var="num1" items="${num1}" varStatus="st">
		${st.count} (num1[${st.index}]) . ${num1}<br/>
		
		<!-- 
		
		count 차례대로 수행횟수를 센다. 
		index 인덱스 번호를 차례대로 출력한다.
		
		-->
	</c:forEach>
	<hr/>
	<br/>
	<h4>EL에서의 연산 처리 (연산자 사용)</h4>
	1. num1[0] == num2[0]: ${num1[0] == num2[0]}<br/>
	2. num1[1] == num2[1]: ${num1[1] == num2[1]}<br/>
	3. num1[1] eq num2[1]: ${num1[1] eq num2[1]}<br/>
	4. num1[1] != num2[1]: ${num1[1] != num2[1]}<br/>
	5. num1[1] ne num2[1]: ${num1[1] ne num2[1]}<br/>
	6. num1[1] > num2[1]: ${num1[1] > num2[1]}<br/>
	7. num1[1] gt num2[1]: ${num1[1] gt num2[1]}<br/>
	8. num1[1] < num2[1]: ${num1[1] < num2[1]}<br/>
	9. num1[1] lt num2[1]: ${num1[1] lt num2[1]}<br/>
	10. num1[1] >= num2[1]: ${num1[1] >= num2[1]}<br/>
	11. num1[1] ge num2[1]: ${num1[1] ge num2[1]}<br/>
	12. num1[1] <= num2[1]: ${num1[1] <= num2[1]}<br/>
	12. num1[1] le num2[1]: ${num1[1] le num2[1]}<br/>
	<!-- EL 표기법에서의 비교는 중괄호 안에서의 비교! -->
	<hr/>
	<%
		ArrayList<String> arrVos=new ArrayList<>();
		arrVos.add("홍길동");
		arrVos.add("김말숙");
		arrVos.add("이기자");
		arrVos.add("오하늘");
		arrVos.add("소나무");
		
		pageContext.setAttribute("arrVos", arrVos);
	%>
	<h3>EL 표기법을 통한 객체 (ArrayList) 출력</h3>
	arrVos:${arrVos}<br/>
	arrVos[2]=${arrVos[2]}<br/>
	<c:forEach var="vo" items="${arrVos}" varStatus="st">
		${st.count}. ${vo}<br/>
	</c:forEach>
	<hr/>
	<%
		HashMap<String,String> mapVos=new HashMap<>();
		mapVos.put("성명", "홍길순");
		mapVos.put("나이", "25");
		mapVos.put("주소", "서울");
		
		pageContext.setAttribute("mapVos", mapVos);
	%>
	
	<h3>EL 표기법으로 객체 (map) 출력</h3>
	mapVos: ${mapVos}<br/>
	mapVos["성명"]: ${mapVos["성명"] }><br/>
	<hr/>
	
	<%
		pageContext.setAttribute("var1", "Null 값 처리");
		pageContext.setAttribute("var2", "");
		pageContext.setAttribute("var3", null);
	%>
	<h4>Null 값의 처리</h4>
	var1: ${var1}<br/>
	var2: ${var2}<br/>
	var3: ${var3}<br/>
	
	<hr/>
	
	== 비교 1: ${var1==""}<br/>
	== 비교 2: ${var2==""}<br/>
	== 비교 3	: ${var3==""}<br/>
	<hr/>
	null 비교 1: ${var1==null}<br/>
	null 비교 2: ${var2==null}<br/>
	null 비교 3	: ${var3==null}<br/>
	<hr/>
	연산자: empty, !empty (공백과 null 을 같은 값으로 취급한다.)<br/>
	""과 empty 비교 1: ${empty var1}<br/>
	""과 empty 비교 2: ${empty var2}<br/>
	""과 empty 비교 3: ${empty var3}<br/>
	
	Null과 !empty 비교 1: ${!empty var1}<br/>
	Null과 !empty 비교 2: ${!empty var2}<br/>
	Null과 !empty 비교 3: ${!empty var3}<br/>
	
	<!-- Null 값 및 날짜 시간 처리 때문에 시간 끄는 경우가 상당수 -->
</div>
<p><br/></p>
</body>
</html>