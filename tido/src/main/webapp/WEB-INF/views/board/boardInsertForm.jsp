<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/css/mdb.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/js/mdb.min.js"></script> 
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


	<div style="margin: 50px;"></div>

	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<form method="post" action="binsert.kh" enctype="multipart/form-data" class="form-style">
				<table class="table table-striped" style="text-align: center; border: 1px;">
					<thead>
						<tr>
							<th colspan="3" style="color: white; font-size:40px; text-align: center; background-color: #212529; border-radius: 30px 30px 0px 0	px">게시판 글쓰기</th>
						</tr>
					</thead>
					
					
					<tbody>
						<tr>
							<td	>
								<input type="hidden" name="memberId" value="${loginUser.id }"> 
								<input type="text"  value="  작성자  :  ${ loginUser.name }" style="width: 100%; height: 40px; font-size:20px; font-weight: bold; text-align: left;
								color: #dcdcdc; background-color: #282828;" readonly>
							</td>
						</tr>
						<tr>
							<td>
								<textarea type="text" class="form-control" placeholder="글 제목" name="cBoardTitle" maxlength="50" style="height: 40px; font-size:15px; background-color: #323232; color:snow;"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<textarea class="form-control" placeholder="글 내용" name="cBoardContent" maxlength="2048" style="height: 350px; font-size:15px; background-color: #323232; color:snow;"></textarea>
							</td>
						</tr>
						<tr>
							<td style="text-align: left;">
								<input type="file" name="uploadFile" placeholder="사진등록" class="btn btn-outline-default waves-effect" font-size: 17px;">
							</td>
						</tr>
					</tbody>
				</table>
	<!-- 
				Modal: Login with Avatar Form
				<div class="modal fade" id="modalLoginAvatar" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog cascading-modal modal-avatar modal-sm" role="document">
						Content
						<div class="modal-content">

							Header
							<div class="modal-header">
								<img src="https://mdbootstrap.com/img/Photos/Avatars/img%20%281%29.jpg" alt="avatar" class="rounded-circle img-responsive">
							</div>
							Body
							<div class="modal-body text-center mb-1">

								<h5 class="mt-1 mb-2">링크 추가</h5>

								<i class="fas fa-envelope prefix"></i> 
								<div class="md-form form-sm mb-5">
									<input type="email" id="modalLRInput10" class="form-control form-control-sm validate"> 
									<label data-error="wrong" data-success="right" for="modalLRInput10">Your Link</label>
								</div>
								<div class="text-center mt-4">
									<input type="submit" class="btn btn-outline-default btn-rounded waves-effect"><i class="fas fa-sign-in ml-1"></i>
								</div>
							</div>

						</div>
						/.Content
					</div>
				</div>
				Modal: Login with Avatar Form

				<div class="col-md-6 col-xl-1 text-center mb-4">
					<a href="" class="btn-floating btn-lg blue-gradient" data-toggle="modal" data-target="#modalLoginAvatar"><i class="fas fa-envelope"></i></a>
				</div>

				Modal -->
				<a href=""></a>
				
				<table align="right">
					<tr>
						<td colspan="2" align="center">
							<input type="submit" class="btn btn-outline-primary waves-effect" value="등록하기" />&nbsp;
							<a href="bList.kh" class="btn btn-outline-danger waves-effect">목록으로</button>
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