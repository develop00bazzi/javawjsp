<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>scMenu.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
		$(document).ready(function(){
			$("#scheduleInputHidden").hide();
		});
		
		/* 일정 등록 폼을 가상에 출력하기 */
		
		function scheduleInputView() {
			$("#scheduleInputView").hide();
			$("#scheduleInputHidden").show();
		}
		
		function scheduleInputHidden() {
			$("#scheduleInputView").show();
			$("#scheduleInputHidden").hide();
		}
		
		/* 일정 등록 ajax 처리 */
		
		function scheduleInputOk() {
			let part=myform.part.value;
			let content=myform.content.value;
			if(content=="") {
				alert("일정을 입력하세요!");
				myform.content.focus();
				return false;
			}
			let query= {
					mid:'${sMid}',
					ymd: '${ymd}',
					part:part,
					content:content
			}
			
			$.ajax({
				type:"post",
				url:"${ctp}/scheduleInputOk.sc",
				data: query,
				success: function(res) {
					if(res=="1") {
						alert("일정이 등록되었습니다!");
						location.reload();
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
	<h2 class="text-center">${ymd} 일정입니다.</h2>
	<p> 오늘의 일정은 총 ${fn:length(vos)}건 입니다.</p>
	<hr/>
	<div>
		<input type="button" value="일정등록" onclick="scheduleInputView()" id="scheduleInputView" class="btn btn-secondary" />
		<input type="button" value="일정등록창 닫기" onclick="scheduleInputHidden()" id="scheduleInputHidden" class="btn btn-primary" />
		<button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#myModal">
		  일정 등록(modal)
		</button>
		<input type="button" value="돌아가기" onclick="location.href='${ctp}/schedule.sc?yy=${fn:split(ymd,'-')[0]}&mm=${fn:split(ymd,'-')[1]-1}';" class="btn btn-secondary" /><br/>
	</div>
</div>

<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">일정 등록하기</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
      	<form name="myform">
      		<table class="table table-bordered">
      			<tr>
      				<th>일정 분류</th>
      				<td>
      					<select name="part" class="form-control">
      						<option value="모임">모임</option>
      						<option value="업무">업무</option>
      						<option value="학습">학습</option>
      						<option value="여행">여행</option>
      						<option value="기타">기타</option>
      					</select>
      				</td>
      			</tr>
      			<tr>
      				<th>상세 일정</th>
      				<td><textarea name="content" rows="4" class="form-control"></textarea></td>
      			</tr>
      			<tr>
      				<td colspan="2" class="text-center">
      					<input type="button" value="일정 등록" onclick="scheduleInputOk()" data-dismiss="modal" class="btn btn-success form-control" />
      				</td>
      			</tr>
      		</table>
      	</form>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

<p><br/></p>
<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>