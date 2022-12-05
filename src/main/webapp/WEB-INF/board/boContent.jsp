<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>boContent.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
		
		function goodCheck() {
			$.ajax({
				type: "post",
				url: "${ctp}/boGood.bo",
				data: {idx:${vo.idx}},
				success: function(res) {
					if(res=="1") {
						location.reload();
					}
					else {
						alert("이미 좋아요를 한번 누르셨습니다!");
						location.reload();
					}
				},
				error: function() {
					alert("전송 실패!");
				}
			});
		}
		function goodPlus() {
			$.ajax({
				type: "post",
				url: "${ctp}/boGoodPlus.bo",
				data: {idx:${vo.idx}},
				success: function() {
					location.reload();
				},
				error: function() {
					alert("전송 실패!");
				}
			});
		}
		function goodMinus() {
			$.ajax({
				type: "post",
				url: "${ctp}/boGoodMinus.bo",
				data: {idx:${vo.idx}},
				success: function() {
					location.reload();
				},
				error: function() {
					alert("전송 실패!");
				}
			});
		}
		
		/* 게시글 삭제 처리 */
		
		function boDelCheck() {
			let ans=confirm("현재 게시글을 삭제하시겠습니까?");
			
			if(ans) location.href="${ctp}/boDeleteOk.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&mid=${vo.mid}&flag=${flag}&search=${search}&searchString=${searchString}";
		}
		
		/* 댓글 작성 등록 처리 */
		
		function replyCheck() {
			
			let content=$("#content").val();
			
			if(content.trim()=="") {
				alert("댓글을 입력하세요!");
				$("#content").focus();
				return false;
			}
			
			let query= {
					boardIdx: ${vo.idx},
					mid: '${sMid}',
					nickName: '${sNickName}',
					content: content,
					hostIp: '${pageContext.request.remoteAddr}'
			}
			
			$.ajax({
				type: "post",
				url: "${ctp}/boReplyInput.bo",
				data: query,
				success: function(res) {
					if(res=="1") {
						alert("댓글 입력 완료!");
						location.reload();
					}
					else {
						alert("댓글 입력 실패!");
					}
				},
				error: function() {
					alert("전송 실패!");
				}
			});
		}
		
		function replyDelCheck(idx) {
			let ans=confirm("댓글을 삭제하시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				type: "post",
				url: "${ctp}/boReplyDeleteOk.bo",
				data: {idx: idx},
				success: function(res) {
					if(res=="1") {
						alert("댓글 삭제 완료!");
						location.reload();
					}
					else {
						alert("댓글 삭제 실패!");
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
	<h2>글 내용 보기</h2>
	<br/>
	<table class="table table-bordered">
		<tr>
			<td>접속된 IP: ${vo.hostIp}</td>
		</tr>
	</table>
	<table class="table table-bordered">
		<tr>
			<th>글쓴이</th>
			<td>${vo.nickName}</td>
			<th>작성일자</th>
			<td>${fn:substring(vo.wDate,0,fn:length(vo.wDate)-2)}</td>
		</tr>
		<tr>
			<th>글 제목</th>
			<td colspan="3">${vo.title}</td>
		</tr>
		<tr>
			<th>이메일 주소</th>
			<td>${vo.email}</td>
			<th>조회수</th>
			<td>${vo.readNum}</td>
		</tr>
		<tr>
			<th>홈페이지</th>
			<td>${vo.homePage}</td>
			<th>좋아요</th>
			<td><c:if test=""></c:if>
				<a href="javascript:goodCheck()" id="good">
					<font color="
					<c:if test="${fn:contains(color,vo.idx) && fn:contains(color,'red')}">red</c:if>
					<c:if test="${fn:contains(color,vo.idx) && fn:contains(color,'black')}">black</c:if>
					">❤</font>
				</a> ${vo.good} &nbsp;       
				<a href="javascript:goodPlus()">👍</a>
				<a href="javascript:goodMinus()">👎</a>
			</td>
		</tr>
		<tr>
			<th>글 내용</th>
			<td colspan="3" style="height: 250px;">${fn:replace(vo.content,newLine,'<br/>')}</td>
		</tr>
		<tr>
			<td colspan="4" class="text-center">
				<%-- <c:if test="${flag=='search'}"> --%>
					<%-- <input type="button" value="돌아가기" onclick="location.href='${ctp}/boSearch.bo?search=${search}&searchString=${searchString}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary" /> --%>
				<%-- </c:if> --%>
				<%-- <c:if test="${flag!='search'}"> --%>
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/boList.bo?pag=${pag}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}';" class="btn btn-secondary" />
					<c:if test="${(sMid eq vo.mid) || (sLevel=='0')}">
						<input type="button" value="글 수정" onclick="location.href='${ctp}/boUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary" />
						<input type="button" value="글 삭제" onclick="boDelCheck()" class="btn btn-secondary" />
					</c:if>
				<%-- </c:if> --%>
			</td>
		</tr>
	</table>
	
	<!-- 댓글 내용 보여주기 처리 -->
	
	<table class="table table-hover text-center">
		<tr>
			<th>작성자</th>
			<th>내용</th>
			<th>작성일자</th>
			<th>접속 IP</th>
		</tr>
		<c:forEach var="replyVo" items="${replyVos}">
			<tr>
				<td>
					${replyVo.nickName}
					<c:if test="${sMid==replyVo.mid||sLevel==0}">
						(<a href="javascript:replyDelCheck(${replyVo.idx})" title="삭제하기">✂</a>)
					</c:if>
				</td>
				<td>${replyVo.content}</td>
				<td>${replyVo.wDate}</td>
				<td>${replyVo.hostIp}</td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- 댓글 입력창 처리 -->
	
	<!-- <form name="replyForm" method="post" action=${ctp}/boReplyInput.bo"> -->
	<form name="replyForm">
		<table class="table text-center">
			<tr>
				<td style="width:85%;" class="text-left">
					글내용:
					<textarea rows="4" name="content" id="content" class="form-control"></textarea>
				</td>
				<td style="width:15%;">
					<br/>
					<p>작성자: ${sNickName}</p>
					<p>
						<input type="button" value="댓글 입력" onclick="replyCheck()" class="btn btn-secondary btn-sm" />
					</p>
				</td>
			</tr>
		</table>
		<%-- <input type="hidden" name="boardIdx" value="${vo.idx}" />
		<input type="hidden" name="hostIp" value="${pageContent.request.remoteAddr}" />
		<input type="hidden" name="mid" value="${sMid}" />
		<input type="hidden" name="nickName" value="${sNickName}" /> --%>
	</form>
	
	<!-- 이전 글 다음 글 처리 -->
	
	<c:if test="${flag!='search'}">
		<table class="table table-borderless">
			<tr>
				<td class="text-center">
					<c:if test="${prevVO.prevIdx!=0}">
						<a href="${ctp}/boContent.bo?idx=${prevVO.prevIdx}&pag=${pag}&pageSize=${pageSize}" class="btn btn-secondary btn-sm"> 👈 이전 글: ${prevVO.prevTitle}</a>
					</c:if>
					<c:if test="${nextVO.nextIdx!=0}">
						<a href="${ctp}/boContent.bo?idx=${nextVO.nextIdx}&pag=${pag}&pageSize=${pageSize}" class="btn btn-secondary btn-sm"> 👉 다음 글: ${nextVO.nextTitle}</a>
					</c:if>
				</td>
			</tr>
		</table>
	</c:if>
	
		
	
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>