<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
    	<script type="text/javascript" src="${contextPath }/resources/js/admin/dashboard.js"></script>
	      <link rel="icon" type="image/png"  href="resources/images/svnicon.png"/> <!-- favicon fix -->
	<!-- jQuery, bootstrap CDN -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/jquery-migrate-1.2.1.js"></script> <!-- msie 문제 해결 -->
	<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<!-- Zebra-Dialog CDN -->
	<script src="resources/js/dialog/zebra_dialog.src.js"></script>
	<link rel="stylesheet" href="resources/css/dialog/zebra_dialog.css" type="text/css"/>
	<!-- SocketJS CDN -->
	<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<meta charset="UTF-8">
<title>관리자페이지 Dashboard</title>
</head>
<body>

	<jsp:include page="adminMenubar.jsp" />
	
	

	<div class="container-fluid">
      <div class="row">
      
      <jsp:include page="adminAside.jsp" />
      

      <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h1 class="h2">DashBoard</h1>
            <div class="btn-toolbar mb-2 mb-md-0">
              <div class="btn-group mr-2">
                <button type="button" class="btn btn-sm btn-outline-secondary">Share</button>
                <button type="button" class="btn btn-sm btn-outline-secondary">Export</button>
              </div>
              <button type="button" class="btn btn-sm btn-outline-secondary dropdown-toggle">
                <span data-feather="calendar"></span>
                This week
              </button>
            </div>
          </div>
    	<canvas class="my-4 w-100" id="myChart" width="900" height="380"></canvas>
	      
	
          <h2>일정 관리</h2>
          <div class="table-responsive">  
                <jsp:include page="/WEB-INF/views/calendar/calendarAdmin.jsp"/>
          </div>
        </main>
      </div>
    </div>	
    
	<script>
		$(document).ready(function(){
			$(".home").addClass("active");
		});
		
		
	</script>

</body>
</html>