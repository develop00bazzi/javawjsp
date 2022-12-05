<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memLogin.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
	
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">
	<div class="modal-dailog">
		<div class="modal-content">
			<div class="container" style="padding:30px">
				<form name="myform" method="post" action="${ctp}/memLoginOk.mem" class="was-validated">
				<h2>회원 로그인</h2>
				<p>회원 아이디와 비밀번호를 입력해주세요.</p>
				  <div class="form-group">
				    <label for="mid">회원 아이디</label>
				    <input type="text" class="form-control" id="mid" name="mid" value="${mid}" placeholder="회원 아이디를 입력하세요."  required>
				    <div class="valid-feedback">회원 아이디 입력 완료</div>
				    <div class="invalid-feedback">회원 아이디 입력은 필수입니다!</div>
				  </div>
				  <div class="form-group">
				    <label for="pwd">비밀번호</label>
				    <input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요." required>
				    <div class="valid-feedback">비밀번호 입력 완료</div>
				    <div class="invalid-feedback">비밀번호 입력은 필수입니다!</div>
				  </div>
				  <div class="form-group text-center">
					  <button type="submit" class="btn btn-secondary">로그인</button>
					  <button type="reset" class="btn btn-secondary">정정</button>
					  <button type="button" onclick="location.href='${ctp}/memJoin.mem';" class="btn btn-secondary">회원가입</button>
					  <button type="button" onclick="location.href='${ctp}/';" class="btn btn-secondary">돌아가기</button>
				  </div>
				  <div class="row text-center" style="font-size:12px">
				  	<span class="col">
				  	<p><input type="checkbox" name="idCheck" checked />아이디 저장</p>
				  	<!-- </span>
				  	<span class="col text-right"> -->
				  		<a href="${ctp}/memMidSearch.mem" class="btn-sm btn-secondary">아이디 찾기</a>
				  		<a href="${ctp}/memPwdSearch.mem" class="btn-sm btn-secondary">비밀번호 찾기</a>
				  	</span>
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