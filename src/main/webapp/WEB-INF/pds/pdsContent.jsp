<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>pdsContent.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
    'use strict';
		$(window).scroll(function(){
			if($(this).scrollTop() > 100 ){		// 100 픽셀이 넘어가면!
	      $("#topBtn").addClass("on");
	    }
	    else{
	      $("#topBtn").removeClass("on");
	    }
			
			$("#topBtn").click(function() {
			  window.scrollTo({ top: 0, behavior: "smooth" });  //페이지에서 특정 위치로 스크롤 이동시키기 위해서는 window.scrollTo 메서드를 사용
			});
		});
		
		/* 다운로드 횟수 증가 */
		function downNumCheck(idx) {
			$.ajax({
				type: "post",
				url: "${ctp}/pdsDownNum.pds",
				data: {idx:idx},
				success: function(res) {
					location.reload();
				},
				error: function() {
					alert("전송 오류");
				}
			});
		}
  </script>
  <style>
    th {
      background-color: #eee;
    }
    
		h6 {
		  position: fixed;
		  right: 1rem;
		  bottom: -50px;
		  opacity: 0;
		  transition: 0.7s ease;
		}
		.on {
		  opacity: 0.8;
		  cursor: pointer;
		  bottom: 0;
		}
  </style>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">
	<h2>자료실 내용 보기</h2>
	<hr/>
	<table class="table table-borderless">
		<tr>
			<td>접속된 IP: ${vo.hostIp}</td>
		</tr>
	</table>
	<table class="table table-bordered">
		<tr>
			<th>글쓴이</th>
			<td>${vo.nickName}</td>
			<th>작성일자</th>
			<td>${fn:substring(vo.fDate,0,fn:length(vo.fDate)-2)}</td>
		</tr>
		<tr>
			<th>글 제목</th>
			<td colspan="3">${vo.title}</td>
		</tr>
		<tr>
			<th>글 내용</th>
			<td colspan="3" style="height: 250px;">${fn:replace(vo.content,newLine,'<br/>')}</td>
		</tr>
		<tr>
			<th>파일</th>
			<td colspan="3">
				<c:set var="fNames" value="${fn:split(vo.fName,'/')}" />
					<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}" />
					<c:forEach var="fName" items="${fNames}" varStatus="st">
						<a href="${ctp}/data/pds/${fSNames[st.index]}" download="${fName}" onclick="downNumCheck(${vo.idx})">${fName}<br/>					
					</c:forEach>
			</td>
		</tr>
		<tr>
			<th>다운로드</th>
			<td colspan="3">${vo.downNum}</td>
		</tr>
		<tr>
			<th style="width: 10%">미리보기</th>
			<td colspan="3" class="text-center">
				<c:set var="fNames" value="${fn:split(vo.fName,'/')}" />
				<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}" />
				<c:forEach var="fName" items="${fNames}" varStatus="st">
					<c:set var="ext" value="${fn:split(fSNames[st.index],'.')}"/>
					<c:if test="${ext[fn:length(ext)-1]=='jpg'||ext[fn:length(ext)-1]=='png'||ext[fn:length(ext)-1]=='gif'}">
						<img src="${ctp}/data/pds/${fSNames[st.index]}" width="85%"/>
					</c:if>
					<c:if test="${ext[fn:length(ext)-1]!='jpg'&&ext[fn:length(ext)-1]!='png'&&ext[fn:length(ext)-1]!='gif'}">
						<p>현재 사진 파일 형식 외의 파일은 미리보기를 지원하지 않습니다.</p>
					</c:if>
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan="4" class="text-center">
				<%-- <c:if test="${flag=='search'}"> --%>
					<%-- <input type="button" value="돌아가기" onclick="location.href='${ctp}/boSearch.bo?search=${search}&searchString=${searchString}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary" /> --%>
				<%-- </c:if> --%>
				<%-- <c:if test="${flag!='search'}"> --%>
					<input type="button" value="돌아가기" onclick="location.href='${ctp}/pdsList.pds?part=${part}&pag=${pag}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}';" class="btn btn-secondary" />
					<%-- <c:if test="${(sMid eq vo.mid) || (sLevel=='0')}">
						<input type="button" value="글 수정" onclick="location.href='${ctp}/boUpdate.bo?idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}';" class="btn btn-secondary" />
						<input type="button" value="글 삭제" onclick="boDelCheck()" class="btn btn-secondary" />
					</c:if> --%>
				<%-- </c:if> --%>
			</td>
		</tr>
	</table>
</div>
<h6 id="topBtn" class=""><img src="${ctp}/images/arrowTop.gif"/></h6>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>