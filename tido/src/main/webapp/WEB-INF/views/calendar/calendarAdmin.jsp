<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar(admin) : SPEC</title>
<link href='<%= request.getContextPath() %>/resources/css/fullcalendar.min.css' rel='stylesheet' />
<link href='<%= request.getContextPath() %>/resources/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src='<%= request.getContextPath() %>/resources/js/moment.min.js'></script>
<script src='<%= request.getContextPath() %>/resources/js/fullcalendar.min.js'></script>
<script src='<%= request.getContextPath() %>/resources/js/ko.js'></script>
<title>Calendar</title>


<style>
  .outer {
    max-width: 900px;
    margin: 30px auto;
  }
  
  .header button {
  	margin-bottom: 20px;
  }
  
  .selectCode {
  	float: right;
  }
  
  .calendar {
  	float: left;
  }
  
  .registerModal {
  	width : 100%;
  	height : 100%;
  	position : fixed;
  	z-index: 3;
  	background-color: rgba(0, 25, 0, 0.2);
  	top : 0;
  	left : 0;
  	display : none;
  	padding-top : 100px;
  }
  
    .updateModal {
  	width : 100%;
  	height : 100%;
  	position : fixed;
  	z-index: 3;
  	background-color: rgba(0, 25, 0, 0.2);
  	top : 0;
  	left : 0;
  	display : none;
  	padding-top : 100px;
  }
  
  .modal-content{
    margin: auto;
    width: 400px;
    height: 300px;
    background-color: white;
    padding: 0;
    border-radius: 20px;
    position: relative;
  }
  
  #modal-content {
    width: 400px;
  }
  
  .modalRegister {
  	width: 70%;
  	height: 100%;
  	margin: auto;
	/* border: solid 1px black; */
  	padding: 20px 0;
  }
  
  .modalRegister table {
  	width: 100%;
  	height: 80%;
  	padding-top : 40px;
  }
  
  .modalRegister button {
  	margin-top: 40px;
  }
  
  #registerTable1{
  position:relative;
  bottom:450px;
  
  }
</style>
</head>
<body>

	<!------------------------------------ Calendar ----------------------------------->
	
	<div class="outer">
		<div class="header">

		<div id="calendar" class="calendar"></div>
	</div>
	
	<!------------------------------------- REGISTER Modal ------------------------------------->
	
	<div class="registerModal">
	   	<div class="modal-content" id="modal-content">
	   		<div class="modalRegister">
	   		<form action="insertCalendar.kh" id="registerForm" method="GET">
	   			<table id="registerTable1">
		   			<tr>
		   				<td><label for="title" for="title">일정 등록</label></td>
		   				<td><input type="text" name="cTitle" id="title"></td>
		   			</tr>
		   			<tr>
		   				<td><label for="url" for="url">url 등록</label></td>
		   				<td><input type="url" name="cUrl" id="url"></td>
		   			</tr>
		   			<tr>
		   				<td><label for="date">날짜 지정</label></td>
		   				<td><input type="date" name="cStartDate"></td>
		   			</tr>
		   			<tr>
		   				<td><label for="date">날짜 지정</label></td>
		   				<td><input type="date" name="cEndDate"></td>
		   			</tr>
		   			<tr>
		   				<td>공개 여부</td>
		   				<td>
  		   					<input type="radio" id="yStatus" name="cStatus" value="Y" checked>
		   					<label for="yStatus">Y</label>
		   					<input type="radio" id="nStatus" name="cStatus" value="N">
		   					<label for="nStatus">N</label> -->
		   					 <input type="hidden" name="cStatus" value="Y"> 
		   				</td>
		   			</tr>
		   			<tr>
		   				<td colspan="2" style="text-align:center">
		   					<button type="button" class="btn btn-secondary" onclick="saveBtn();">저장</button> &nbsp;&nbsp;
		   					<button type="button" class="btn btn-secondary" onclick="closeBtn();">취소</button>
		   				</td>
		   			</tr>
		   		</table>
		   	</form>
	   		</div>
	   	</div>
	</div>
	
	<!------------------------------------- UPDATE Modal ------------------------------------->
	
	<div class="updateModal">
		<div class="modal-content" id="modal-content">
			<div class="modalRegister" >
	   			<table id="registerTable">
	   				
		   			<tr>
		   				<td><label for="updateTitle">일정 내용</label></td>
		   				<td><input type="text" name="updateTitle" id="updateTitle"></td>
		   			</tr>
		   			<tr>
		   				<td><label for="updateUrl">url 주소</label></td>
		   				<td><input type="url" name="updateUrl" id="updateUrl"></td>
		   			</tr>
		   					<tr>
		   				<td><label for="date">날짜 지정</label></td>
		   				<td><input type="date" name="upStartDate"></td>
		   			</tr>
		   			<tr>
		   				<td><label for="date">날짜 지정</label></td>
		   				<td><input type="date" name="upEndDate"></td>
		   			</tr>
		   			 <tr>
		   				 <td>공개 여부</td>
		   				<td>
		   					<select id="updateStatus">
		   						<option value="Y">공개</option>
		   						<option value="N">비공개</option>
		   					</select>
		   				</td> 
		   			</tr> 
		   			<tr>
		   				<td colspan="2" style="text-align:center">
		   					<button type="button" class="btn btn-secondary" onclick="updateBtn();">수정</button> &nbsp;&nbsp;
		   					<button type="button" class="btn btn-secondary" onclick="deleteBtn();">삭제</button> &nbsp;&nbsp;
		   					<button type="button" class="btn btn-secondary" onclick="closeBtn();">취소</button>
		   				</td>
		   			</tr>
		   		</table>
	   		</div>
		</div>
	</div>
	
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script>
	var id;
	var title;
	var url;
	var startDate;
	var endDate;
	var status;
	
	$(document).ready(function(){
		
		loadCalendar();
		
 		$("#calendar").fullCalendar({
			
			selectable: true,
      		dayClick: function() {
      		},
      		lang: "ko",
 			
      		eventClick: function(event) {
      			updateEvent(event);
      			id = event.id;
      			return false;
      	    }
    	});
	});
	
