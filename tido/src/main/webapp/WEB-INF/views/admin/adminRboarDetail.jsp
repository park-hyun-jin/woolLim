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
  background-color:#007bff ;
  color: white;
}

#checkBox{
	text-align:right;
	
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
	left: 30px;

}

form{
            
            width: 50%;
            padding: 0 100px;
            margin: auto;
           background-color: rgb(255,255,255,0.3);
        }
		#inputAddress2{
			height: 400px;
		}
		#button{
			float : right;
		}	
		
		
 #inputCity{
  background-color: #343a40; 
  width: 100%;
        }

       strong{
       color: black;
       }
       h5{
       background-color: rgb(255,255,255,0.3);
       }
        </style>



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
            <h1 class="h2">신고사항 관리(상세페이지)</h1>
            
          </div>
	
	<div class="my-4 w-100" id="myChart" width="900" height="380" >
	
	<c:forEach var="r" items="${ list }">
            
	
	 <c:url var="adminReport" value="adminReport.kh">
				<c:param name="rReportNo" value="${ r.rReportNo }"/> 
	</c:url>
		<a href="${ adminReport }">신고페이지로 이동</a> &nbsp;			
		
		 <div class="form-row">
            
            
              <div class="form-group col-md-6">
                <label for="inputEmail4">신고번호</label>
                <div type="text" class="form-control" id="inputEmail4" >${ r.rReportNo}</div>
              </div>
              <div class="form-group col-md-6">
                <label for="inputPassword4">글번호</label>
                <div type="text" class="form-control" id="inputPassword4" >${ r.rContentsNo}</div>
              </div>
            </div>
            
            <div class="form-group">
              <label for="inputAddress">신고물유형</label>
              <div type="text" class="form-control" id="inputAddress" >${ r.rReportType}</div>
            </div>
            
            <div class="form-group" >
              <label for="inputAddress2">신고한 내용</label>
            	
              <div type="text" class="form-control" id="inputAddress2">${ r.rReportContent}</div>
            </div>
            
             <div class="form-group" >
              <label for="inputAddress2">신고한 회원</label>
            	
              <div type="text" class="form-control" id="inputAddress3">${ r.rMemberId}</div>
            </div>
            
            <div class="form-group" >
              <label for="inputAddress2">신고일</label>
            	
              <div type="text" class="form-control" id="inputAddress4">${ r.rReportDate}</div>
            </div>
		
		</c:forEach>
		
	</div>
	
	<div id="return">
	<p align="center">
		<c:url var="home" value="admin.kh"/>
		<a href="${ home }">시작 페이지로 이동</a> &nbsp;
		<c:url var="rlist" value="adminRboardListAll.kh"/>
		<a href="${ rlist }">목록으로 가기</a>
	</p>
	<br><br><br><br><br><br><br><br><br><br><br><br>
	
	</div>
	
	<script type="text/javascript" src="${contextPath }/resources/js/admin/dashboard.js"></script>
	<script>
	$(document).ready(function(){
		$(".board").addClass("active");
	});
	
	</script>
	
	
	
</body>
</html>