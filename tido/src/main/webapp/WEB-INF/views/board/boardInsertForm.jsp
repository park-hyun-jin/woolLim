<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath }" scope="application"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<link rel="stylesheet" href="${contextPath }/resources/css/board/boardlist-style.css"> 
<style>
/* 게시판 리스트 목록 */
body {
   margin: auto;
}
nav, table, #wr{
   width: 70%;
   margin: auto;
}
tbody {
   text-align: center;
}

.sub_news, .sub_news th, .sub_news td {
   border: 0
}

.sub_news a {
   color: #383838;
   text-decoration: none
}

/* 게시판 리스트 글씨 */
.sub_news {
   width: 100%;
   border-bottom: 1px solid #999;
   color: #666;
   font-size: 16px;
   table-layout: fixed
}

.sub_news caption {
   display: none
}

.sub_news th {
   padding: 5px 0 6px;
   border-top: solid 1px #999;
   border-bottom: solid 1px #b2b2b2;
   background-color: #f1f1f4;
   color: #333;
   font-weight: bold;
   line-height: 20px;
   vertical-align: top
}

.sub_news td {
   padding: 8px 0 9px;
   border-bottom: solid 1px #d2d2d2;
   text-align: center;
   line-height: 18px;
}

.sub_news .no, .date, .sub_news .hit {
   padding: 0;
   font-family: Tahoma;
   font-size: 11px;
   line-height: normal
}

.sub_news .title {
   text-align: left;
   padding-left: 15px;
   font-size: 15px;
}

.sub_news .title .pic, .sub_news .title .new {
   margin: 0 0 2px;
   vertical-align: middle;
}

.sub_news .title a.comment {
   padding: 0;
   background: none;
   color: #f00;
   font-size: 15px;
   font-weight: bold
}
#thead tr th {
   text-align: center;
}

.btn{
   font-size: 20px !important;
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
