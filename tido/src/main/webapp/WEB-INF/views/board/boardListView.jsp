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
<jsp:include page="../common/menubar.jsp"/>
   <div style="margin: 50px;"></div>
   <h1 class="page-header" style="color: white; font-weight: bold;">게시판 목록</h1>
   <div></div>

   <!-- 상단 메뉴바 -->
   <nav class="navbar navbar-default" style="background-color: #212529;">
      <div class="navbar-header">
         <a class="navbar-brand" href="${contextPath }" style="font-size: 22px; float: left;">WOOLLIM</a>
      </div>
   </nav>
   <!-- 상단 메뉴바 -->
   
   <!-- <div style="margin: 70px;"></div> -->

   <div id="wr" style="text-align: right;">
      <button onClick="location.href='binsertView.kh'" class="btn btn-primary" style="background-color: #4B0082">글쓰기</button>
   </div>

   <div style="margin: 10px;"></div>

   <table class="sub_news" border="1" cellspacing="0" summary="게시판의 글제목 리스트" style="width: 70%; background-color: #343a40;">
      <caption>게시판 리스트</caption>
      <colgroup> 
         <col width="5%;">
         <col width="60%;">
         <col width="10%;">
         <col width="15%;">
         <col width="10%;">
      </colgroup>
      <thead style="background: linear-gradient(to bottom, grey, black);">
         <tr style="height: 50px;"> <!-- #F8F8FF -->
            <th scope="col" style="color:white; vertical-align: middle; background-color: #212529; font-size: 17px; vertical-align: middle;">번호</th> <!-- cBoardNo -->
            <th scope="col" style="color:white; text-align: center; background-color: #212529; font-size: 17px; vertical-align: middle;">제목</th> <!-- cBoardTitle -->
            <th scope="col" style="color:white; text-align: center; background-color: #212529; font-size: 17px; vertical-align: middle;">글쓴이</th> <!-- memberId -->
            <th scope="col" style="color:white; text-align: center; background-color: #212529; font-size: 17px; vertical-align: middle;">날짜</th> <!-- cBoardCreateDate -->
            <th scope="col" style="color:white; text-align: center; background-color: #212529; font-size: 17px; vertical-align: middle;">조회수</th> <!-- cBoardViewCount -->
         </tr>
      </thead>
      
      <tbody style="color: white;">      
         <c:forEach var="b" items="${ list }">
            <tr>
               <td align="center">${b.cBoardNo }</td>
               
               <td align="left">
                  <c:if test="${ !empty loginUser }">
                     <c:url var="bdetail" value="bdetail.kh">
                        <c:param name="cBoardNo" value="${b.cBoardNo }" />
                        <c:param name="page" value="${pi.currentPage }" />
                     </c:url>
                     <a href="${bdetail}" style="color: white;">${b.cBoardTitle}</a>
                  </c:if>
                  <c:if test="${empty loginUser }">${b.cBoardTitle }</c:if>
               </td>
               
               <td align="center">${b.memberName }</td>
               <td align="center">${b.cBoardCreateDate }</td>
               <td align="center">${b.cBoardViewCount }</td>
            </tr>
         </c:forEach>
         
         <tr align="center" height="20" style="background-color: #212529;">
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
      
   <div style="margin: 50px;"></div>
      
   <!-------------- 게시물 검색하기 --------------->
   <div id="searchArea" align="center">
      <form action="bSearch.kh" name="searchForm" method="get">
         <select id="searchCondition" name="searchCondition" style="width: 100px; height: 40px; font-size: 12px;">
            <option value="all" <c:if test="${search.searchCondition == 'all'}">selected</c:if> >전체</option>
            <option value="writer" <c:if test="${search.searchCondition == 'writer'}">selected</c:if> >작성자</option>
            <option value="title" <c:if test="${search.searchCondition == 'title'}">selected</c:if> >제목</option>
            <option value="content" <c:if test="${search.searchCondition == 'content'}">selected</c:if> >내용</option>
         </select>
         <input type="search" name="searchValue" value="${search.searchValue}" style="width: 350px; height: 40px;">&nbsp;&nbsp;&nbsp;
         <button class="btn btn-light">검색</button><br><br>
         <input type="checkbox"  name="existFile"<c:if test="${!empty search.existFile }">checked</c:if> >      
         <p style="color: white; font-size: 15px;">첨부파일 있는 게시물</p>
      </form>
   </div><jsp:include page="../common/footer.jsp"/>
   <!-------------- 게시물 검색하기 --------------->
   <script src="https://ajax.googlepis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
   <script type="text/javascript" src="${contextPath }/resources/js/board/bootstrap.js"></script>
   <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>
