<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>title</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
		function pCheck() {
			let pageSize=document.getElementById("pageSize").value;
			location.href="${ctp}/memList.mem?pageSize="+pageSize;
		}
		
		function midSearch() {
			let mid=myform.mid.value;
			if(mid.trim()=="") {
				alert("아이디를 입력하세요!");
				myform.mid.focus();
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
	<h2>전체 회원 리스트</h2>
	<br/>
	<form name="myform" method="post" action="${ctp}/memberSearch.mem">
		<div class="row mb-2">
			<div class="col form-inline">
				<input type="text" name="mid" class="form-control" autofocus />&nbsp;
				<input type="button" value="회원 개별 검색" onclick="midSearch();" class="btn btn-secondary" />
			</div>
			<div class="col text-right"><button type="button" onclick="location.href='${ctp}/memList.mem';" class="btn btn-secondary">전체 검색</button></div>
		</div>
<%-- 	<input type="hidden" value="${sLevel}" /> --%>
	</form>
	<table class="table table-borderless m-0 p-0">
		<tr>
			<td style="text-align:left;">
				<form>
					<p>
						회원정보 조회 수
						<select id="pageSize" onchange="pCheck()">
							 <option value="5" <c:if test="${pageSize==5}">selected</c:if>>5개</option> 
							 <option value="10" <c:if test="${pageSize==10}">selected</c:if>>10개</option>
							 <option value="15" <c:if test="${pageSize==15}">selected</c:if>>15개</option>
							 <option value="20" <c:if test="${pageSize==20}">selected</c:if>>20개</option>
<%-- 							 <c:if test=""></c:if> --%>
						</select>
					</p>
				</form>
			</td>
			<td style="text-align:right;">
				<!-- 첫 페이지 / 이전 페이지 / 현 페이지 번호 /총 페이지 수) / 다음 페이지 / 마지막 페이지 -->
				<c:if test="${pag>1}">
					<a href="${ctp}/memList.mem?pag=1&pageSize=${pageSize}" class="btn-sm btn-secondary">첫 페이지</a>
					<a href="${ctp}/memList.mem?pag=${pag-1}&pageSize=${pageSize}" class="btn-sm btn-secondary">이전 페이지</a>
				</c:if>
				${pag}/${totPage}
				<c:if test="${pag<totPage}">
					<a href="${ctp}/memList.mem?pag=${pag+1}&pageSize=${pageSize}"  class="btn-sm btn-secondary"> 다음 페이지</a>
					<a href="${ctp}/memList.mem?pag=${totPage}&pageSize=${pageSize}"  class="btn-sm btn-secondary"> 마지막 페이지</a>
				</c:if>
			</td>
		</tr>
	</table>
	
	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>아이디</th>
			<th>별명</th>
			<th>성명</th>
			<th>성별</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td>${vo.idx }</td>
				<td><a href="${ctp}/memInfor.mem?mid=${vo.mid}&pag=${pag}">${vo.mid }</a></td>
				<td>${vo.nickName }</td>
				<td>${vo.name }	<c:if test="${sLevel==0 && vo.userInfor=='비공개'}"><font color="red">비공개</font></c:if></td>
				<td>${vo.gender }</td>
			</tr>
		</c:forEach>
		<tr><td colspan="5" class="m-0 p-0"></td></tr>
	</table>
	

	<!-- 첫 페이지 | 이전블록 | 1(4) 2(5) 3(6) | 다음블록 | 마지막 페이지 -->
	<div class="text-center">
		<ul class="pagination justify-content-center">
			<c:if test="${pag>1}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?pag=1&pageSize=${pageSize}" class="btn-sm btn-secondary">첫 페이지</a></li>
			</c:if>
			<c:if test="${curBlock>0}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}" class="btn-sm btn-secondary">이전 블록</a></li>
			</c:if>
			<c:forEach var="i" begin="${(curBlock)*blockSize+1}" end="${(curBlock)*blockSize+blockSize}" varStatus="st">
				<c:if test="${i<=totPage && i==pag}">
					<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/memList.mem?pag=${i}&pageSize=${pageSize}" class="btn-sm btn-secondary">${i}</a></li>
				</c:if>
				<c:if test="${i<=totPage && i!=pag}">
					<li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?pag=${i}&pageSize=${pageSize}" class="btn-sm btn-secondary">${i}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${curBlock<lastBlock}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}" class="btn-sm btn-secondary">다음 블록</a></li>
			</c:if>
			<c:if test="${pag<totPage}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/memList.mem?pag=${totPage}&pageSize=${pageSize}" class="btn-sm btn-secondary">마지막 페이지</a></li>
			</c:if>
		</ul>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>