<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



<%-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/css/mdb.min.css" rel="stylesheet">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/js/mdb.min.js"></script>

<script src="https://ajax.googlepis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript" src="${contextPath }/resources/js/board/bootstrap.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> --%>

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

.form-style {
	width: 100%;
}

.img_wrap {
	width: 300px;
	margin-top: 50px;
}

.img_wrap img {
	max-width: 100%;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp" />

	<!-- include libraries(jQuery, bootstrap) -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>


	<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : 'content',
			minHeight : 370,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR'
		});
	});
	</script>

	<div style="margin: 50px;"></div>

	<!-- 게시판 -->
	<div class="container">
		<div class="row">
			<form method="post" action="binsert.kh" enctype="multipart/form-data" class="form-style">
				<table class="table table-striped" style="text-align: center; border: 1px;">
					<thead>
						<tr>
							<th colspan="3" style="color: white; font-size: 40px; text-align: center; background-color: #212529; 
							border-radius: 30px 30px 0px 0 px">게시판 글쓰기</th>
						</tr>
					</thead>
					<%-- <tbody>
						<tr>
							<td><input type="hidden" name="memberId" value="${loginUser.id }"> 
								<input type="text" class="btn btn-default btn-rounded" value="${ loginUser.name }"
								style="width: 100%; color: white; height: 70px; font-size: 35px; font-weight: bold; text-align: left;" readonly>
								${ loginUser.name }
							</td>
						</tr>
					</tbody> --%>
				</table>
			</form>

			<!-- 썸머노트 -->
			
			<form method="post" action="binsert.kh">
			<input type="hidden" name="memberId" value="${loginUser.id }">
				<input type="text" value="  작성자  :  ${ loginUser.name }" style="width: 100%; height: 40px; font-size: 20px; 
				font-weight: bold; text-align: left; color: #dcdcdc; background-color: #282828;" readonly>
				<div style="margin: 20px;"></div>
				<input type="text" name="cBoardTitle" style="width: 100%; height: 40px;" placeholder="제목" /><br>
				<br>
				<textarea id="summernote" name="cBoardContent"></textarea>
				<!-- <input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)" /> -->
				<div style="margin: 50px;"></div>
				<table align="right" style="margin-left: 940px;">
					<tr>
						<td colspan="2" align="center">
						<input type="submit" class="btn btn-primary" value="등록하기" />&nbsp; 
							<a href="bList.kh" class="btn btn-danger">목록으로</button>
						</td>
					</tr>
				</table>
				
			</form>
		</div>
		<!-- 썸머노트 -->

		<div style="margin: 20px;"></div>
		<a href=""></a>

	</div>
	<input type="file" name="uploadFile" placeholder="사진등록" class="btn btn-outline-default waves-effect"font-size: 17px;">
</body>
</html>