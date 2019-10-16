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
  background-color: teal;
  color: white;
}

.button {
  background-color: #ddd;
  border: none;
  color: black;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 16px;
}

#reviveBtn{
	position: relative;
	bottom: 400px;
	left: 980px;
}

#deleteBtn{
	position: relative;
	bottom: 400px;
	left: 960px;
}


.paging{
	position: relative;
	top: 25px;
	left: 570px;
}

#searchArea{
	position: relative;
	top: 40px;
	left: 10px;
}
#return{
	position: relative;
	top: 40px;
	left: 30px;

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
            <h1 class="h2">Q&A 관리</h1>
            
          </div>
	
	<div class="my-4 w-100" id="myChart" width="900" height="380" >
	
	
	<button class="button" onclick="location='iboardListN.kh'">삭제된 게시글</button>
	<button class="button" onclick="location='iboardList.kh'">삭제 안 된 게시글</button>
	
	
	
	
	<!--  width="1000" -->
	
	
	
	<table align="center" border="1" cellspacing="0" width="800" id="tb" class="tablesorter">
	
	
	<tr>
			<th><input type="checkbox" name="checkAll" id="th_checkAll"/></th>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>status</th>
		</tr>
	
		
		 <c:forEach var="i" items="${ list }">
	<tbody>
		<tr>
			<td><input type="checkbox" name="chBox" class="chBox" value="${i.iNo}" /></td>
			<td align="center">${ i.iNo }</td>				
			<td align="center">	${ i.iInquiryTitle }</td>			
			<td align="center">${ i.iInquiryId }</td>
			<td align="center">${ i.iInquiryDate }</td>
			<td align="center">${ i.iInquiryStatus }</td>
			
		</tr>
			</tbody>
		</c:forEach>
		
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
					<c:url var="before" value="I-iboardListAll.kh">
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
						<c:url var="pagination" value="iboardListAll.kh">
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
					<c:url var="after" value="iboardListAll.kh">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
			</td>
			
		</tr>
	</div>
		
		
   
		
		
		<!-------------- 게시물 검색하기 --------------->
	<div id="searchArea" align="center">
		<form action="adminIsearch.kh" name="searchForm" method="get">
			
			<select id="searchCondition" name="searchCondition">
				<option value="all" <c:if test="${search.searchCondition == 'all'}">selected</c:if> >전체</option>
				<option value="title" <c:if test="${search.searchCondition == 'title'}">selected</c:if> >제목</option>
				<option value="writer" <c:if test="${search.searchCondition == 'writer'}">selected</c:if> >작성자</option>
			</select>
			
			<input type="search" name="searchValue" value="${search.searchValue}">
			<button>검색</button><br>
			첨부파일 있는 게시물만
			<input type="checkbox" name="existFile" <c:if test="${!empty search.existFile }">checked</c:if> >
			
			
		</form>
	</div>
		
	</div>
	
	<div id="return">
	<p align="center">
		<c:url var="home" value="admin.kh"/>
		<a href="${ home }">시작 페이지로 이동</a> &nbsp;
		<c:url var="blist" value="iboardListAll.kh"/>
		<a href="${ blist }">목록 전체 보기</a>
	</p>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	<button class="button" id="deleteBtn">선택삭제</button> 
	<button class="button" id="reviveBtn">선택복구</button> 
	</div>


	
	
	<script>
	
	
	
	$(function(){
		
		
		
	
			$("#th_checkAll").on("change",function(){
			if($(this).prop("checked")){
				$("input[name='chBox']").prop("checked",true);				
			}else{
				$("input[name='chBox']").prop("checked",false);				
				
			}
			});
			
			$("#deleteBtn").on("click",function(){
				var checkArray= new Array();
				if(window.confirm("정말 삭제하시겠습니까?")){
					$("input[name='chBox']:checked").each(function(){
						checkArray.push($(this).val());
					});
					console.log(checkArray);
					$.ajax({
						url:"deleteIBoard.kh",
						data:{checkArray:checkArray},
						type:"post",
						success:function(result){
							if(result>0){
								location.reload();
							}
							console.log(result);
						}
						
					});
				}
			});
			
			$("#reviveBtn").on("click",function(){
				var checkArray= new Array();
				if(window.confirm("정말 복구하시겠습니까?")){
					$("input[name='chBox']:checked").each(function(){
						checkArray.push($(this).val());
					});
					console.log(checkArray);
					$.ajax({
						url:"reviveIBoard.kh",
						data:{checkArray:checkArray},
						type:"post",
						success:function(result){
							if(result>0){
								location.reload();
							}
							console.log(result);
						}
						
					});
				}
			});
			
			
			
	});
	
	
	
	
	</script>
	
	
	
	
	
</body>
</html>