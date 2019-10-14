<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정페이지</title>
<style>
table tr td{
color: white;
background-color: #323232;
}
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div style="margin: 70px;"></div>
		
	<table style="margin: auto;">
		<thead>
			<tr>
				<th colspan="5" style="color: white; font-size: 40px; text-align: center; background-color: #212529; width: 1185px; 
				height: 90px; border-radius: 30px 30px 0px 0px;">${board.cBoardNo }번 게시글 수정하기</th>
			</tr>
		</thead>
	</table>
	

	<form action="bupdate.kh" method="post" enctype="multipart/form-data">
		<input type="hidden" name="page" value="${ currentPage }">
		<input type="hidden" name="cBoardNo" value="${ board.cBoardNo }">
		<input type="hidden" name="cBoardChaFilename" value="${ board.cBoardChaFilename  }">
		
		<table align="center" id="tb" cellspacing="0">
			<tr>
				<td style="height: 10px;"></td>
				<td style="height: 10px;"></td>
				<td style="width: 10px;"></td>
			</tr>
			<tr>
				<td style="width: 100px;">⊙ 제목</td>
				<td><input type="text" name="cBoardTitle" value="${ board.cBoardTitle  }" style="width: 100%;"></td>
				<td style="width: 10px;"></td>
			</tr>
			<tr>
				<td>⊙ 작성자</td>
				<td><input type="text" readonly name="memberName" value="${ board.memberName }" style="width: 100%;"></td>
				<td style="width: 10px;"></td>
			</tr>		
			<tr>
				<td>⊙ 내용</td>
				<td>
					<c:set var="cBoardContent" value="${fn:replace(board.cBoardContent,'<br>','') }"/>
					<textarea cols="150" rows="15" name="cBoardContent ">${ cBoardContent }</textarea>
					<td style="width: 10px;"></td>
				</td>
			</tr>
			<tr>
				<td>⊙ 첨부파일</td>
				<td>
					<input type="file" name="reloadFile">
					<c:if test="${ !empty board.cBoardOriFilename }">
						<br>현재 업로드한 파일 : 
						<a href="${ contextPath }/resources/buploadFiles/${ board.cBoardChaFilename }" download>${ board.cBoardOriFilename }</a>
					</c:if>
					<td style="width: 10px;"></td>
				</td>
			</tr>
			<tr>
				<td style="height: 70px;"></td>
				<td style="height: 70px;"></td>
				<td style="width: 10px;"></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기" class="btn btn-outline-primary waves-effect"> &nbsp;
					<c:url var="bList" value="bList.kh">
						<c:param name="page" value="${ currentPage }"/>
					</c:url>
					
					<a href="${ bList }" class="btn btn-outline-warning waves-effect">목록으로</a>&nbsp;&nbsp;
					<a href="javascript:history.go(-1);" class="btn btn-outline-danger waves-effect">취소하기</a>
				</td>
				<td style="width: 10px;"></td>
			</tr>
			
		</table>
	</form>
</body>
</html>