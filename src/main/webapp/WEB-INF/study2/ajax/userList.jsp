<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>userList</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		function userSearch(mid) {
			$("#mid").prop('readonly', true);
			$.ajax({
				type: "post",
				url: "${ctp}/userSearch.st",
				data: {mid:mid},
				success: function(res) {
					let str=res.split("/");

					$("#mid").val(str[1]);
					$("#name").val(str[2]);
					$("#age").val(str[3]);
					$("#address").val(str[4]);
				},
				error: function() {
					alert("전송 실패!");
				}
			});
		}
		function userDel(mid) {
			$("#mid").prop('readonly', false);
			$.ajax({
				type: "post",
				url: "${ctp}/userDel.st",
				data: {mid:mid},
				success: function(res) {
					if(res=='1') {
						alert("삭제 완료!");
						location.reload();
					}
					else {
						alert("삭제 실패!");
					}
				},
				error: function() {
					alert("전송 실패!");
				}
			});
		}
		
		function userInput() {
			$("#mid").prop('readonly', false);
			let mid=$("#mid").val();
			let name=$("#name").val();
			let age=$("#age").val();
			let address=$("#address").val();
			
			let user={
					mid:mid,
					name:name,
					age:age,
					address:address
			};
			
			$.ajax({
				type: "post",
				url: "${ctp}/userInput.st",
				data: user,
				success: function(res) {
					if(res=='1') {
						alert("새로운 user 등록 완료!");
						location.reload();
					}
					else {
						alert("user 등록 실패!");
					}
				},
				error: function() {
					alert("전송 실패!");
				}
			});
		}
		
		function userUpdate() {
			$("#mid").prop('readonly', true);
			let mid=$("#mid").val();
			let name=$("#name").val();
			let age=$("#age").val();
			let address=$("#address").val();
			
			if(mid.trim()==""||name.trim()==""||age.trim()==""||address.trim()=="") {
				alert("개별 회원 조회 후 수정을 눌러주시기 바랍니다.");
				myform.mid.focus();
			}
			
			let user={
					mid:mid,
					name:name,
					age:age,
					address:address
			};
			
			$.ajax({
				type: "post",
				url: "${ctp}/userUpdate.st",
				data: user,
				success: function(res) {
					if(res=='1') {
						alert("회원 정보 수정 성공!");
						location.reload();
					}
					else {
						alert("회원 정보 수정 실패!");
					}
				},
				error: function() {
					alert("전송 실패!");
				}
			});
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">
	<h2>AJax 연습</h2>
	
	<hr/>
	<form>
		<table class="table table-hover text-center">
			<tr class="table table-dark text-dark">
				<td colspan="2" class="text-center"><h3>user '가입/수정' 폼</h3></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mid" id="mid" class="form-control"/></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" id="name" class="form-control"/></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" name="age" id="age" class="form-control"/></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="address" class="form-control"/></td>
			</tr>
			<tr class="table table-dark text-dark">
				<td colspan="2" class="text-center">
					<input type="button" value="유저 등록" onclick="userInput()" class="btn btn-secondary"/>
					<input type="reset" value="다시 입력" class="btn btn-secondary"/>
					<input type="button" value="User 수정" onclick="userUpdate()" class="btn btn-secondary"/>
					<input type="button" value="전체 보기" onclick="location.href='${ctp}/userList.st';" class="btn btn-secondary"/>
				</td>
			</tr>
			
			
		</table>
	</form>
	<hr/>
	
	<h3>전체 리스트</h3>
	<br/>
	<table class="table table-hover text-center">
		<tr class="table table-dark text-dark">
			<th>번호</th>
			<th>아이디</th>
			<th>성명</th>
			<th>나이</th>
			<th>주소</th>
			<th>비고</th>
		</tr>
		<c:forEach var="vo" items="${vos}" >
			<tr>
				<td>${vo.idx}</td>
				<td>${vo.mid}</td>
				<td>${vo.name}</td>
				<td>${vo.age}</td>
				<td>${vo.address}</td>
				<td>
					<a href="javascript:userSearch('${vo.mid}')" class="btn btn-secondary">개별조회</a>
					<a href="javascript:userDel('${vo.mid}')" class="btn btn-secondary">삭제</a>
				</td>
			</tr>
		</c:forEach>	
		<tr><td colspan="6" class="m-0 p-0"></td></tr>
	</table>

</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>