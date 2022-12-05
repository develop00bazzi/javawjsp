<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>upLoad1.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		function fCheck() {
			let fName=$("#file").val();
			let ext=fName.substring(fName.lastIndexOf(".")+1);	// 확장자 발췌
			let uExt=ext.toUpperCase();
			let maxSize=1024*1024*10;	// 업로드 가능한 최대 파일의 용량은 10MB로 한다.
			
			
			if(fName.trim()=="") {
				alert("업로드할 파일을 선택하세요.");
				return false;
			}
			
			let fileSize=document.getElementById("file").files[0].size;
			
			/* 파일이 여러개가 올 수도 있으므로 배열로 몇번째 파일인지 확인 */
			
			if(uExt!="JPG" && uExt!="GIF" && uExt!="PNG" && uExt!="ZIP" && uExt!="HWP" && uExt!="DOC" && uExt!="PPT" && uExt!="PPTX") {
				alert("업로드 가능한 파일이 아닙니다. JPG/GIF/PNG/ 등의 문서 형식만 사용 가능합니다.");
				/* return false; */
			}
			else if(fileSize>maxSize) {
				alert("업로드 할 수 있는 파일의 최대 용량은 10Mbyte입니다.")
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
	<h2>파일 업로드 테스트 1 (싱글 파일 처리)</h2>
	<p>cos 라이브러리를 이용한 파일 업로드</p>
	<hr/>
	<form name="myform" method="post" action="${ctp}/upLoad1Ok.st" enctype="multipart/form-data">
	<!-- method => get,post url 전송 방식.. -->
	<!-- 파일을 업로드할때는 인코딩 타입을 multipart 타입 방식으로 올린다. -->
	<!-- form-data (폼 안에 있는 파일을 전송한다는 의미로 form-data를 적어준다. -->
		<div>
			파일명:
			<input type="range" class="form-control-range">
			<input type="file" name="fName" id="file" class="form-control-file border mb-2" />
			<input type="button" value="전송" onclick="fCheck()" class="btn btn-secondary form-control" />
		</div>
	</form>
	<hr/><br/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>