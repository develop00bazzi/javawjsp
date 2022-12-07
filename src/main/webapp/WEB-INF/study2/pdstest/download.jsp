<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>download</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
		function fileDelete(file) {
			let ans=confirm("선택한 파일을 삭제하시겠습니까?");
			if(!ans) return false;
			
			$.ajax({
				type: "post",
				url: "${ctp}/fileDelete.st",
				data: {file:file},
				success:function(res) {
					if(res=="1") {
						alert("파일이 삭제되었습니다.");
						location.reload();
					}
					else {
						alert("파일 삭제 실패!")
					}
				},
				error: function() {
					alert("전송 실패");
				},
			});
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">
	<h2>서버에 저장된 파일 목록</h2>
	<p>${ctp}/data/pdstest/*.*</p>
	<hr/>
	<table class="table table-hover text-center">
		<tr>
			<th>번호</th>
			<th>파일명</th>
			<th>파일 형식</th>
			<th>비고</th>
		</tr>
		<c:forEach var="file" items="${files}" varStatus="st">
			<tr>
				<td>${st.count} </td>
				<c:set var="fNameArr" value="${fn:split(file,'.')}" />
				<td>
					<a href="${ctp}/data/pdstest/${file}" download="${file}">${file}</a><br>
					<a href="${ctp}/javaDown.st?file=${file}" >자바 방식 다운로드</a><br>
				</td>
				<td>
					<c:set var="extName" value="${fn:toLowerCase(fNameArr[fn:length(fNameArr)-1])}" />
					<c:if test="${extName=='zip'}">압축파일</c:if>
					<c:if test="${extName=='ppt'||extName=='pptx'}">프레젠테이션 파일</c:if>
					<c:if test="${extName=='jpg'||extName=='png'||extName=='gif'}">
						<img src="${ctp}/data/pdstest/${file}" width="150px" />
					</c:if>
					(${extName})
				</td>
				<td>
					<a href="#">다운로드</a>
					<a href="javascript:fileDelete('${file}')">삭제(aJax)</a>
				</td>
			</tr>	
		</c:forEach>
		<tr><td colspan="4" class="m-0 p-0"></td></tr>
	</table>
	<br/>
	<div>
		<a href="${ctp}/upLoad4.st" class="btn btn-secondary form-control">돌아가기</a>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>