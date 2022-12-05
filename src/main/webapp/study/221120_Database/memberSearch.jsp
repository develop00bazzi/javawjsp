<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>title</title>
	<jsp:include page="../../include/bs4.jsp"></jsp:include>
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
		<div>
			<table class="table table-bordered">
				<tr>
					<th>고유번호</th>
					<td>${vo.idx}</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${vo.mid}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${vo.pwd}</td>
				</tr>
				<tr>
					<th>성명</th>
					<td>${vo.name}</td>
				</tr>
				<tr>
					<th>보유 포인트</th>
					<td>${vo.point}</td>
				</tr>
				<tr>
					<th>최근 방문 일자</th>
					<td>${vo.mid}</td>
				</tr>
			</table>
		</div>
		<hr/>
		<div style="text-align:center;">
		<p><a href="${pageContext.request.contextPath}/study/221120_Database/member.jsp" class="btn btn-primary form-control">돌아가기</a></p>
		</div>
		<hr/>
	</div>
</div>
<p><br/></p>
</body>
</html>