<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정페이지</title>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<h1 align="center">${board.cBoardNo }번 게시글 수정하기</h1>
	
	<div style="margin: 50px;"></div>

	<form action="bupdate.kh" method="post" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${ currentPage }">
		<input type="hidden" name="cBoardNo" value="${ board.cBoardNo }">
		<input type="hidden" name="cBoardChaFilename" value="${ board.cBoardChaFilename  }">
		
		<table align="center" id="tb" border="1" cellspacing="0">
			<tr>
				<td>제목</td>
				<td><input type="text" name="cBoardTitle" value="${ board.cBoardTitle  }"></td>
			</tr>
			<tr>
			
				<td>작성자</td>
				<td><input type="text" readonly name="memberName" value="${ board.memberName }"></td>
			</tr>		
			<tr>
				<td>내용</td>
				<td>
					<c:set var="cBoardContent" value="${fn:replace(board.cBoardContent,'<br>','') }"/>
					<textarea cols="50" rows="7" name="cBoardContent ">${ cBoardContent }</textarea>
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
					<c:url var="bList" value="bList.kh">
						<c:param name="page" value="${ currentPage }"/>
					</c:url>
					<a href="${ bList }">목록으로</a>
					<a href="javascript:history.go(-1);">이전페이지로</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>