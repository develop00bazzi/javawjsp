<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memNickCheck.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
		/* 중복 아이디 재 검색하기 */
		function NickCheck() {
			let nickName=childForm.nickName.value;
			
			if(nickName.trim()=="") {
				alert("아이디를 입력하세요!");
				childForm.nickName.focus();
			}
			else {
				childForm.submit();
			}
		}
		
		function sendCheck() {
			opener.window.document.myform.nickName.value='${nickName}';
			opener.window.document.myform.pwd.focus();
			window.close();
		}
	</script>
</head>
<body>
<div class="container">
	<h3>아이디 체크 폼</h3>
	<c:if test="${res==1}">
		<h4><font color="red"><b>${nickName}</b></font>는 사용 가능한  닉네임입니다.</h4>
		<p><input type="button" value="창닫기" onclick="sendCheck()"/></p>
	</c:if>
	<c:if test="${res!=1}">
		<h4><font color="red"><b>${nickName}</b></font>는 이미 사용중인 닉네임입니다.</h4>
		<form name="child" method="post" action="${ctp}/memNickCheck.mem">
			<p>
				<input type="text" name="nickName"/>
				<input type="button" value="닉네임 재검색" onclick="NickCheck()" />
			</p>
		</form>
	</c:if>
</div>
</body>
</html>