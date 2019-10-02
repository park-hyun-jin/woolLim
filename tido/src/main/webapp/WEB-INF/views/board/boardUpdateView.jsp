<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


	<form action="bupdate.kh" method="post" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${ currentPage }">
		<input type="hidden" name="bId" value="${ board.cBoardNo }">
		<input type="hidden" name="cBoardChaFilename; " value="${ board.cBoardChaFilename;  }">
		
		<table align="center" id="tb" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" name="cBoardTitle; " value="${ board.cBoardTitle;  }"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" readonly name="memberId;" value="${ board.memberId; }"></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td>
					<c:set var="cBoardContent " value="${fn:replace(board.cBoardContent; ,'<br>','') }"/>
					<textarea cols="50" rows="7" name="cBoardContent ">${ cBoardContent;  }</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="reloadFile">
					<c:if test="${ !empty board.cBoardOriFilename }">
						<br>현재 업로드한 파일 : 
						<a href="${ contextPath }/resources/buploadFiles/${ board.cBoardChaFilename }" download>${ board.cBoardOriFilename }</a>
					</c:if>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기"> &nbsp;
					<c:url var="blist" value="blist.kh">
						<c:param name="page" value="${ currentPage }"/>
					</c:url>
					<a href="${ blist }">목록으로</a>
					<a href="javascript:history.go(-1);">이전페이지로</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>