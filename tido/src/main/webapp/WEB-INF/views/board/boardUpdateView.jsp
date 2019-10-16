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

   <div style="margin: 70px;"></div>

   <table style="margin: auto;">
      <thead>
         <tr>
            <th colspan="5" style="color: white; font-size: 40px; text-align: center; background-color: #212529; 
            width: 1185px; height: 90px; border-radius: 30px 30px 0px 0px;">${board.cBoardNo }번 게시글 수정하기</th>
         </tr>
      </thead>
   </table>


   <form action="bupdate.kh" method="post" enctype="multipart/form-data" style="width: 1185px;">
      <input type="hidden" name="page" value="${ currentPage }"> 
      <input type="hidden" name="cBoardNo" value="${ board.cBoardNo }"> 
      <input type="hidden" name="cBoardChaFilename" value="${ board.cBoardChaFilename  }">

      <table align="center" id="tb" cellspacing="0"></table>
   </form>
   <br>
   <form method="post" action="bupdate.kh" style="width: 62%; margin: auto;  background-color: rgb(255,255,255,0.3);">
   <input type="hidden" name="cBoardNo" value="${ board.cBoardNo }" style="display: none;"> 
      <!-- <input type="text" name="writer" style="width: 20%;" placeholder="작성자" /><br> -->
      <table style="width: 100%; ">
      <tr>
         <td><input type="text" readonly name="memberName" value="${ board.memberName }" style="width: 100%;"></td>
      </tr>
      <tr>
         <td><input type="text" name="cBoardTitle" value="${ board.cBoardTitle  }" style="width: 100%;"></td>
      </tr>
      <br><br>
      <!-- <textarea id="summernote" name="content"> -->
      <tr>
         <td><c:set var="cBoardContent" value="${fn:replace(board.cBoardContent,'<br>','') }" /> 
         <textarea id="summernote" cols="150" rows="15" name="cBoardContent">${ cBoardContent }</textarea>
      </tr>
      <tr>
         <td style=" background-color: rgb(255,255,255,0.3); height: 20px;">
            <input type="file" name="reloadFile"> 
            <c:if test="${ !empty board.cBoardOriFilename }">
               <br>현재 업로드한 파일 : 
               <a href="${ contextPath }/resources/buploadFiles/${ board.cBoardChaFilename }" download>${ board.cBoardOriFilename }</a>
            </c:if>
         </td>
      </tr>
      <tr>
         <td style="background-color: rgb(255,255,255,0.3); height: 40px;"></td>   
      </tr>
            
      <tr>
         <td style="background-color: rgb(255,255,255,0.3); height: 70px; text-align:center;" >
            <input  type="submit" value="수정하기" class="btn btn-primary"> &nbsp;
            <c:url var="bList" value="bList.kh">
               <c:param name="page" value="${ currentPage }"/>
            </c:url>
            
            <a href="${ bList }" class="btn btn-warning">목록으로</a>&nbsp;&nbsp;
            <a href="javascript:history.go(-1);" class="btn btn-danger">취소하기</a>
         </td>
      </tr>
      </table>
   <!-- </textarea> -->
      <!-- <input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)" /> -->
      
   </form>
   <jsp:include page="../common/footer.jsp"/>
</body>
</html>