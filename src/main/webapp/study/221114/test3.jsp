<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>title</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script>
		'use strict';
		
		function fCheck() {
			let product1=document.getElementById("product1").value;

			if(product1=="") {
				alert("첫번째 상품은 꼭 등록하셔야 주문이 가능합니다.");
				document.getElementById("product1").focus();
			}
			else {
				myform.submit();
			}
		}
	</script>
</head>
<body>
<p><br/></p>
<div class="container">
	<h2>상품 등록</h2>
	<form name="myform" method="post" action="<%=request.getContextPath()%>/221114_Test3Ok">
		<p>상품1: <input type="text" name="product" id="product1" autofocus /></p>
		<p>상품2: <input type="text" name="product" id="product2" /></p>
		<p>상품3: <input type="text" name="product" id="product3" /></p>
		<p>상품4: <input type="text" name="product" id="product4" /></p>
		<p>상품5: <input type="text" name="product" id="product5" /></p>
		<p>상품6: <input type="text" name="product" id="product6" /></p>
		<p>상품7: <input type="text" name="product" id="product7" /></p>
		<p>상품8: <input type="text" name="product" id="product8" /></p>
		<p>상품9: <input type="text" name="product" id="product9" /></p>
		<p>상품10: <input type="text" name="product" id="product10" /></p>
		<p>
			<input type="button" value="전송" onclick="fCheck()"/>
			<input type="reset" value="취소" />
		</p>
	</form>
</div>
<p><br/></p>
</body>
</html>