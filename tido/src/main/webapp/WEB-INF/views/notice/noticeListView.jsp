<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BBS List</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

<style>
#container {
	width: 70%;
	margin: 0 auto;
	padding-top: 80px;
}

#list {
	text-align: center;
	font-weight: bold;
}

#write {
	text-align: right;
}

/* Bootstrap 수정 */
.table>thead {
	background-color: gray;
}

.table>thead>tr>th {
	text-align: center;
	color: white;
}

.table-hover>tbody>tr:hover {
	background-color: gray;
}

.table>tbody>tr>td {
	text-align: center;
	color: white;
}


.table>tbody>tr>#title {
	text-align: left;
}

div>#paging {
	text-align: center;
}

#pg {
	color: white;
}

form>div {
	text-align: left;
}

#pnoticeTitle {
	font-size: 40px;
	font-weight: lighter;
	border: 0px;
}

#pmemberId {
	font-size: 30px;
	font-weight: lighter;
	border: 0px;
}

textarea {
	border: 0px;
	font-size: 40px;
	height: 100%;
	width: 100%;
}

#content {
	height: 450px;
	width: 450px;
}

.hit {
	animation-name: blink;
	animation-duration: 1.5s;
	animation-timing-function: ease;
	animation-iteration-count: infinite;
}

@
keyframes blink {
	from {color: white;
}

30%
{
color


:

 

yellow


;
}
to {
	color: red;
	font-weight: bold;
}
}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp" />

	<div id="container" cellspacing="">

		<div align="center">
			<button type="button" class="btn btn-primary" id="modal_show">
				글쓰기</button>
		</div>


		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">공지사항 등록</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<form action="ninsert.kh" id="ninsert" method="post" enctype="Multipart/form-data">
						<div class="container" id="asd">

							<div class="form-group">

								<label for="subject">제목</label> 
								<input type="text" class="form-control" id="subject" name="pnoticeTitle" placeholder="제목을 입력하세요.">
							</div>
							<div class="form-group">
								<label for="writer">작성자</label> 
								<input type="text" class="form-control" id="writer" name="pmemberId" readonly value="${ loginUser.id }">
							</div>
							<div class="form-grouwp">
								<label for="content">내용</label>
								<textarea class="form-control" id="content" name="pnoticeContent" rows="3"></textarea>
							</div>
							<div class="form-group">
								<label for="exampleInputFile">파일 업로드</label>
								<input type="file" id="exampleInputFile" name="pnoticeFile">
							</div>


						</div>
						<div class="modal-footer">
							<button class="btn btn-primary" id="noticeSubmit">등록하기</button>
							<button type="reset" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<script>
			$(document).ready(function() {
				$("#modal_show").click(function() {
					$("#exampleModal").modal("show");
				});

				$("#close_modal").click(function() {
					$("#exampleModal").modal("hide");
				});
			});
			
		
		</script>
		
		
		
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th width="10%">번호</th>
					<th width="50%">제목</th>
					<th width="15%">작성자</th>
					<th width="15%">작성일</th>
					<th width="10%">조회</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="n" items="${list}" varStatus="status">
					<tr>
						<td>${n.nNo}</td>

						<td>
						<c:url var="ndetail" value="ndetail.kh">
								<c:param name="nNo" value="${ n.nNo }" />
							</c:url> 
							<a href="${ ndetail }">${ n.pnoticeTitle }</a>
						</td>
						<td>${n.pmemberId}</td>
						<td>${n.pnoticeCreateDate}</td>
						<td>${n.pnoticeViewCount}</td>
					
					<tr>
				</c:forEach>


				<!-- Paging 처리 -->
				<!-- 페이징 처리 -->
				<tr id="pg" align="center" height="20">
					<td colspan="6">
						<!-- [이전] --> <c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if> <c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="nlist.kh">
								<c:param name="page" value="${ pi.currentPage - 1 }" />
							</c:url>
							<a href="${ before }">[이전]</a> &nbsp;
				</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
							end="${ pi.endPage }">
							<c:if test="${ p eq currentPage }">
								<font color="red" size="4"><b>[${ p }]</b></font>
							</c:if>

							<c:if test="${ p ne currentPage }">
								<c:url var="pagination" value="nlist.kh">
									<c:param name="page" value="${ p }" />
								</c:url>
								<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
						</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if> <c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="nlist.kh">
								<c:param name="page" value="${ pi.currentPage + 1 }" />
							</c:url>
							<a href="${ after }">[다음]</a>
						</c:if>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>

