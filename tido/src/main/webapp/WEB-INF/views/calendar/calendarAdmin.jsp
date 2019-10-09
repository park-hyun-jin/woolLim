<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.tido.calendar.model.vo.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%
	ArrayList<Calendar> eventList = (ArrayList<Calendar>)request.getAttribute("eventList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar(admin) : SPEC</title>
<link href='<%= request.getContextPath() %>/css/fullcalendar.min.css' rel='stylesheet' />
<link href='<%= request.getContextPath() %>/css/fullcalendar.print.min.css' rel='stylesheet' media='print' />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src='<%= request.getContextPath() %>/js/moment.min.js'></script>
<script src='<%= request.getContextPath() %>/js/fullcalendar.min.js'></script>
<script src='<%= request.getContextPath() %>/js/ko.js'></script>
<title>Calendar</title>
<script>

	var id;
	var title;
	var url;
	var date;
	var status;
	var code;

	$(document).ready(function(){
		
		loadCalendar(3);  

 		$("#calendar").fullCalendar({
			
			selectable: true,
      		dayClick: function() {
      		},
      		lang: "ko",
 			
      		eventClick: function(info) {
      			updateEvent(info);
      			id = info.id;
      			return false;
      	    }
    	});

	});
	
	function loadCalendar(code) {
		
		$.ajax({
			url :"<%=request.getContextPath()%>/loadCalendar.do",
			type : "get",
			dataType : "json",
			data : { code : code },
			success : function(map) {
				
				// 이미 불러왔던 이벤트 초기화
	            $("#calendar").fullCalendar('removeEvents', function(eventObject) {
	                return true;
	            });
				
				// code 값에 따라 이벤트 불러오기
				$.each(map, function(i) {
 					if(map[i].status == 'Y') {
 						var eventData;
 						if(map[i].code == 0) {
							eventData = {
									id : map[i].id,
	 								title : map[i].title,
	 								url : map[i].url,
	 								start : map[i].date,
	 								backgroundColor : '#ff7f00'
	 						};
 							
 						}else if(map[i].code == 1) {
 							eventData = {
 									id : map[i].id,
 	 								title : map[i].title,
 	 								url : map[i].url,
 	 								start : map[i].date,
		 							backgroundColor : 'green'
 	 						};
 						}else {
 							eventData = {
 									id : map[i].id,
 	 								title : map[i].title,
 	 								url : map[i].url,
 	 								start : map[i].date,
		 							backgroundColor : 'blue'
 	 						};
 						}
 						$('#calendar').fullCalendar('renderEvent', eventData, true);
					}else if(map[i].status == 'N') {
 						var eventData;
 						if(map[i].code == 0) {
							eventData = {
									id : map[i].id,
	 								title : map[i].title + '(비공개)',
	 								url : map[i].url,
	 								start : map[i].date,
	 								backgroundColor : '#ff7f00'
	 						};
 							
 						}else if(map[i].code == 1) {
 							eventData = {
 									id : map[i].id,
 	 								title : map[i].title + '(비공개)',
 	 								url : map[i].url,
 	 								start : map[i].date,
		 							backgroundColor : 'green'
 	 						};
 						}else {
 							eventData = {
 									id : map[i].id,
 	 								title : map[i].title + '(비공개)',
 	 								url : map[i].url,
 	 								start : map[i].date,
		 							backgroundColor : 'blue'
 	 						};
 						}
 						$('#calendar').fullCalendar('renderEvent', eventData, true);
 					}
				});
			},
			error : function() {
				alert("일정을 불러오지 못했습니다.")
			}
		});
	}
	
	function closeBtn(){
		$(".registerModal").css("display", "none");
		$(".updateModal").css("display", "none");
	}
	
	function registerEvent() {
		$("input[name=title]").val('');
		$("input[name=url]").val('');
		$("input[name=date]").val('');
		$(".registerModal").css("display", "block");
	}
	
	function updateEvent(info) {
		var startDate = info.start.format("YYYY-MM-DD");
		$("input[name=updateTitle]").val(info.title);
		$("input[name=updateUrl]").val(info.url);
		$("input[name=updateDate]").val(startDate);
		$(".updateModal").css("display", "block");
	}
	
	function saveBtn() {
		title = $("input[name=title]").val();
		url = $("input[name=url]").val().trim();
		date = $("input[name=date]").val();
		status = $("#status").val();
		code = $("input[name=code]:checked").val();
		
		$(".registerModal").css("display", "none");
		
		$.ajax({
			url : "insertCalendar.kh",
			type : "get",
			data : {title : title, url : url, date : date, status : status, code : code},
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
	
	function updateBtn() {
		title = $("input[name=updateTitle]").val();
		url = $("input[name=updateUrl]").val().trim();
		date = $("input[name=updateDate]").val();
		status = $("#updateStatus").val();
		code = $("input[name=updateCode]:checked").val();
		
		$(".updateModal").css("display", "none");
		
		$.ajax({
			url : "../../updateCalendar.do",
			type : "get",
			data : {id : id, title : title, url : url, date : date, status : status, code : code},
			success : function(check) {
				if(check > 0) {
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
			url : "../../deleteCalendar.do",
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
	
</script>
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
</style>
</head>
<body>

	<!------------------------------------ Calendar ----------------------------------->
	
	<div class="outer">
		<div class="header">
			<button type="button" class="btn btn-primary" onclick="registerEvent();" style="float:left">일정 등록</button>
			<div class="selectCode">
				<button type="button" class="btn btn-dark btn-sm" onclick="loadCalendar(3)">전체</button>
				<button type="button" class="btn btn-warning btn-sm" onclick="loadCalendar(0)">기사</button>
				<button type="button" class="btn btn-success btn-sm" onclick="loadCalendar(1)">발매</button>
				<button type="button" class="btn btn-primary btn-sm" onclick="loadCalendar(2)">예약</button>
			</div>
		</div>
		<div id="calendar" class="calendar"></div>
	</div>
	
	<!------------------------------------- REGISTER Modal ------------------------------------->
	
	<div class="registerModal">
	   	<div class="modal-content" id="modal-content">
	   		<div class="modalRegister">
	   			<table id="registerTable">
	   				<tr>
	   					<td><label>일정 유형</label>
	   					<td>
	   						<input type="radio" id="news" name="code" value="0" checked>
	   						<label for="code">기사</label> &nbsp;
	   						<input type="radio" id="release" name="code" value="1" >
	   						<label for="release">발매</label> &nbsp;
	   						<input type="radio" id="reservation" name="code" value="2">
	   						<label for="reservation">예약</label> &nbsp;
	   					</td>
	   				</tr>
		   			<tr>
		   				<td><label name="title" for="title">일정 등록</label></td>
		   				<td><input type="text" name="title" id="title"></td>
		   			</tr>
		   			<tr>
		   				<td><label name="url" for="url">url 등록</label></td>
		   				<td><input type="url" name="url" id="url"></td>
		   			</tr>
		   			<tr>
		   				<td><label name="date">날짜 지정</label></td>
		   				<td><input type="date" name="date"></td>
		   			</tr>
		   			<tr>
		   				<td>공개 여부</td>
		   				<td>
		   					<select id="status">
		   						<option value="Y">공개</option>
		   						<option value="N">비공개</option>
		   					</select>
		   				</td>
		   			</tr>
		   			<tr>
		   				<td colspan="2" style="text-align:center">
		   					<button type="button" class="btn btn-secondary" onclick="saveBtn();">저장</button> &nbsp;&nbsp;
		   					<button type="button" class="btn btn-secondary" onclick="closeBtn();">취소</button>
		   				</td>
		   			</tr>
		   		</table>
	   		</div>
	   	</div>
	</div>
	
	<!------------------------------------- UPDATE Modal ------------------------------------->
	
	<div class="updateModal">
		<div class="modal-content">
			<div class="modalRegister">
	   			<table id="registerTable">
	   				<tr>
	   					<td><label>일정 유형</label>
	   					<td>
	   						<input type="radio" id="news" name="updateCode" value="0" checked>
	   						<label for="code">기사</label> &nbsp;
	   						<input type="radio" id="release" name="updateCode" value="1" >
	   						<label for="release">발매</label> &nbsp;
	   						<input type="radio" id="reservation" name="updateCode" value="2" >
	   						<label for="reservation">예약</label> &nbsp;
	   					</td>
	   				</tr>
		   			<tr>
		   				<td><label for="updateTitle">일정 내용</label></td>
		   				<td><input type="text" name="updateTitle" id="updateTitle"></td>
		   			</tr>
		   			<tr>
		   				<td><label for="updateUrl">url 주소</label></td>
		   				<td><input type="url" name="updateUrl" id="url"></td>
		   			</tr>
		   			<tr>
		   				<td><label name="updateDate">날짜 지정</label></td>
		   				<td><input type="date" name="updateDate" id="updateDate"></td>
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
</body>
</html>