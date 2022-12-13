<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	int level=session.getAttribute("sLevel")==null?99:(int)session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>

<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<script>
	'use strict';
	
	function memberDel(mid) {
		let ans=confirm("정말로 탈퇴하시겠습니까?");
		if(ans) {
			ans=confirm("탈퇴 후 1개월 동안은 같은 아이디로 가입하실 수 없습니다. \n 탈퇴하시겠습니까?");
			if(ans) {
				let pwd=prompt("비밀번호를 입력해주세요!");
				
				let midPwd={
						mid: mid,
						pwd: pwd
				}
				
				$.ajax({
					url: "${ctp}/memDeleteCheck.mem",
					type: "get",
					data: midPwd,
					success: function(res) {
						
						if(res=="1") {
							location.href="${ctp}/memDelete.mem";
						}
						else {
							alert("비밀번호가 맞지 않습니다!!!");
							location.reload();
						}
					},
					error: function() {
						alert("전송 실패!!!");
					}
				});
				
				
				
			}
				
		}
	}
</script>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="http://192.168.50.65:9090/javawjsp/">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${ctp}/guest/guList.gu">GUEST</a>
      </li>
      <c:if test="${level<=4}">
	      <li class="nav-item">
	        <a class="nav-link" href="${ctp}/boList.bo">BOARD</a>
	      </li>
	      <c:if test="${level!=1}">
		      <li class="nav-item">
		        <a class="nav-link" href="${ctp}/pdsList.pds">PDS</a>
		      </li>    
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">STUDY(1)</a>
			      <div class="dropdown-menu">
				      <a class="dropdown-item" href="${ctp}/pass.st">비밀번호 암호화</a>
				      <a class="dropdown-item" href="${ctp}/ajax1.st">AJax 연습</a>
				      <a class="dropdown-item" href="${ctp}/userList.st">AJax 연습 2</a>
				      <a class="dropdown-item" href="${ctp}/upLoad1.st">파일 업로드 연습 1(싱글 파일)</a>
				      <a class="dropdown-item" href="${ctp}/upLoad2.st">파일 업로드 연습 2(멀티 파일)</a>
				      <a class="dropdown-item" href="${ctp}/upLoad3.st">파일 업로드 연습 3(멀티 파일, 동적폼)</a>
				      <a class="dropdown-item" href="${ctp}/upLoad4.st">파일 업로드 연습 3(멀티 파일, 동적폼)</a>
			      </div>
		      </li>
		      <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">STUDY(2)</a>
			      <div class="dropdown-menu">
				      <a class="dropdown-item" href="${ctp}/calendar1.st">Calendar(1)</a>
				      <a class="dropdown-item" href="${ctp}/calendar2.st">Calendar(2)</a>
				      <a class="dropdown-item" href="${ctp}/stApi.st">공공 데이터 연습</a>
				    
			      </div>
		      </li>
	      </c:if>
	  <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">My Page</a>
	      <div class="dropdown-menu">
		      <a class="dropdown-item" href="${ctp}/memMain.mem">회원방</a>
		      <a class="dropdown-item" href="${ctp}/chatting/chat.jsp">채팅방</a>
		      <a class="dropdown-item" href="${ctp}/schedule.sc">일정관리</a>
		      <c:if test="${level!=1}">
		      	<a class="dropdown-item" href="${ctp}/memList.mem">회원 리스트</a>
		      </c:if>
		      <a class="dropdown-item" href="${ctp}/memUpdatePwd.mem">회원 비밀번호 변경</a>
		      <a class="dropdown-item" href="${ctp}/memPwdCheck.mem">회원 정보변경</a>
		      <a class="dropdown-item" href="javascript:memberDel('${sMid}')">회원 탈퇴</a>
		      <c:if test="${level==0}">
		      	<a class="dropdown-item" href="${ctp}/adMain.ad">관리자</a>
		      </c:if>
	      </div>
      </li>
      </c:if>
      <li class="nav-item">
      	<c:if test="${level>4}">
        	<a class="nav-link" href="${ctp}/memLogin.mem">Login</a>
        </c:if>
        <c:if test="${level<=4}">
        	<a class="nav-link" href="${ctp}/memLogout.mem">Logout</a>
        </c:if>
      </li>    
      <li class="nav-item">
	      <c:if test="${level>4}">
	        <a class="nav-link" href="${ctp}/memJoin.mem">Join</a>
	      </c:if>
      </li>    
    </ul>
  </div>  
</nav>