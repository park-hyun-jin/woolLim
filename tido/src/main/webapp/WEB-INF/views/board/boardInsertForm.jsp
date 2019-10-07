<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="${contextPath }/resources/css/board/boardlist-style.css">
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
	<!-- 네비게이션  -->
	<div class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="bs-example-navbar-collapse-1"
				aria-expaned="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${contextPath }">WOOLLIM</a>
		</div>
		<div class="collapse navbar-collapse"
			id="#bs-example-navbar-collapse-1">
			<!-- <ul class="nav navbar-nav">
					<li><a href="blist.kh">게시판</a></li>
				</ul> -->

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">접속하기<span class="caret"></span>
				</a>
					<ul class="dropdown-menu">
						<li><a href="#">로그인</a></li>
						<li><a href="#">회원가입</a></li>
					</ul></li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">Q&A</a></li>
					</ul></li>
			</ul>
		</div>
	</div>

	<div style="margin: 70px;"></div>

	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<form method="post" action="binsert.kh" enctype="multipart/form-data" class="form-style">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">게시판
								글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="글 제목" name="cBoardTitle" maxlength="50" /></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용"
									name="cBoardContent" maxlength="2048" style="height: 350px;"></textarea>
							</td>
						</tr>
						<tr>
							<td><input type="file" name="uploadFile" placeholder="사진등록">
							</td>
						</tr>
					</tbody>
				</table>

				<!-- 모달창 열기 -->
				<button type="button" class="btn btn-info btn-lg"
					data-toggle="modal" data-target="#myModal">링크추가하기</button>

				<!-- Modal -->
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content -->
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
				<!-- Modal -->
				<div class="modal-dialog modal-sm"></div>
				<div class="modal-dialog modal-lg"></div>
				<table align="center" border="1" cellspacing="0">
					<tr>
						<td><input type="submit" class="btn btn-primary pull-right" value="등록하기" />&nbsp; 
						<a href="bList.kh" class="btn btn-primary pull-right">목록으로</a></td>
					</tr>
				</table>
			</form>
		</div>

	</div>
	<!-- </form> -->
	<script
		src="https://ajax.googlepis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript"
		src="${contextPath }/resources/js/board/bootstrap.js"></script>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>