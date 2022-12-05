<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>upLoad2.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		function fCheck() {
			let fName1=$("#file1").val();
			let fName2=$("#file2").val();
			let fName3=$("#file3").val();
			let ext1=fName1.substring(fName1.lastIndexOf(".")+1);	// 확장자 발췌
			let ext2=fName2.substring(fName2.lastIndexOf(".")+1);	// 확장자 발췌
			let ext3=fName3.substring(fName3.lastIndexOf(".")+1);	// 확장자 발췌
			let uExt1=ext1.toUpperCase();
			let uExt2=ext2.toUpperCase();
			let uExt3=ext3.toUpperCase();
			let maxSize=1024*1024*10;	// 업로드 가능한 최대 파일의 용량은 10MB로 한다.
			
			
			if(fName2.trim()=="" || fName2.trim()=="" || fName3.trim()=="") {
				alert("업로드할 파일을 3개 선택하세요.");
				return false;
			}
			
			let fileSize1=document.getElementById("file1").files[0].size;
			let fileSize2=document.getElementById("file2").files[0].size;
			let fileSize3=document.getElementById("file3").files[0].size;
			
			/* 파일이 여러개가 올 수도 있으므로 배열로 몇번째 파일인지 확인 */
			
			if(uExt1!="JPG" && uExt1!="GIF" && uExt1!="PNG" && uExt1!="ZIP" && uExt1!="HWP" && uExt1!="DOC" && uExt1!="PPT" && uExt1!="PPTX") {
				alert("1번 파일은 업로드 가능한 파일이 아닙니다. JPG/GIF/PNG/ 등의 문서 형식만 사용 가능합니다.");
				/* return false; */
			}
			else if(uExt2!="JPG" && uExt2!="GIF" && uExt2!="PNG" && uExt2!="ZIP" && uExt2!="HWP" && uExt2!="DOC" && uExt2!="PPT" && uExt2!="PPTX") {
				alert("2번 파일은 업로드 가능한 파일이 아닙니다. JPG/GIF/PNG/ 등의 문서 형식만 사용 가능합니다.");
				/* return false; */
			}
			else if(uExt3!="JPG" && uExt3!="GIF" && uExt3!="PNG" && uExt3!="ZIP" && uExt3!="HWP" && uExt3!="DOC" && uExt3!="PPT" && uExt3!="PPTX") {
				alert("3번 파일은 업로드 가능한 파일이 아닙니다. JPG/GIF/PNG/ 등의 문서 형식만 사용 가능합니다.");
				/* return false; */
			}
			else if(fileSize1>maxSize || fileSize2>maxSize || fileSize3>maxSize) {
				alert("업로드 할 수 있는 파일의 최대 용량은 10Mbyte입니다.")
			}
			else {
				myform.submit();
				/* alert("테스트"); */
			}
			
			
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">
	<h2>파일 업로드 테스트 1 (멀티 파일 처리)</h2>
	<p>cos 라이브러리를 이용한 파일 업로드</p>
	<hr/>
	<form name="myform" method="post" action="${ctp}/upLoad2Ok.st" enctype="multipart/form-data">
	<!-- method => get,post url 전송 방식.. -->
	<!-- 파일을 업로드할때는 인코딩 타입을 multipart 타입 방식으로 올린다. -->
	<!-- form-data (폼 안에 있는 파일을 전송한다는 의미로 form-data를 적어준다. -->
		<div>
			파일명:
			<input type="range" class="form-control-range">
			<input type="file" name="fName1" id="file1" class="form-control-file border mb-2" />
			<input type="file" name="fName2" id="file2" class="form-control-file border mb-2" />
			<input type="file" name="fName3" id="file3" class="form-control-file border mb-2" />
			<input type="button" value="전송" onclick="fCheck()" class="btn btn-secondary form-control" />
			<input type="hidden" name="upLoadFlag" value="2" />
		</div>
	</form>
	<hr/><br/>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>