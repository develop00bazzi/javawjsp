<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>crimeApi.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
		const API_KEY='jFKypSD1CBjAzGSrgt6jlOsgYVUHAXYSicxUmIc4agKz5f%2BpytNrcWnqXiRrHQcO6XcT1laYwMpdMUVSq1UD7w%3D%3D';
		
		/* 외부 데이터를 가져오는 방식! jQuery / fetch 방식 */
		
		async function getCrimeData() {
			let url="https://api.odcloud.kr/api/15084592/v1/uddi:21ec6fa1-a033-413b-b049-8433f5b446ff";
			url+="?page=1&perPage=100&serviceKey="+API_KEY;
			
			/* let url="https://api.odcloud.kr/api/15084592/v1/uddi:2eb5d218-6237-49be-ad8d-88c5063a979c?page=1&perPage=10&serviceKey=jFKypSD1CBjAzGSrgt6jlOsgYVUHAXYSicxUmIc4agKz5f%2BpytNrcWnqXiRrHQcO6XcT1laYwMpdMUVSq1UD7w%3D%3D"; */
			
			/* 앞의 지정한 url을 호출한다. (전송시까지 기다리기 위해 async 명령 사용, await 명령 사용 시는 함수명 앞에 꼭 async를 기술한다.) */
			
			const response=await fetch(url);
			
			/* 응답받은 데이터를 json 데이터 형식으로 변환하여 data 변수에 담는다. */
			
			const data=await response.json();
			
			console.log("Data", data);
			
			/* $("#demo").html(data); */
			
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">
	<div>
		<input type="button" value="강력 범죄 자료 조회" onclick="getCrimeData()" class="btn btn-success" />
	</div>
	<div id="demo"></div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>