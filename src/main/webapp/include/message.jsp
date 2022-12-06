<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<title>message.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
		let msg="${msg}";
		let url="${url}";
		let val="${val}";
		
		if(msg=="guInputOk") msg="방명록에 글이 등록되었습니다.";
		else if(msg=="guInputNo") msg="방명록에 글 등록을 실패하였습니다.";
		else if(msg=="adminLoginOk") msg="관리자 인증 성공!";
		else if(msg=="adminLoginNo") msg="관리자 인증 실패!";
		else if(msg=="adminLogoutOk") msg="관리자님 로그아웃 되었습니다!";
		else if(msg=="guDeleteOk") msg="방명록의 글이 삭제되었습니다!";
		else if(msg=="guDeleteNo") msg="방명록의 글을 삭제하는데 실패하였습니다!";
		else if(msg=="loginOk") msg=val+" 님 로그인 하셨습니다!";
		else if(msg=="memLogoutOk") msg=val+" 님 로그아웃 하셨습니다!";
		else if(msg=="loginNo") msg="로그인 실패!";
		else if(msg=="idCheckNo") msg="중복된 아이디입니다!";
		else if(msg=="nickCheckNo") msg="중복된 닉네임입니다!";
		else if(msg=="memJoinOk") msg="회원가입이 정상적으로 되셨습니다!";
		else if(msg=="memJoinNo") msg="회원가입이 정상적으로 되지 않았습니다!";
		else if(msg=="passwordNo") msg="비밀번호를 확인하세요!";
		else if(msg=="passwordOk") msg="비밀번호를 변경하였습니다!";
		else if(msg=="passwordOkNo") msg="비밀번호를 변경하는데 실패하였습니다!";
		else if(msg=="passwordYes") msg="회원 정보 변경 페이지로 이동합니다!";
		else if(msg=="memUpdateOk") msg="회원정보가 변경되었습니다!";
		else if(msg=="memUpdateNo") msg="회원정보가 변경되지 않았습니다!";
		else if(msg=="levelCheckOk") msg="회원 등급이 변경처리되었습니다!";
		else if(msg=="memberDelOkmemberDelOk") msg="정상적으로 회원 탈퇴되셨습니다!";
		else if(msg=="adMemberDeleteOk") msg="정상적으로 회원 탈퇴처리되었습니다!";
		else if(msg=="boInputOk") msg="게시글이 작성되었습니다!";
		else if(msg=="boInputNo") msg="게시글 입력에 실패하였습니다!";
		else if(msg=="boDeleteOk") msg="게시글이 삭제되었습니다!";
		else if(msg=="boDeleteNo") msg="게시글을 삭제하는데 실패하였습니다!";
		else if(msg=="userCheckNo") msg="정상적인 접근이 아닙니다!";
		else if(msg=="boUpdateOk") msg="게시글이 수정되었습니다..!";
		else if(msg=="boUpdateNo") msg="게시글 수정 실패!";
		else if(msg=="upLoad1Ok") msg="파일이 서버로 전송중입니다!";
		else if(msg=="upLoad1No") msg="파일을 서버로 업로드하는데 실패하였습니다!";
		else if(msg=="boReplyNotNull") msg="게시글에 댓글이 1개 이상 있는 경우 게시글을 삭제할 수 없습니다.";
		else if(msg=="pdsInputOk") msg="자료가 성공적으로 업로드되었습니다!";
		else if(msg=="pdsInputNo") msg="자료를 업로드하는데 실패하였습니다!";
			
		alert(msg);
		if(url!="") location.href=url;
	</script>
</head>
<body>

</body>
</html>