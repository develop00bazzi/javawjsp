<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
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
			let year=document.getElementById("year").value;
			let apiYear="";
			
			if(year==2015) apiYear="uddi:fbbfd36d-d528-4c8e-aa9b-d5cdbdeec669";
			else if(year==2016) apiYear="uddi:21ec6fa1-a033-413b-b049-8433f5b446ff";
			else if(year==2017) apiYear="uddi:67117bd9-5ee1-4e07-ae4a-bfe0861ee116";
			else if(year==2018) apiYear="uddi:2d687e27-b5c3-4bdb-9b77-c644dcafcbc7";
			else if(year==2019) apiYear="uddi:b6cc7731-181b-48e1-9a6c-ae81388e46b0";
			else if(year==2020) apiYear="uddi:fdde1218-987c-49ba-9326-8e3ba276141e";
	
			/* let url="https://api.odcloud.kr/api/15084592/v1/uddi:21ec6fa1-a033-413b-b049-8433f5b446ff";
			url+="?page=1&perPage=100&serviceKey="+API_KEY; */
			
			let url="https://api.odcloud.kr/api/15084592/v1/"+apiYear+"?page=1&perPage=100&serviceKey=jFKypSD1CBjAzGSrgt6jlOsgYVUHAXYSicxUmIc4agKz5f%2BpytNrcWnqXiRrHQcO6XcT1laYwMpdMUVSq1UD7w%3D%3D";
			
			/* 앞의 지정한 url을 호출한다. (전송시까지 기다리기 위해 async 명령 사용, await 명령 사용 시는 함수명 앞에 꼭 async를 기술한다.) */
			
			const response=await fetch(url);
			
			/* 응답받은 데이터를 json 데이터 형식으로 변환하여 data 변수에 담는다. */
			
			const res=await response.json();
			
			console.log("res", res);
			
			/* JSON 객체 타입을 HTML에 출력시켜주기 위해 문자열 형식으로 변경한다. */
			
			/* let strJson=JSON.stringify(data); */	// JSON 타입을 문자열로 바꾸는 방식
			
			/* let str="";
			for(let i=0; i<res.data.length; i++) {
				str+="경찰서: "+res.data[i].경찰서+"<br/>";
			} */
			
			
			let items=res.data.map((item,i)=>[
				(i+1)+". "
				+"발생년도: "+item.발생년도+"년"
				+"경찰서: "+item.경찰서
				+", 강도: "+item.강도+"건"
				+", 살인: "+item.살인+"건"
				+", 절도: "+item.절도+"건"
				+", 폭력: "+item.폭력+"건"
				+"<br/>"
			]);
			
			/* console.log("items"); */
			
			/* $("#demo").html(strJson); */
			$("#demo").html(items);
			
		}
		
		/* DB에 저장하기 */
		
		async function saveCrimeData() {
			let year=document.getElementById("year").value;
			let apiYear="";
			
			if(year==2015) apiYear="uddi:fbbfd36d-d528-4c8e-aa9b-d5cdbdeec669";
			else if(year==2016) apiYear="uddi:21ec6fa1-a033-413b-b049-8433f5b446ff";
			else if(year==2017) apiYear="uddi:67117bd9-5ee1-4e07-ae4a-bfe0861ee116";
			else if(year==2018) apiYear="uddi:2d687e27-b5c3-4bdb-9b77-c644dcafcbc7";
			else if(year==2019) apiYear="uddi:b6cc7731-181b-48e1-9a6c-ae81388e46b0";
			else if(year==2020) apiYear="uddi:fdde1218-987c-49ba-9326-8e3ba276141e";
	
			/* let url="https://api.odcloud.kr/api/15084592/v1/uddi:21ec6fa1-a033-413b-b049-8433f5b446ff";
			url+="?page=1&perPage=100&serviceKey="+API_KEY; */
			
			let url="https://api.odcloud.kr/api/15084592/v1/"+apiYear+"?page=1&perPage=100&serviceKey=jFKypSD1CBjAzGSrgt6jlOsgYVUHAXYSicxUmIc4agKz5f%2BpytNrcWnqXiRrHQcO6XcT1laYwMpdMUVSq1UD7w%3D%3D";
			
			/* 앞의 지정한 url을 호출한다. (전송시까지 기다리기 위해 async 명령 사용, await 명령 사용 시는 함수명 앞에 꼭 async를 기술한다.) */
			
			const response=await fetch(url);
			
			/* 응답받은 데이터를 json 데이터 형식으로 변환하여 data 변수에 담는다. */
			
			const res=await response.json();
			
			let query = "";
	    	for(let i=0; i<res.data.length; i++) {
	    		if(res.data[i].경찰서 != null) {
	    			query = {
	    					year : year,
	    					police : res.data[i].경찰서,
	    					burglar : res.data[i].강도,
	    					murder : res.data[i].살인,
	    					theft : res.data[i].절도,
	    					violence : res.data[i].폭력,
	    			}
	    			
	    			$.ajax({
	    				type  : "post",
	    				url   : "${ctp}/stCrimeSave.st",
	    				data  : query,
	    				error : function() {
	    					alert("전송오류");
	    				}
	    			});
	    		}
	    	}
	    	alert(year + "년도 자료가 DB에 저장되었습니다.");
		}
		
		function deleteCrimeData() {
			let ans=confirm("정말로 DB의 자료를 삭제하시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				type:"post",
				url:"${ctp}/stCrimeDelete.st",
				success:function(res) {
					if(res=="1") {
						alert("삭제 완료!");
						location.reload();
					}
					else {
						alert("삭제 실패!");
					}
				},
				error:function() {
					alert("전송 오류");
				}
			});
		}
	</script>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<p>
		<br />
	</p>
	<div class="container">
		<div>
			<select name="year" id="year">
				<c:forEach var="i" begin="2015" end="2020">
					<option value="${i}">${i}</option>
				</c:forEach>
			</select> 
			<input type="button" value="강력 범죄 자료 조회" onclick="getCrimeData()" class="btn btn-success" /> 
			<input type="button" value="DB 저장" onclick="saveCrimeData()" class="btn btn-secondary" /> 
			<input type="button" value="DB 삭제" onclick="deleteCrimeData()" class="btn btn-secondary" />
			<input type="button" value="DB출력" onclick="location.href='${ctp}/stCrimeList.st';" class="btn btn-warning"/>
   			<input type="button" value="DB분석" onclick="location.href='${ctp}/stCrimeTotalList.st';" class="btn btn-secondary"/>
		</div>
		<div id="demo"></div>
		<hr />
		<c:if test="${!empty vos}">
    <h3 class="text-center">범죄 통계 현황(총 : ${crimeCount}건)</h3>
    <table class="table table-hover">
      <tr class="table table-dark text-dark">
	      <th>번호</th>
	      <th>발생년도</th>
	      <th>관할 경찰서</th>
	      <th>강도</th>
	      <th>살인</th>
	      <th>절도</th>
	      <th>폭력</th>
      </tr>
      <c:forEach var="vo" items="${vos}" varStatus="st">
        <tr>
          <td>${st.count}</td>
          <td>${vo.year}</td>
          <td>${vo.police}</td>
          <td><fmt:formatNumber value="${vo.burglar}"/></td>
          <td><fmt:formatNumber value="${vo.murder}"/></td>
          <td><fmt:formatNumber value="${vo.theft}"/></td>
          <td><fmt:formatNumber value="${vo.violence}"/></td>
        </tr>
      </c:forEach>
      <tr><td colspan="7" class="m-0 p-0"></td></tr>
    </table>
  </c:if>
  <c:if test="${!empty totalVos}">
  	<h3 class="text-center">범죄 분석 현황</h3>
    <table class="table table-hover">
      <tr class="table table-dark text-dark">
	      <th>구분</th>
	      <th>발생년도</th>
	      <th>강도</th>
	      <th>살인</th>
	      <th>절도</th>
	      <th>폭력</th>
      </tr>
      <c:forEach var="vo" items="${totalVos}" varStatus="st">
        <tr>
          <td>${vo.part}</td>
          <td>${vo.year}</td>
          <td><fmt:formatNumber value="${vo.totBurglar}"/></td>
          <td><fmt:formatNumber value="${vo.totMurder}"/></td>
          <td><fmt:formatNumber value="${vo.totTheft}"/></td>
          <td><fmt:formatNumber value="${vo.totViolence}"/></td>
        </tr>
      </c:forEach>
      <tr><td colspan="6"><hr/></td></tr>
      <c:forEach var="vo" items="${avgVos}" varStatus="st">
        <tr>
          <td>${vo.part}</td>
          <td>${vo.year}</td>
          <td><fmt:formatNumber value="${vo.totBurglar}"/></td>
          <td><fmt:formatNumber value="${vo.totMurder}"/></td>
          <td><fmt:formatNumber value="${vo.totTheft}"/></td>
          <td><fmt:formatNumber value="${vo.totViolence}"/></td>
        </tr>
      </c:forEach>
      <tr><td colspan="7" class="m-0 p-0"></td></tr>
    </table>
  </c:if>
	</div>
	<p><br /></p>
	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>