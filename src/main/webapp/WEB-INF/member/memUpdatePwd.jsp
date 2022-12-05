<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memUpdatePwd.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
		const reg_pwd = /(?=.*\d)(?=.*[a-zA-ZS]).{8,}/; // 문자, 숫자 1개이상 포함, 8자리 이상
		
		function fCheck() {
			
			let oldPwd=document.getElementById("oldPwd").value;
			let newPwd=document.getElementById("newPwd").value;
			let rePwd=document.getElementById("rePwd").value;
			
			if(oldPwd.trim()=="") {
				alert("기존 비밀번호를 입력하세요.");
				document.getElementById("oldPwd").focus;
			}
			else if(newPwd.trim()=="") {
				alert("기존 비밀번호를 입력하세요.");
				document.getElementById("newPwd").focus;
			}
			else if(rePwd.trim()=="") {
				alert("새로운 비밀번호 확인을 해주세요!");
				document.getElementById("rePwd").focus;
			}
			else if(!newPwd.trim().match(reg_pwd))   {
				alert("비밀번호는 문자 및 숫자 1개이상 포함해야 하며  8자리 이상 입력해야 합니다.");
				document.getElementById("newPwd").focus;
			}
			else if(newPwd!=rePwd) {
				alert("새로운 비밀번호와 비밀번호 확인란이 같지 않습니다!");
				document.getElementById("newPwd").focus;
			}
			else if(newPwd==oldPwd) {
				alert("새로운 비밀번호와 기존 비밀번호가 같습니다!");
				document.getElementById("newPwd").focus;
			}
			else {
				myform.submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="${ctp}/memUpdatePwdOk.mem" class="was-validated">
		<h2 class="text-center">비밀번호 변경</h2>
		<table class="table table-bordered">
			<tr>
				<th>기존 비밀번호</th>
				<td>
					<input type="password" name="oldPwd" id="oldPwd" autofocus required class="form-control"/>
					<div class="invalid-feedback">기존 비밀번호를 입력하세요.</div>
				</td>
			</tr>
			<tr>
				<th>새로운 비밀번호</th>
				<td>
					<input type="password" name="newPwd" id="newPwd" required class="form-control"/>
					<div class="invalid-feedback">새로운 비밀번호를 입력하세요.</div>
				</td>
			</tr>
			<tr>
				<th>새로운 비밀번호 확인</th>
				<td>
					<input type="password" name="rePwd" id="rePwd" required class="form-control"/>
					<div class="invalid-feedback">새로운 비밀번호를 다시 입력하세요.</div>
				</td>
			</tr>
			<tr>
				<td conspan="2" class="text-center">
					<input type="button" value="비밀번호 변경" onclick="fCheck()" class="btn btn-secondary"/> &nbsp
					<input type="reset" value="다시 입력" class="btn btn-secondary"/> &nbsp
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/memMain.mem';" class="btn btn-secondary"/> 
				</td>
			</tr>
		</table>
	</form>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>