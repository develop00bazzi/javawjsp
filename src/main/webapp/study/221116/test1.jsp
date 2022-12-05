<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>test1.jsp</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<!-- 
	로그인 창에서 '아이디/성명'을 입력 후
	서버로 전송 후, 관리자 인증이 되면 인증 성공 창에서 입력된 '아이디/성명'을 모두 출력하시오.
 -->
<body>
<p><br/></p>
<div class="container">
	<form name="myform" method="post" action="test1Ok.jsp">
		<div><h2>로 그 인</h2></div>
		<p>
			아이디: <input type="text" name="mid" id="mid" value="admin" autofocus required class="form-control"/>
		</p>
		<p>
			비밀번호: <input type="password" name="pwd" id="pwd" value="1234" class="form-control"/>
		</p>
		<p>
			성명: <input type="text" name="name" id="name" value="홍길동" class="form-control"/>
		</p>
		
		<!-- 	
		<p>
			성명: <input type="text" name="name" id="name" class="form-control"/>
		</p> 
		-->
		<p>
			<input type="submit" value="전송" class="btn btn-success"/>
			<input type="button" value="다시 입력" class="btn btn-success"/>
		</p>
	</form>
</div>
<p><br/></p>
</body>
</html>