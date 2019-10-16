<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/css/mdb.min.css"
	rel="stylesheet">
<!-- JQuery -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/js/mdb.min.js"></script>

<style>
#body {
	width: 70%;
	margin: auto;
}

table {
	color: white;
	background-color: #343a40;
	text-align:center;
	
}

#Search {
	width: 20%;
	float: right;
}

#iInquiryContent {
	height: 400px;
}
.table td{
color : white;
font-size:16px !important;
}
.table th{
 background-color: #212529;
 color: white;
 font-size:16px !important;
 font-weight:bold;
}


</style>
</head>
<body>
	<c:import url="../common/menubar.jsp" />
	<div class="wrapper-editor" id="body">



		<%-- <div class="block my-4">
			<div class="d-flex justify-content-center">
				<p class="h5 text-primary createShowP">${pi.listCount}</p>
			</div>
		</div> --%>
		<br>
		<br>

		<div class="modal fade" id="modalSubscriptionForm" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header text-center">
						<h4 class="modal-title w-100 font-weight-bold">문의하기</h4>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					
					<form action="qinsert.kh" method="post" enctype="multipart/form-data" id="formInsert">
					<div class="modal-body mx-3">
					
						<div class="md-form mb-5">
							<i class="fas fa-user prefix white-text"></i>
							 <input type="text"
								id="form3" class="form-control" name="iInquiryId" readonly value="${ loginUser.id }"> <label
								data-error="wrong" data-success="right" for="form3"></label>
						</div>

							<div class="md-form mb-4">
								<i class="fas fa-envelope prefix grey-text"></i> <input
									type="text" id="form2" class="form-control" name="iInquiryTitle"> <label
									data-error="wrong" data-success="right" for="form2"
									>제목</label>
							</div>
							
							<div class="md-form">
								<i class="far fa-file prefix grey-text"></i>
								<textarea id="form7" class="md-textarea form-control" rows="3"
									name="iInquiryContent" id="iInquiryContent"></textarea>
								<label for="form7">내용</label>
							</div>
							
							<div class="custom-file">
								<input type="file" class="custom-file-input"
									id="inputGroupFile01" aria-describedby="inputGroupFileAddon01"
									name="uploadFile"> <label class="custom-file-label"
									for="inputGroupFile01">Choose file</label>
							</div>
						</div>
					
					
					
					
					
					<div class="modal-footer d-flex justify-content-center">
						<button class="btn btn-indigo" id="sendButton">
							Send <i class="fas fa-paper-plane-o ml-1"></i>
						</button>
					</div>
					</form>
				</div>
			</div>
		</div>

		<div class="text-center">
			<a href="" class="btn btn-default btn-rounded mb-4"
				data-toggle="modal" data-target="#modalSubscriptionForm">등록하기</a>
		</div>


		<table id="dt-less-columns" class="table table-striped table-bordered "
		cellspacing="0" width="100%" >
		<thead>
			<tr>
				<th class="th-sm" width="10%">번호</th>
				<th class="th-sm" width="50%">제목</th>
				<th class="th-sm" width="20%">작성자</th>
				<th class="th-sm" width="20%">작성일</th>

			</tr>
		</thead>
		<tbody>
		<tbody>
			<c:forEach var="i" items="${list}" varStatus="status">
				<tr>
					<td>${i.iNo}</td>

						<c:url var="idetail" value="idetail.kh">
							<c:param name="iNo" value="${ i.iNo }" />
						</c:url>
						<c:choose>
						<c:when test="${ (loginUser.id eq i.iInquiryId ) || (loginUser.id eq 'admin@admin.com') }">
						<td><a href="${ idetail }">${ i.iInquiryTitle }</a></td>
						</c:when>
						<c:otherwise>
						<td>비밀글입니다.</td>
						</c:otherwise>
						</c:choose>
					<td>${i.memberName}</td>
					<td>${i.iInquiryDate}</td>
				<tr>
			</c:forEach>


			<tr>
			<tr id="pg" align="center" height="20">
				<td colspan="6" id="foot">
					<!-- [이전] --> <c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if> <c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="iList.kh">
							<c:param name="page" value="${ pi.currentPage - 1 }" />
						</c:url>
						<a href="${ before }">[이전]</a> &nbsp;
				</c:if> <!-- 페이지 --> <c:forEach var="p" begin="${ pi.startPage }"
						end="${ pi.endPage }">
						<c:if test="${ p eq currentPage }">
							<font color="red" size="4"><b>[${ p }]</b></font>
						</c:if>

						<c:if test="${ p ne currentPage }">
							<c:url var="pagination" value="iList.kh">
								<c:param name="page" value="${ p }" />
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
					</c:forEach> <!-- [다음] --> <c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if> 
				<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="iList.kh">
							<c:param name="page" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ after }">[다음]</a>
					</c:if>
				</td>
			</tr>
	</table>

		<div>
			<form action="isearch.kh" name="searchForm" method="get"id="Search">
			<select class="browser-default custom-select" id="searchCondition" name="searchCondition" searchable="Search here..">
				<option value="all" <c:if test="${search.searchCondition == 'all'}">selected</c:if> >전체</option>
				<option value="writer" <c:if test="${search.searchCondition == 'writer'}">selected</c:if> >작성자</option>
				<option value="title" <c:if test="${search.searchCondition == 'title'}">selected</c:if> >제목</option>
				<option value="content" <c:if test="${search.searchCondition == 'content'}">selected</c:if> >내용</option>
			</select>

			<div class="md-form active-pink active-pink-2 mb-3 mt-0" >
					<input class="form-control" name="searchValue" value="${search.searchValue}">
				</div>
			</form>


		</div>
	</div>

	
</body>


</html>