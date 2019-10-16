<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지 userManagement</title>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" ></link>
<style>
	#myTable>thead>tr{
		background-color:#007bff;
		color:white;
	}
</style>
</head>
<body>

	<jsp:include page="adminMenubar.jsp" />

	<div class="container-fluid">
      <div class="row">
      
      <jsp:include page="adminAside.jsp" />
      
      <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">유저 관리 페이지</h1>
            
          </div>
    	<br>
              
          <h2>유저 목록</h2>
          <div class="table-responsive" style="width:98%;">
            <table class="table table-striped table-sm" id="myTable">
              <thead>
                <tr>
                  <th width="5%"><input type="checkbox" name="checkAll" id="th_checkAll"/></th>
                  <th width="30%">아이디</th>
                  <th width="15%">닉네임</th>
                  <th width="10%">신고횟수</th>
                  <th width="10%">제제횟수</th>
                  <th width="20%">가입일</th>
                  <th width="10%">상태</th>
                </tr>
              </thead>
              <tbody>
              <c:forEach var="m" items="${list}">
                <tr>
                <c:url var="amdetail" value="amdetail.kh">
					<c:param name="id" value="${ m.id }"/> 
				</c:url>
				  <td><input type="checkbox" name="chBox" class="chBox" value="${m.id}" /></td>
                  <td><a href="${ amdetail }">${ m.id }</a></td>
                  <td><a href="${ amdetail }">${ m.name }</a></td>
                  <td>${m.reportCount }</td>
                  <td>${m.banCount }</td>
                  <td>${m.enrollDate }</td>
                  <td>${m.status }</td>
                </tr>
              </c:forEach>
              </tbody>
            </table>
           <br>
           <div align="right">
          <button id="deleteBtn">장비를 정지합니다.</button>
          <button id="reviveBtn">영웅은.. 죽지않아요!</button>
          </div>
          </div>
        </main>
      </div>
    </div>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="${contextPath }/resources/js/admin/dashboard.js"></script>
	<script>
		$(document).ready(function(){
			
			$("#th_checkAll").on("change",function(){
				if($(this).prop("checked")){
					$("input[name='chBox']").prop("checked",true);				
				}else{
					$("input[name='chBox']").prop("checked",false);				
					
				}
				});
			
			$(".chBox").on("change",function(){
				if(!$(this).prop("checked")){
					$("#th_checkAll").prop("checked",false);	
				}
			});
				
			$("#deleteBtn").on("click",function(){
				var checkArray= new Array();
				if(window.confirm("정말 변경하시겠습니까? 리얼리? 참트루?")){
					$("input[name='chBox']:checked").each(function(){
						checkArray.push($(this).val());
					});
					$.ajax({
						url:"aDeleteMember.kh",
						data:{checkArray:checkArray},
						type:"post",
						success:function(result){
							if(result>0){
								location.reload();
							}
						}	
					});
				}
			});
			
			$("#reviveBtn").on("click",function(){
				var checkArray= new Array();
				if(window.confirm("정말 변경하시겠습니까? 정말?정말?정말?정말?")){
					$("input[name='chBox']:checked").each(function(){
						checkArray.push($(this).val());
					});
					$.ajax({
						url:"aReviveMember.kh",
						data:{checkArray:checkArray},
						type:"post",
						success:function(result){
							if(result>0){
								location.reload();
							}							
						}						
					});
				}
			});
			
			$(".users").addClass("active");
			
			var table = $('#myTable').DataTable({
				order: [[5,"desc"]],
				"language": {
			        "emptyTable": "데이터가 없어요.",
			        "lengthMenu": "페이지당 _MENU_ 개씩 보기",
			        "info": "현재 _START_ - _END_ / _TOTAL_건",
			        "infoEmpty": "데이터 없음",
			        "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
			        "search": "검색: ",
			        "zeroRecords": "일치하는 데이터가 없어요.",
			        "loadingRecords": "로딩중...",
			        "processing":     "잠시만 기다려 주세요...",
			        "paginate": {
			            "next": "다음",
			            "previous": "이전"
			        }
			    },
				
			});
			
		    
		    $('#myTable_filter').prepend('<input type="text" id="toDate" placeholder="yyyy-MM-dd"> ');
		    $('#myTable_filter').prepend('<input type="text" id="fromDate" placeholder="yyyy-MM-dd">~');
		    
		    $.fn.dataTable.ext.search.push(
		    	    function(settings, data, dataIndex){
		    	        var min = Date.parse($('#fromDate').val());
		    	        var max = Date.parse($('#toDate').val());
		    	        var targetDate = Date.parse(data[5]);
		    	 
		    	        if( (isNaN(min) && isNaN(max) ) || 
		    	            (isNaN(min) && targetDate <= max )|| 
		    	            ( min <= targetDate && isNaN(max) ) ||
		    	            ( targetDate >= min && targetDate <= max) ){ 
		    	                return true;
		    	        }
		    	        return false;
		    	    }
		    	)
		    
		    $('#toDate, #fromDate').unbind().bind('keyup',function(){
			    table.draw();
			})

		});
	</script>
</body>
</html>