<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title></title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		function pwdReplace() {
			let res=confirm("임시 비밀번호를 재발급 받으시겠습니까?");
			if(res) {
				myform.submit();
			}
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">
	<div class="modal-dailog">
		<div class="modal-content">
			<div class="container" style="padding:30px">
				<form name="myform" method="post" action="${ctp}/memPwdSearchOk.mem" class="was-validated">
				<h2>회원 비밀번호 찾기</h2>
				<p>비밀번호를 찾으시려는 분의 성명과 아이디를 입력해주세요!</p>
				<p>현재 사이트 보안상 비밀번호 찾기가 불가능합니다. 사이트에서 제공하는 임시 비밀번호를 사용하여 로그인 후 비밀번호를 수정해주시기 바랍니다!</p>
				  <div class="form-group">
				    <label for="name">사용자 성명</label>
				    <input type="text" class="form-control" id="name" name="name" placeholder="비밀번호를 찾으시려는 분의 성명을 입력해주세요!"  required>
				    <div class="valid-feedback">성명 입력 완료!</div>
				    <div class="invalid-feedback">비밀번호를 찾으시려면 성명을 꼭 입력해주셔야 합니다!</div>
				  </div>
				  <div class="form-group">
				    <label for="mid">사용자 아이디</label>
				    <input type="text" class="form-control" id="mid" name="mid" placeholder="비밀번호를 찾으시려는 분의 성명을 입력해주세요!"  required>
				    <div class="valid-feedback">비밀번호 입력 완료!</div>
				    <div class="invalid-feedback">비밀번호를 재설정하시려 아이디를 꼭 입력해주셔야 합니다!</div>
				  </div>
				  <div class="form-group text-center">
					  <button type="button" onclick="javascript:pwdReplace()" class="btn btn-secondary">비밀번호 재설정</button>
					  <button type="reset" class="btn btn-secondary">정정</button>
					  <button type="button" onclick="location.href='${ctp}/memLogin.mem';" class="btn btn-secondary">돌아가기</button>
				  </div>
				  
				</form>
			</div>
		</div>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>