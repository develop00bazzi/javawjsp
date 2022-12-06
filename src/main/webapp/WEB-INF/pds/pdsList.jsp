<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>pdsList.jsp</title>
	<jsp:include page="/include/bs4.jsp"></jsp:include>
	<script>
		'use strict';
		
		function partCheck() {
			let part=partForm.part.value;
			location.href="${ctp}/pdsList.pds?part="+part+"&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}";
		}
		
		function pCheck() {
			let pageSize=document.getElementById("pageSize").value;
			location.href="${ctp}/pdsList.pds?part=${part}&pageSize="+pageSize+"&flag=${flag}&search=${search}&searchString=${searchString}";
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
		
		function modalView(title,nickName,mid,part,fName,fSName,fSize,downNum) {
	    	let imgs = fSName.split("/");
	    	
	    	$("#myModal").on("show.bs.modal", function(e){
	    		$(".modal-header #title").html(title);
	    		$(".modal-header #part").html(part);
	    		$(".modal-body #nickName").html(nickName);
	    		$(".modal-body #mid").html(mid);
	    		$(".modal-body #fName").html(fName);
	    		$(".modal-body #fSize").html(fSize);
	    		$(".modal-body #downNum").html(downNum);
	    		$(".modal-body #fSName").html(fSName);
	    		$(".modal-body #imgSrc").attr("src",'${ctp}/data/pds/'+imgs[0]);
	    	});
	    }
		
		/* 선택한 항목의 자료 삭제하기 */
		
		function pdsDelCheck(idx,fSName) {
			let ans=confirm("선택된 자료 파일을 삭제하시겠습니까?");
			if(!ans) return false;
			
			let pwd=prompt("비밀번호를 입력하세요!");
			
			let query={
				idx: idx,
				fSName: fSName,
				pwd:pwd
			}
			
			$.ajax({
				type: "post",
				url: "${ctp}/pdsDelete.pds",
				data: query,
				success: function(res) {
					if(res=="1") {
						alert("자료가 정상적으로 삭제되었습니다.");
						location.reload();
					}
					else {
						alert("자료 삭제 실패");
					}
				},
				error: function() {
					alert("전송 오류");
				}
			});
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp"></jsp:include>
<p><br/></p>
<div class="container">

	<a href="${ctp}/pdsList.pds"><h2 class="text-center">자 료 실  리 스 트 (${part})</h2></a>
	<br/>
	
	<table class="table table-borderless">
		<tr>
			<td style="width:20%;">
				<form name="partForm">
					<select name="part" onchange="partCheck()" class="form-control">
						<option value="전체" ${part=='전체'?'selected':''}>전체</option>
						<option value="학습" ${part=='학습'?'selected':''}>학습</option>
						<option value="여행" ${part=='여행'?'selected':''}>여행</option>
						<option value="음식" ${part=='음식'?'selected':''}>음식</option>
						<option value="기타" ${part=='기타'?'selected':''}>기타</option>
					</select>
				</form>
			</td>
			<td>
				<a href="${ctp}/pdsInput.pds?part=${part}" class="btn btn-secondary">자료 올리기</a>
			</td>
			<td style="width: 10%;" class="text-right">
				<select name="pageSize" id="pageSize" onchange="pCheck()" class="form-control">
					<option value="5" ${pageSize==5?'selected':''}>5건</option>
					<option value="10" ${pageSize==10?'selected':''}>10건</option>
					<option value="15" ${pageSize==15?'selected':''}>15건</option>
					<option value="20" ${pageSize==20?'selected':''}>20건</option>
				</select>
			</td>
		</tr>
	</table>
	
	<table class="table table-hover text-center">
		<tr>
			<th>번호</th>
			<th>자료 제목</th>
			<th>올린이</th>
			<th>작성일자</th>
			<th>분류</th>
			<th>파일명(크기)</th>
			<th>다운로드 횟수</th>
			<th>비고</th>
		</tr>
		<c:forEach var="vo" items="${vos}" varStatus="st">
			<tr>
				<td class="align-middle">${curScrStartNo}</td>
				<td class="align-middle">
					<c:if test="${vo.hour_diff<=24}">
						<img src="${ctp}/images/new.gif"/>
					</c:if>
					<a href="${ctp}/pdsContent.pds?part=${part}&idx=${vo.idx}&pag=${pag}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}">
						${vo.title}
					</a>
				</td>
				<td class="align-middle">${vo.nickName}</td>
				<td class="align-middle">
					<c:if test="${vo.day_diff > 0}">
					<c:if test="${vo.hour_diff > 24}">
							${fn:substring(vo.fDate,0,10)}
						</c:if>
						<c:if test="${vo.hour_diff <= 24}">
							${fn:substring(vo.fDate,0,19)}
						</c:if>
					</c:if>
					<c:if test="${vo.day_diff <= 0}">                  
						${fn:substring(vo.fDate,11,19)}
				</c:if>
				</td>
				<td class="align-middle">${vo.part}</td>
				<td class="align-middle">
					<c:set var="fNames" value="${fn:split(vo.fName,'/')}" />
					<c:set var="fSNames" value="${fn:split(vo.fSName,'/')}" />
					<c:forEach var="fName" items="${fNames}" varStatus="st">
						<a href="${ctp}/data/pds/${fSNames[st.index]}" download="${fName}">${fName}<br/>					
					</c:forEach>
				</td>
				<td class="align-middle">${vo.downNum}</td>
				<td class="align-middle">
		          <a href="#" onclick="modalView('${vo.title}','${vo.nickName}','${vo.mid}','${vo.part}','${vo.fName}','${vo.fSName}','${vo.fSize}','${vo.downNum}')" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#myModal">글 요약</a><br/>
		          전체다운<br/>
		          <a href="javascript:pdsDelCheck('${vo.idx}','${vo.fSName}')" class="btn btn-sm btn-secondary">삭제 1</a>
		        </td>
			</tr>
			<c:set var="curScrStartNo" value="${curScrStartNo-1}"></c:set>
		</c:forEach>
		<tr><td colspan="8" class="m-o p-0"></td></tr>
	</table>
	
	<div class="text-center">
		<ul class="pagination justify-content-center">
			<c:if test="${pag>1}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/pdsList.pds?pag=1&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}" class="btn-sm btn-secondary">첫 페이지</a></li>
			</c:if>
			<c:if test="${curBlock>0}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/pdsList.pds?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}" class="btn-sm btn-secondary">이전 블록</a></li>
			</c:if>
			<c:forEach var="i" begin="${(curBlock)*blockSize+1}" end="${(curBlock)*blockSize+blockSize}" varStatus="st">
				<c:if test="${i<=totPage && i==pag}">
					<li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/pdsList.pds?pag=${i}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}" class="btn-sm btn-secondary">${i}</a></li>
				</c:if>
				<c:if test="${i<=totPage && i!=pag}">
					<li class="page-item"><a class="page-link text-secondary" href="${ctp}/pdsList.pds?pag=${i}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}" class="btn-sm btn-secondary">${i}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${curBlock<lastBlock}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/pdsList.pds?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}" class="btn-sm btn-secondary">다음 블록</a></li>
			</c:if>
			<c:if test="${pag<totPage}">
				<li class="page-item"><a class="page-link text-secondary" href="${ctp}/pdsList.pds?pag=${totPage}&pageSize=${pageSize}&flag=${flag}&search=${search}&searchString=${searchString}" class="btn-sm btn-secondary">마지막 페이지</a></li>
			</c:if>
		</ul>
	</div>
	<br/>
	
	<!-- 검색기 처리 -->
	
	<div class="container text-center">
		<%-- <form name="searchForm" method="post" action="${ctp}/boSearch.bo"> --%>
		<form name="searchForm" method="post" action="${ctp}/pdsList.pds">
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
			<input type="hidden" name="part" value="${part}" />
		</form>
	</div>
	
	
	
</div>

<!-- The Modal(모달창 클릭시 자료실의 내용을 모달창에 출력한다. -->
	<div class="modal fade" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    
	      <!-- Modal Header -->
	     <div class="modal-header">
	       <h4 class="modal-title"><span id="title"></span>(분류:<span id="part"></span>)</h4>
	       <button type="button" class="close" data-dismiss="modal">&times;</button>
	     </div>
	     
	     <!-- Modal body -->
	     <div class="modal-body">
	       - 올린이 : <span id="nickName"></span>
	       <hr/>
	       - 아이디 : <span id="mid"></span><br/>
	       - 파일명 : <span id="fName"></span><br/>
	       - 파일크기 : <span id="fSize"></span><br/>
	       - 파일다운횟수 : <span id="downNum"></span><br/>
	       <hr/>
	       - 저장파일명 : <span id="fSName"></span><br/>
	       <img id="imgSrc" width="350px"/><br/>
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