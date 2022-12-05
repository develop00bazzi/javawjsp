<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>pass.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		function fCheck(idx) {
			let pwd=myform.pwd.value;
			if(pwd.trim()=="") {
				alert("비밀번호를 입력하세요");
				myform.pwd.focus();
			}
			else {
				if(idx==1) {
					myform.idx.value="1";
					myform.action="${ctp}/passOk1.st";
				}
				else if(idx==2) {
					myform.idx.value="2";
					myform.action="${ctp}/passOk1.st";
				}
				else {
					myform.action="${ctp}/passOk2.st";
				}
				/* document.getElementById("demo").innerHTML="<font color='red'><b>콘솔 창을 확인하세요!</b></font>";
				document.getElementById("demo2").innerHTML="<a href='${ctp}/pass.st' class='btn btn-secondary'>돌아가기</a>"; */
				myform.submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">
	<h2>비밀번호 암호화 연습</h2>
	<p>(비밀번호를 10자 이내로 입력하세요.)</p>
	<br/>
	<form name="myform" method="post">
		<table class="table table-bordered">
			<tr>
				<td>
					<p><input type="text" name="mid" value="hkd1234" class="form-control"/></p>
					<p><input type="password" name="pwd" maxlength="9" class="form-control"/></p>
					<p><input type="button" value="확인 (숫자 비밀번호)" onclick="fCheck(1)" class="form-control btn btn-secondary"/></p>
					<p><input type="button" value="확인 (혼합 비밀번호)" onclick="fCheck(2)" class="form-control btn btn-secondary"/></p>
					<p><input type="button" value="확인 (SHA256 암호화 방식)" onclick="fCheck(3)" class="form-control btn btn-secondary"/></p>
				</td>
			</tr>
		</table>
		<input type="hidden" name="idx" />
	</form>
	<!-- <div id="demo"></div>
	<div id="demo"></div> -->
	<p>비밀번호를 전송 후 콘솔 창을 확인하세요.</p>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>