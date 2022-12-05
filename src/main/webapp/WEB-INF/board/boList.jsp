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
			location.href="${ctp}/boList.bo?pageSize="+pageSize+"&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}";
		}
		
		function searchCheck() {
			
			let searchString=$("#searchString").val();
			
			if(searchString.trim()=="") {
				alert("찾고자 하는 검색어를 입력해주세요.");
				searchForm.searchString.focus();
			}
			else {
				searchForm.submit();
			}
			
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">
	<a href="${ctp}/boList.bo"><h2 class="text-center">게시판 리스트</h2></a>
	 
	<br/>
	
	<table class="table table-borderless">
		<tr>
			<td class="text-left p-0">
				<c:if test="${sLevel!=1}">
					<a href="${ctp}/boInput.bo" class="btn btn-sm btn-secondary">글쓰기</a>
				</c:if>
			</td>
			<td class="text-right p-0">
				<select name="pageSize" id="pageSize" onchange="pCheck()">
					<option value="5" ${pageSize==5?'selected':''}>5건</option>
					<option value="10" ${pageSize==10?'selected':''}>10건</option>
					<option value="15" ${pageSize==15?'selected':''}>15건</option>
					<option value="20" ${pageSize==20?'selected':''}>20건</option>
				</select>
			</td>
		</tr>
	</table>
	

	<table class="table table-hover text-center">
		<tr class="table-dark text-dark">
			<th>번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>작성 일자</th>
			<th>조회수</th>
			<th>좋아요</th>
		</tr>
		<%-- <c:set var="curScrStartNo" value="${curScrStartNo}"/> --%>
	    <c:forEach var="vo" items="${vos}">
    	<tr>
			<td>${curScrStartNo}</td>
			<td class="text-left">
				<c:if test="${vo.hour_diff<=24}">
					<img src="${ctp}/images/new.gif"/>
				</c:if>
				<a href="${ctp}/boContent.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}">
					${vo.title}
				</a>
				<a>
					<c:if test="${vo.replyCnt!=0}">
						[${vo.replyCnt}]
					</c:if>
				</a>
			</td>
			<td>${vo.nickName}</td>
			<%-- <td>${fn:substring(vo.wDate,0,10)}(${vo.day_diff})</td> --%>
			<td>
				<c:if test="${vo.day_diff > 0}">
					<c:if test="${vo.hour_diff > 24}">
						${fn:substring(vo.wDate,0,10)}
					</c:if>
					<c:if test="${vo.hour_diff <= 24}">
						${fn:substring(vo.wDate,0,19)}
					</c:if>
				</c:if>
				<c:if test="${vo.day_diff <= 0}">                  
					${fn:substring(vo.wDate,11,19)}
				</c:if>
			</td>
			<td>${vo.readNum}</td>
			<td>${vo.good}</td>
    	</tr>
    	<c:set var="curScrStartNo" value="${curScrStartNo-1}"/>
    	</c:forEach>
    	<tr><td colspan="6" class="m-0 p-0"></tr>
  	</table>
  	
 
  	
  		<!-- 첫 페이지 | 이전블록 | 1(4) 2(5) 3(6) | 다음블록 | 마지막 페이지 -->
	<div class="text-center">
		<ul class="pagination justify-content-center">
			<c:if test="${pag>1}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/boList.bo?pag=1&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}" class="btn-sm btn-secondary">첫 페이지</a></li>
			</c:if>
			<c:if test="${curBlock>0}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/boList.bo?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}" class="btn-sm btn-secondary">이전 블록</a></li>
			</c:if>
			<c:forEach var="i" begin="${(curBlock)*blockSize+1}" end="${(curBlock)*blockSize+blockSize}" varStatus="st">
				<c:if test="${i<=totPage && i==pag}">
					<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/boList.bo?pag=${i}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}" class="btn-sm btn-secondary">${i}</a></li>
				</c:if>
				<c:if test="${i<=totPage && i!=pag}">
					<li class="page-item"><a class="page-link text-secondary" href="${ctp}/boList.bo?pag=${i}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}" class="btn-sm btn-secondary">${i}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${curBlock<lastBlock}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/boList.bo?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}" class="btn-sm btn-secondary">다음 블록</a></li>
			</c:if>
			<c:if test="${pag<totPage}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/boList.bo?pag=${totPage}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}" class="btn-sm btn-secondary">마지막 페이지</a></li>
			</c:if>
		</ul>
	</div>
	<br/>
	
	<!-- 검색기 처리 -->
	
	<div class="container text-center">
		<%-- <form name="searchForm" method="post" action="${ctp}/boSearch.bo"> --%>
		<form name="searchForm" method="post" action="${ctp}/boList.bo">
			<b>검색: </b>
			<select name="search">
				<option value="title">글 제목</option>
				<option value="nickName">글쓴이</option>
				<option value="content">글내용</option>
			</select>
			<input type="text" name="searchString" id="searchString" value="${searchString}"/>
			<input type="button" value="검색" onclick="searchCheck()" class="btn btn-sm btn-secondary" />
			<input type="hidden" name="pag" value="${pag}" />
			<input type="hidden" name="pageSize" value="${pageSize}" />
			<input type="hidden" name="flag" value="search"/>
		</form>
	</div>
	
	
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>