function loadCalendar() {
		
		$.ajax({
			url :"loadCalendar.kh",
			type : "get",
			dataType : "json",
			data : {cTitle : title, cUrl : url, cStartDate : startDate, cEndDate : endDate},
			success : function(map) {
				
				// 이미 불러왔던 이벤트 초기화
	            $("#calendar").fullCalendar('removeEvents', function(eventObject) {
	                return true;
	            });
				
				
				$.each(map, function(i) {
					if(map[i].status == 'Y') {
 						var eventData;
 							
 							eventData = {
									id : map[i].id,
	 								title : map[i].title,
	 								url : map[i].url,
	 								start : map[i].startDate,
	 								end : map[i].endDate,
	 								backgroundColor : '#ff7f00'
	 						};
 							
 						$('#calendar').fullCalendar('renderEvent', eventData, true);
 						}else if(map[i].status == 'N') {
							
 							var eventData;
 							
 							eventData = {
									id : map[i].id,
	 								title : map[i].title + '(비공개)',
	 								url : map[i].url,
	 								start : map[i].startDate,
	 								end : map[i].endDate,
	 								backgroundColor : '#ff7f00'
	 						};
							$('#calendar').fullCalendar('renderEvent', eventData, true);	
 							
 							
 						}
				});
			},
			error : function() {
				alert("일정을 불러오지 못했습니다.")
			}
			
		}); 
}
function updateBtn() {
	   title = $("input[name=updateTitle]").val();
	   url = $("input[name=updateUrl]").val().trim();
	   startDate = $("input[name=upStartDate]").val();
	   endDate = $("input[name=upEndDate]").val();
	   status = $("#updateStatus").val();
	   
	   $(".updateModal").css("display", "none");
	   
	   $.ajax({
	      url : "updateCalendar.kh",
	      type : "get",
	      data : {cId : id, cTitle : title, cUrl : url, cStartDate : startDate, cEndDate : endDate, cStatus : status},
	      success : function(check) {
	         
	         if(check >0) {
	            alert("일정이 성공적으로 수정되었습니다.");
	            location.reload();
	         }
	      },
	      error : function() {
	         alert("일정 수정 중 오류가 발생하였습니다.");
	      }
	   });
	}
function deleteBtn() {
	$(".updateModal").css("display", "none");
	
	$.ajax({
		url : "deleteCalendar.kh",
		type : "get",
		data : {cId : id},
		success : function(check) {
			if(check > 0) {
				alert("일정이 성공적으로 삭제되었습니다.");
				location.reload();
			}
		},
		error : function() {
			alert("일정 삭제 중 오류가 발생하였습니다.");
		}
	});
}
	function closeBtn(){
		$(".registerModal").css("display", "none");
		$(".updateModal").css("display", "none");
	}
	
	function registerEvent() {
		$("input[name=cTitle]").val('');
		$("input[name=cUrl]").val('');
		$("input[name=cStartDate]").val('');
		$("input[name=cEndDate]").val('');
		$(".registerModal").css("display", "block");
	}
	
	function updateEvent(event) {
		var startDate = event.start.format("YYYY-MM-DD");
		var endDate = event.end.format("YYYY-MM-DD");
		$("input[name=updateTitle]").val(event.title);
		$("input[name=updateUrl]").val(event.url);
		$("input[name=upStartDate]").val(startDate);
		$("input[name=upEndDate]").val(endDate);
		$(".updateModal").css("display", "block");
	}
	
	function saveBtn() {
		title = $("input[name=cTitle]").val();
		url = $("input[name=cUrl]").val().trim();
		startDate = $("input[name=cStartDate]").val();
		endDate = $("input[name=cEndDate]").val();
		$(".registerModal").css("display", "none");
		
		$.ajax({
			url : "insertCalendar.kh",
			type : "get",
			data : {cTitle : title, cUrl : url, cStartDate : startDate, cEndDate : endDate},
			success : function(check) {
				if(check > 0) {
					alert("일정이 성공적으로 등록이 되었습니다");
					location.reload();	
				}
			},
			error : function() {
				alert("일정 등록 중 오류가 발생하였습니다.");
			}
		});
	}
	
	
	
	
	
</script>
</body>
</html>