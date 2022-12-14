<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>calender1.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<style>
		#td1,#td8,#td15,#td22,#td29,#td36 {
			color: red;
		}
		#td7,#td14,#td21,#td28,#td35,#td42 {
			color: blue;
		}
		.today {
			background-color: #eee;
			color:black;
			font-weight: bolder;
		}
	</style>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">
	<h2 class="text-center">달력 연습 1</h2>
	<div class="text-center">
		<button type="button" onclick="location.href='${ctp}/calendar1.st?yy=${yy-1}&mm=${mm}';" class="btn btn-secondary" title="이전 년도">⏪</button>
		<button type="button" onclick="location.href='${ctp}/calendar1.st?yy=${yy}&mm=${mm-1}';" class="btn btn-secondary" title="이전 달">◀</button>
		<font size="5">${yy}년 ${mm+1}월 </font>
		<button type="button" onclick="location.href='${ctp}/calendar1.st?yy=${yy}&mm=${mm+1}';" class="btn btn-secondary" title="다음 달">▶</button>
		<button type="button" onclick="location.href='${ctp}/calendar1.st?yy=${yy+1}&mm=${mm}';" class="btn btn-secondary" title="다음 년도">⏩</button><br/>
		&nbsp;
		<button type="button" onclick="location.href='${ctp}/calendar1.st?';" class="btn btn-secondary" title="오늘 날짜"><i class="fa fa-refresh"></i></button>
	</div>
	<br/>
	<div class="text-center">
		<table class="table table-bordered" stype="height:450px">
			<tr class="text-center" style="background-color: :#eee">
				<th style="width:13%; color:red; vertical-align:middle;">일</th>
				<th style="width:13%; vertical-align:middle;">월</th>
				<th style="width:13%; vertical-align:middle;">화</th>
				<th style="width:13%; vertical-align:middle;">수</th>
				<th style="width:13%; vertical-align:middle;">목</th>
				<th style="width:13%; vertical-align:middle;">금</th>
				<th style="width:13%; color:blue; vertical-align:middle;">토</th>
			</tr>
			<tr>
				<!-- 시작일 이전을 공백 처리 한다. (오늘이 목요일이면 startWeek가 5니까 1-4 칸을 공백처리한다.)-->
				<c:set var="gap" value="1" />
				<c:forEach begin="1" end="${startWeek-1}">
					<td>&nbsp;</td>
					<c:set var="gap" value="${gap+1}" />
				</c:forEach>
				
				<!-- 해당 월에 대한 날짜를 마지막 일자까지 반복해서 출력한다. (단, gap이 7이 되면 줄바꿈 처리한다.) -->
				
				<%-- <c:set var="cnt" value="${gap}" />	<!-- 토요일 일요일 숫자에 컬러를 주려고 변수를 받아 아이디를 설정 --> --%>
	
				<c:forEach begin="1" end="${lastDay}" varStatus="st">
					<c:set var="todaySw" value="${toYear==yy&&toMonth==mm&&toDay==st.count?1:0}" />
					<td id="td${gap}" ${todaySw==1?'class=today':''} >
						${st.count}
					</td>
					<c:if test="${gap%7==0}"></tr><tr></c:if>	<!-- 한줄이 꽉 차면 줄 바꾸기 처리한다. -->
					<c:set var="gap" value="${gap+1}" />
					<%-- <c:set var="cnt" value="${cnt+1}" /> --%>
				</c:forEach>
				
				
			</tr>
		</table>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>