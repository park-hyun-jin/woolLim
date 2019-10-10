<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath }/resources/css/board/boardlist-style.css">
<title>게시판 글쓰기</title>
<style>
navbar navbar-default {
	width: 70%;
	margin: auto;
}

.fade {
	z-index: 1000000 !important;
	left: 25px;
	top: 25px;
	width: 320px;
	height: 300px;
	display: none;
}
.form-style{
	width:100%;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />
	<!-- <form action="binsert.kh" method="post" enctype="multipart/form-data"> -->
	<nav class="navbar navbar-default" style="background-color: #212529;">
		<div class="navbar-header">
			<a class="navbar-brand" href="${contextPath }" style="font-size: 22px; float: left;">WOOLLIM</a>
		</div>
	</nav>

	<div style="margin: 50px;"></div>

	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<form method="post" action="binsert.kh" enctype="multipart/form-data" class="form-style">
				<table class="table table-striped" style="text-align: center; border: 1px">
					<thead>
						<tr>
							<th colspan="3" style="color: white; font-size:40px; text-align: center; background-color: #212529; border-radius: 30px 30px 15px 15px">게시판 글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td	>
								<input type="hidden" name="memberId" value="${loginUser.id }"> 
								<input type="text"  value="${ loginUser.name }" style="width: 100%; height: 40px; font-size:15px; font-weight: bold;" readonly>
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" class="form-control" placeholder="글 제목" name="cBoardTitle" maxlength="50" style="height: 40px; font-size:15px;"/>
							</td>
						</tr>
						<tr>
							<td>
								<textarea class="form-control" placeholder="글 내용" name="cBoardContent" maxlength="2048" style="height: 350px; font-size:15px;"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<input type="file" name="uploadFile" placeholder="사진등록">
							</td>
						</tr>
					</tbody>
				</table>
	<!-- 
				<!-- 모달창 열기 
				<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">링크추가하기</button>

				<!-- Modal -
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">x</button>

								<div style="margin: 30px;"></div>

								<input type="text" class="btn btn-default" href="#"
									target="_black" value="링크를 입력하세요" style="text-align: left;">
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-default"
									data-dismiss="modal">등록</button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
							</div>
						</div>

					</div>
				</div>
				<div class="modal-dialog modal-sm"></div>
				<div class="modal-dialog modal-lg"></div>
				<!-- Modal -->
				<a href=""></a>
				
				<table align="right">
					<tr>
						<td colspan="2" align="center">
							<input type="submit" class="btn btn-primary" value="등록하기" />&nbsp;
							<a href="bList.kh" class="btn btn-primary">목록으로</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<script src="https://ajax.googlepis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" ssrc="${contextPath }/resources/js/board/bootstrap.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>