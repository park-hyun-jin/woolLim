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
	width: 75%;
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

.sub_news {
	width: 100%;
	border-bottom: 1px solid #999;
	color: #666;
	font-size: 12px;
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
	font-size: 13px;
}

.sub_news .title .pic, .sub_news .title .new {
	margin: 0 0 2px;
	vertical-align: middle
}

.sub_news .title a.comment {
	padding: 0;
	background: none;
	color: #f00;
	font-size: 12px;
	font-weight: bold
}
#thead tr th {
	text-align: center;
}
</style>
</head>
<body>
	<div style="margin: 50px;"></div>
	<h1 class="page-header">게시판 목록</h1>
	<div style="margin: 20px;"></div>

	<!-- 상단 메뉴바 -->
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
				<li class="active">
					<a href="#">마이페이지</a>
				</li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">로그인</a></li>
						<li><a href="#">회원가입</a></li>
					</ul>
				</li>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">공지사항</a></li>
						<li><a href="#">Q&A</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<!-- 상단 메뉴바 -->
	
	<div style="margin: 70px;"></div>

	<div style="text-align: right;">
		<button onClick="location.href='binsertView.kh';" class="btn btn-primary">글쓰기</button>
	</div>

	<div style="margin: 10px;"></div>

	<table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트">
		<caption>게시판 리스트</caption>
		<colgroup> 
			<col width="5%;">
			<col width="60%;">
			<col width="10%;">
			<col width="15%;">
			<col width="10%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col" style="text-align: center;">번호</th> <!-- cBoardNo -->
				<th scope="col" style="text-align: center;">제목</th> <!-- cBoardTitle -->
				<th scope="col" style="text-align: center;">글쓴이</th> <!-- memberId -->
				<th scope="col" style="text-align: center;">날짜</th> <!-- cBoardCreateDate -->
				<th scope="col" style="text-align: center;">조회수</th> <!-- cBoardViewCount -->
			</tr>
		</thead>
		<tbody>
		
			<c:forEach var="b" items="${ list }">
				<tr>
					<td align="center">${b.cBoardNo }</td>
					
					<td align="left">
						<c:if test="${ !empty loginUser }">
							<c:url var="bdetail" value="bdetail.kh">
								<c:param name="cBoardNo" value="${b.cBoardNo }" />
								<c:param name="page" value="${pi.currentPage }" />
							</c:url>
							<a href="${bdetail}">${b.cBoardTitle}</a>
						</c:if>
						<c:if test="${empty loginUser }">${b.cBoardTitle }</c:if>
					</td>
					
					<td align="center">${b.memberId }</td>
					<td align="center">${b.cBoardCreateDate }</td>
					<td align="center">${b.cBoardViewCount }</td>
				</tr>
			</c:forEach>
			
			<tr align="center" height="20">
				<td colspan="6">
					<c:if test="${pi.currentPage <= 1 }">[이전]&nbsp;</c:if>
					<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="blist.kh">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne currentPage }">
						<c:url var="pagination" value="blist.kh">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="blist.kh">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
				
				
				</td>
			</tr>
		
		
			
		</tbody>
	</table>
	
	 <script src="https://ajax.googlepis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
     <script type="text/javascript" src="${contextPath }/resources/js/board/bootstrap.js"></script>
     <!-- 애니매이션 담당 JQUERY -->
     <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>

