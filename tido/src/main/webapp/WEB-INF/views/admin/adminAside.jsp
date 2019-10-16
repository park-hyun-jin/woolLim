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

                <a class="nav-link board" href="adminCboardListAll.kh">
                  <span data-feather="board"></span>
                  Board Management
                </a>
              </li>             
              <li class="nav-item">
              </li>
              <li class="nav-item">
                <a class="nav-link notice" href="adminNboardListAll.kh">
                  <span data-feather="notice"></span>
                  Notice Management
                </a>
              </li>
            </ul>
    
            </h6>
            <ul class="nav flex-column mb-2">
              <li class="nav-item">
                <a class="nav-link QNA" href="adminIboardListAll.kh">
                  <span data-feather="QNA"></span>
                  Q&A Management
                </a>
              </li>
              <li class="nav-item">
                <a class="nav-link report" href="adminRboardListAll.kh">
                  <span data-feather="report"></span>
                  Report Management
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