<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>t5_LoginMember.jsp</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
		function searchMid() {
			let mid=prompt("찾고자 하는 아이디를 입력하세요.");
			
			location.href="${pageContext.request.contextPath}/study/database/SearchMid?mid="+mid;
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<div class="jumbotron" style="width:500px; margin:0 auto;">
		<h2 style="text-align:center;">회원 전용방</h2>
		<p style="text-align:center;"><font color="blue">${sName}</font>님 로그인 중입니다.</p>
		<hr/>
		<p style="text-align:center;"><img src="${pageContext.request.contextPath}/images/5.png" width="300px"/></p>
		<hr/>
		<p style="text-align:center;">
			현재 보유 중인 포인트: <font color='red'><b>${point}</b></font><br/>
			마지막 방문 날짜: <font color='red'><b>${sLastDate}</b></font>
		</p>
		<hr/>
			<div>
				<a href="javascript:searchMid()" class="btn btn-success form-control">개별 회원 조회</a>
			</div>
		<hr/>
			<div>
				<a href="${pageContext.request.contextPath}/study/database/MemberList" class="btn btn-danger form-control">회원 전체 조회</a>
			</div>
		<hr/>
		<div style="text-align:center;">
		<p><a href="${pageContext.request.contextPath}/study/database/LogOut" class="btn btn-primary form-control">로그아웃</a></p>
		</div>
		<hr/>
	</div>
</div>
<p><br/></p>
</body>
</html>