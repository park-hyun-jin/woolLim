<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	  
	<nav class="col-md-2 d-none d-md-block bg-light sidebar">
          <div class="sidebar-sticky">
            <ul class="nav flex-column">
              <li class="nav-item">
                <a class="nav-link home" href="admin.kh">
                  <span data-feather="home"></span>
                  Dashboard <span class="sr-only">(current)</span>
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link users" href="adminUserManage.kh">
                  <span data-feather="users"></span>
                  User Management
                </a>
              </li>
              <li class="nav-item">

                <a class="nav-link" href="cboardListAll.kh">
                  <span data-feather="clipboard"></span>
                  Board Management
                </a>
              </li>             
              <li class="nav-item">
              </li>
              <li class="nav-item">
                <a class="nav-link" href="nboardListAll.kh">
                  <span data-feather="layers"></span>
                  Notice Management
                </a>
              </li>
            </ul>
    
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link" href="iboardListAll.kh">
                  <span data-feather="file-text"></span>
                  Q&A Management
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Last quarter
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Social engagement
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="#">
                  <span data-feather="file-text"></span>
                  Year-end sale
                </a>
              </li>
               <jsp:include page="/WEB-INF/views/web/chat-ws.jsp"/>
             
            </ul>
          </div>
        </nav>

</body>
</html>