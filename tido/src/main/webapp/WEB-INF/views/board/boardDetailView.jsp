<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세</title>
<style>
.col-md-8 {
	background: linear-gradient(to bottom, grey, black);
}
table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
   	/* background: white; */
   	color: #99FF99;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    /* background: grey; */
    color: white;
}
table.type09 tbody td  {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    /* background: snow; */
    color: white;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div style="margin: 50px;"></div>

	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="border-radius: 5%;">
			<h2 class="text-center" style="color: white; height: 100px; margin: auto; line-height: 320%;">게시글 상세</h2>
			<form action="BoardReWriteProc.jsp" method="post">
				<div class="table table-responsive">
					<table class="table table-striped" style="color: white;">
						<tr align="center" valign="middle">
							<th colspan="2">${board.cBoardNo }번 글  상세보기</th>
						</tr>
						<tr>
							<td style="width: 15%; color: #dcdcdc;">제목</td>
							<td>${board.cBoardTitle }</td>
						</tr>
						<tr>
							<td style="color: #dcdcdc;">작성자</td>
							<td>${board.memberName }</td>
						</tr>
						<tr>
							<td style="color: #dcdcdc;">작성일</td>
							<td>${board.cBoardCreateDate }</td>
						</tr>
						<tr>
							<td style="color: #dcdcdc;">글내용</td>
							<td style="height: 370px;">${board.cBoardContent }</td>
						</tr>
						<tr>
							<td style="color: #dcdcdc;">첨부파일</td>
							<td>
								<c:if test="${ !empty board.cBoardOriFilename }">
									<a href="${ contextPath }/resources/buploadFiles/${ board.cBoardChaFilename }" download>${ board.cBoardOriFilename }</a>
								</c:if>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center" style="color: white">
								<c:url var="bupView" value="bupView.kh">
									<c:param name="cBoardNo" value="${board.cBoardNo }" />
									<c:param name="page" value="${currentPage }" />
								</c:url>
								<c:url var="bdelete" value="bdelete.kh">
									<c:param name="cBoardNo" value="${board.cBoardNo }" />
								</c:url>
								<c:url var="blist" value="bList.kh">
									<c:param name="page" value="${currentPage }" />
								</c:url>

								<c:if test="${loginUser.id eq board.memberId }">
									<a href="${bupView }" class="btn btn-outline-primary waves-effect">수정하기</a>&nbsp;
									<a href="${bdelete }" class="btn btn-outline-danger waves-effect">삭제하기</a>&nbsp;
								</c:if>
								<a href="${blist }" class="btn btn-outline-warning waves-effect">목록으로</a>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</div>

	<div style="margin: 50px;"></div>

	<!-- 댓글 목록  -->
	<table id="rtb" align="center" width="65%;" cellspacing="0" class="type09">
		<thead>
			<tr>
				<th colspan="1">
					<b id="rCount">작성자</b>
				</th>
				<th colspan="1">
					<b id="rCount">내용</b>
				</th>
				<th colspan="1">
					<b id="rCount">작성날짜</b>
				</th>
			</tr>
		</thead>
		<tbody>

		</tbody>
	</table>

	<div style="margin: 20px;"></div>

	<!-- 댓글 등록  -->
	<table align="center" width="65%;" cellspacing="0">
		<tr>
			<td ><textarea cols="157" rows="3" id="cbReplyContent"></textarea></td>
			<td>
				<button id="rSubmit" class="btn btn-primary" style="background-color: #4B0082; border-radius: 10%">등록하기</button>
			</td>
		</tr>
	</table>
	<script>

	/* console창에 띄우기 */
	/* $(function(){
		var loginUser = '<c:out value="${board.memberId}"/>';
		console.log(loginUser);
	}); */

	// 댓글 등록 ajax
		$("#rSubmit").on("click", function(){
			var cbReplyContent = $("#cbReplyContent").val();
			var cboardNo = ${board.cBoardNo};

			if(cbReplyContent == ""){
				alert("댓글을 입력하세요를레이요 구르트아줌마 징가제트 와이스가짱!");
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

					 var $tableBody = $(".type09 tbody");
					 $tableBody.html("");

					 $("#cBoardViewCount").text("댓글(" + list.length + ")");

					 var $tr;
					 var $memberId;
					 var $cbReplyContent;
					 var $cbReplyCreateDate;


					 if(list.length > 0){ 
						 $.each(list, function(i){
							 $tr = $("<tr>");
							 $memberId = $("<th>").text(list[i].memberName).css("width","100px");
							 $cbReplyContent = $("<td>").html(list[i].cbReplyContent);
							 $cbReplyCreateDate = $("<td>").text(list[i].cbReplyCreateDate).css("width","100px");

							 $tr.append($memberId);
							 $tr.append($cbReplyContent);
							 $tr.append($cbReplyCreateDate);
							 $tableBody.append($tr);
						 })

					 }else{
						 $tr = $("<tr>");
						 $cbReplyContent = $("<td colspan='3'>").text("등록된 댓글이 없습니다.");

						 $tr.append($cbReplyContent);
						 $tableBody.append($tr);
					 }
				}
			});
		}
	</script>
</body>
</html>