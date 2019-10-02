<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세</title>
<style>
nav {
	width: 70%;
	margin: auto;
}
</style>
</head>
<body>
	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span> 
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">WOOLLIM</a>
		</div>
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">게시판</a></li>
				<li class="active"><a href="bbs.jsp">마이페이지</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">공지사항</a></li>
						<li><a href="logoutAction.jsp">Q&A</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>

	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h2 class="text-center">게시글 상세</h2>
			<form action="BoardReWriteProc.jsp" method="post">
				<div class="table table-responsive">
					<table class="table table-striped">
						<tr align="center" valign="middle">
							<th colspan="2">${board.cBoardNo }번 글  상세보기</th>
						</tr>
						<tr>
							<td>제목</td>
							<td>${board.cBoardTitle }</td>
						</tr>
						<tr>
							<td>작성자</td>
							<td>${board.memberId }</td>
						</tr>
						<tr>
							<td>작성일</td>
							<td>${board.cBoardCreateDate }</td>
						</tr>
						<tr>
							<td>글내용</td>
							<td>${board.cBoardContent }</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
								<c:url var="bupview" value="bupView.kh">
									<c:param name="cBoardNo" value="${board.cBoardNo }" />
									<c:param name="page" value="${currentPage }" />
								</c:url>
								<c:url var="bdelete" value="bdelete.kh">
									<c:param name="cBoardNo" value="${board.cBoardNo }" />
								</c:url>
								<c:url var="blist" value="blist.kh">
									<c:param name="page" value="${currentPage }" />
								</c:url>
								
								<c:if test="${board.memberId; }">
									<a href="${bupview }">수정하기</a>&nbsp;
									<a href="${bdelete }">삭제하기</a>&nbsp;
								</c:if>
								<a href="${blist }">목록으로</a>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>


	<!-- 댓글 등록  -->
	<table align="center" width="500" border="1" cellspacing="0">
		<tr>
			<td><textarea cols="55" rows="3" id="rContent"></textarea></td>
			<td>
				<button id="rSubmit">등록하기</button>
			</td>
		</tr>
	</table>
	
	
	<!-- 댓글 목록  -->
	<table id="rtb" align="center" width="500" border="1" cellspacing="0">
		<thead>
			<tr>
				<td colspan="2"><b id="rCount"></b></td>
			</tr>
		</thead>
		<tbody></tbody>
	</table>
	
	<script>
		// 댓글 등록 ajax
		$("#rSubmit").on("click", function(){
			var cbReplyContent = $("#cbReplyContent").val();
			var cboardNo = ${board.cboardNo};
			
			if(cbReplyContent == ""){
				alert("댓글을 입력하라우 간나쉐끼");
				return false;
			}
			
			$.ajax({
				url : "addReply.kh",
				data : {cbReplyContent:cbReplyContent, cboardNo:cboardNo},
				type : "POST",
				success:function(data){
					if(data == "success"){
						// 댓글 작성 부분 초기화
						$("#cbReplyContent").val("");						
					}
				}
			});	
			getReplyList();
		});
	
		getReplyList();
		// 댓글 리스트 조회 함수
		function getReplyList(){
			var cBoardNo = ${board.cBoardNo};
			console.log(cBoardNo);
			$.ajax({
				url : "rList.kh",
				data : {cBoardNo : cBoardNo},
				dataType : "json",
				success:function(list){
					
					 var $tableBody = $("#rtb tbody");
					 $tableBody.html("");
					 
					 $("#cbReplyContent").text("댓글(" + list.length + ")");
					 
					 var $tr;
					 var $memberId;
					 var $cbRContent;
					 var $cbReplyCreateDate;
					 
					 
					 if(list.length > 0){ 
						 $.each(list, function(i){
							 $tr = $("<tr>");
							 $memberId = $("<td>").text(list[i].memberId).css("width","100px");
							 $cbRContent = $("<td>").html(list[i].cbRContent);
							 $cbReplyCreateDate = $("<td>").text(list[i].cbReplyCreateDate).css("width","100px");
							 
							 $tr.append($memberId);
							 $tr.append($cbRContent);
							 $tr.append($cbReplyCreateDate);
							 $tableBody.append($tr);
						 })
						 
					 }else{
						 $tr = $("<tr>");
						 $cbRContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");
						 
						 $tr.append($cbRContent);
						 $tableBody.append($tr);
					 }				 
					 
				}
				
			});
		}
		
	</script>

</body>
</html>