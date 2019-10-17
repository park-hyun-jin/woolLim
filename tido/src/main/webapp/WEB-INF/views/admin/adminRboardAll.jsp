<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>

#tb {
  position:relative;
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  position: relative;
  top:20px;
  
 
}

#tb td, #tb th {
  border: 1px solid #ddd;
  padding: 8px;
}

#tb tr:nth-child(even){background-color: #f2f2f2;}

#tb tr:hover {background-color: #ddd;}

#tb th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #007bff;
  color: white;
}



.paging{
	position: relative;
	top: 25px;
	text-align:center;
}

#searchArea{
	position: relative;
	top: 40px;
	left: 10px;
}
#return{
	position: relative;
	top: 40px;
	text-align:center;

}



</style>







<meta charset="UTF-8">
<title>Insert title here</title>

</head>



<body>

	<jsp:include page="adminMenubar.jsp"/>
	
	<div class="container-fluid">
      <div class="row">
      
	<jsp:include page="adminAside.jsp" />
	<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
	<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">신고사항 관리</h1>
            
          </div>
	
	
	
	
	 <div id="reportConditionArea" align="left">

	<select id="reportCondition">	
			<option value="0">전체</option>
			<option value="1">욕설 및 비방</option>
			<option value="2">명예훼손 / 사생활 침해</option>
			<option value="3">부적절한 홍보 게시글</option>
			<option value="4">저작권침해</option>
			<option value="5">무분별한 정치적 발언</option>
			<option value="6">악성코드</option>
			<option value="7">중복된 글 연속 삽입</option>
	
		</select>
		
		<select id="rReportType">
		<option value="0">전체(신고물 유형)</option>
		<option value="3">일반 게시판 신고</option>
		<option value="4">일반 게시판 댓글 신고</option>
	
	</select>	
	
	</div> 
	
	
	
	<!--  width="1000" -->
	
	
	
	<table align="center" border="1" cellspacing="0" width="800" id="tb" class="tablesorter">
	
	
	<tr>
			
			<th>신고 번호</th>
			<th>신고 내용</th>
			<th>글 번호</th>
			<th>작성자</th>
			<th>신고물 유형</th>
			<th>신고 날짜</th>
			<th>status</th>
		</tr>
	
		<tbody>
		 <c:forEach var="r" items="${ list }">
	
		<tr>
			
			<td align="center">${ r.rReportNo }</td>	
			
			<td align="center">
			<c:url var="adminRdetail" value="adminRdetail.kh">
			<c:param name="rReportNo" value="${r.rReportNo }" />
			</c:url>
			<a href="${ adminRdetail }" style="color: black;">${ r.rReportContent }</a>
			</td>
			
			<td align="center">${ r.rContentsNo }</td>			
			<td align="center">${ r.rMemberId }</td>
			
			<td align="center">
			<c:choose>
			
				<c:when test="${r.rReportType==3}">
					일반 게시판 신고					
				</c:when>
				<c:when test="${r.rReportType==4}">
					일반 게시판 댓글 신고					
				</c:when>
					<c:otherwise>
					해당하는 유형이 아닙니다.
					</c:otherwise>
			</c:choose>
			</td>
			
			
			
			<td align="center">${ r.rReportDate }</td>
			<td align="center">${ r.reportStatus }</td>
			
		</tr>
		</c:forEach>
			</tbody>
		
		</table>
		
		
		<!-- 페이징 처리 -->
		<div class="paging">
		<tr align="center" height="20">
			<td colspan="6">
			
				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="adminRboardListAll.kh">
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
						<c:url var="pagination" value="adminRboardListAll.kh">
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
					<c:url var="after" value="adminRboardListAll.kh">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
			
		</tr>
	</div>
		
		
   
		
		
		<!-------------- 게시물 검색하기 --------------->
	<div id="searchArea" align="center">
		<form action="adminRsearch.kh" name="searchForm" method="get">
			
			<select id="searchCondition" name="searchCondition">
				<option value="all" <c:if test="${search.searchCondition == 'all'}">selected</c:if> >전체</option>
				<option value="content" <c:if test="${search.searchCondition == 'content'}">selected</c:if> >신고 내용</option>
				<option value="writer" <c:if test="${search.searchCondition == 'writer'}">selected</c:if> >신고한 회원</option>
			</select>
			
			<input type="search" name="searchValue" value="${search.searchValue}">
			<button>검색</button><br>
			
			
			
		</form>
		<div id="return">
	<p align="center">
		<c:url var="home" value="admin.kh"/>
		<a href="${ home }">시작 페이지로 이동</a> &nbsp;
		<c:url var="rlist" value="adminRboardListAll.kh"/>
		<a href="${ rlist }">목록 전체 보기</a>
	</p>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	</div>
		
		
	</div>
		
	</div>
	
	


	
	
	<script>
	
	
	
	$(function(){
			var no = '${param.rRrno}';
			if(no!=""){
				$("#reportCondition").val(Number(no));
			}
	
			var no2 = '${param.rReportType}';
			if(no2!=""){
				$("#rReportType").val(Number(no2));
				
			
		}
			
			
	
		$("#reportCondition").on("change",function(){
	   		 var rRrno = $("#reportCondition option:selected").val(); //전체, 제목, 작성자
	   		 location.href="adminRrnosearch.kh?rRrno="+rRrno;
		 }); 
		
		$("#rReportType").on("change",function(){
	   		 var rReportType = $("#rReportType option:selected").val(); //전체, 제목, 작성자
	   		 location.href="adminReportTypeSearch.kh?rReportType="+rReportType;
		 }); 
		
		
	 });
	
	    
	</script>
	
	<script type="text/javascript" src="${contextPath }/resources/js/admin/dashboard.js"></script>
	<script>
	$(document).ready(function(){
		$(".report").addClass("active");
	});
	
	</script>
	
	
	
</body>
</html>