<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		width:55%;
		height:800px;
		margin:auto;
		
	}
	.boardInsertbtn{
	 	background-color: rgb(25,25,25) !important;
	 	border: 2px solid rgb(25,25,25) !important;
	 	margin:10px 10px 0 0;
	}
	#header>h2{
		padding:10px;
		width:85%;
		display:inline-block;
		color: white;

	}
	table{
		margin:auto;
	}
	.pBoard{
		width:100%;
		height:200px;
		background: rgba(255,255,255,0.5);
		border-radius: 15px;
		margin-bottom: 10px;
	
	}
	.pBoard>div{
		float:left;
	
	}
	.thumbnaill{
		padding:20px;
		width:30%;
		height: 100%;
		
	}
	.thumbnaill>img{
		width:100%;
		height: 100%;
	}
	.pBoardInfo{
		margin:10px 0 10px 0;
		width:40%;
		height: 90%;
		border-right: 2px solid lightgrey;
	}
	.pBoardInfo2{
		padding:20px;
		width:30%;
		height: 100%;
	}
	.pBoardInfo>div:first-child {
		height: 20%;
		margin-bottom:5%;
		width: 100%;	
	}
	.pBoardInfo>div:last-child {
		height: 75%;
		width: 100%;	
	}
	.like>span,.view>span,.date{
		font-size: 15px;
		margin-left:5px;
		color:white;
		font-weight: bolder;
	}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<section>
	<div id="header" >
		<h2>프로젝트 공유 게시판</h2>
		<button onClick="location.href='binsertView.kh'" class="btn btn-primary boardInsertbtn">공유하기</button>
	</div>

	<div style="margin: 10px;"></div>

	   <table class="sub_news"  summary="게시판의 글제목 리스트" style="width: 100%; background-color: rgba(25,25,25,0.5);">
	
		<tbody style="color: white;">		
			<c:choose>
				<c:when test ="${!empty pbList }">
					<c:forEach var="pb" items="${ pbList }">
						<div class="pBoard">
							<div class="thumbnaill">
								<img src="${pb.projectImagePath}">
							</div>
							<div class="pBoardInfo">
								<div><h3>${pb.pBoardTitle}</h3></div>
								<div>${pb.pBoardContent}</div>
							</div>
							<div class="pBoardInfo2">
								<div class="count">
									<div class="like">
									<img src="${contextPath }/resources/images/like.png" width=24px; height="24px">
									<span>${pb.pBoardLikeCount }</span>
									</div>
									<div class="view">
									<img src="${contextPath }/resources/images/listen-music.png" width=24px; height="24px">
									<span>${pb.pBoardViewCount}</span>
									</div>
									<div class="date">${pb.pBoardCreateDate}</div>
								</div>
								<div>
									<img src="${contextPath }/resources/muploadFiles/${pb.writerId}/${pb.writerImagePath}" width="64" height="64">
									<span>${pb.memberName}</span>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
			<tr align="center" height="20" style="background-color: rgb(25,25,25);">
				<td colspan="6">
					<c:if test="${pi.currentPage <= 1 }">[이전]&nbsp;</c:if>
					<c:if test="${ pi.currentPage > 1 }">
						<c:url var="before" value="bList.kh">
							<c:param name="page" value="${ pi.currentPage - 1 }"/>
						</c:url>
						<a href="${ before }" style="color: white;">[이전]</a> &nbsp;
					</c:if>
					
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq currentPage }">
							<font color="red" size="5"><b>[${ p }]</b></font>
						</c:if>
						
						<c:if test="${ p ne currentPage }">
							<c:url var="pagination" value="bList.kh">
								<c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ pagination }" style="color: white;">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">[다음]</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="bList.kh">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
						</c:url> 
						<a href="${ after }" style="color: white;">[다음]</a>
					</c:if>
					</td>
				</tr>
			</tbody>
		</table>
		</section>
	     	<jsp:include page="../common/footer.jsp"/>
</body>
</html>