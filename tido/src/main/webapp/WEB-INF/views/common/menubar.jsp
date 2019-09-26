<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
        <title></title>
         <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link href="https://fonts.googleapis.com/css?family=Audiowide|Open+Sans"rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="${contextPath }/resources/css/common/menubar-style.css">
    </head>

    <body>
    	
    	<c:url var="goMain" value="main.kh"></c:url>
    	<c:url var="goProject" value="compPjtView.kh"></c:url>
    	
        <nav class="header">
            <ul class="nav_ul">
                <li><a href="${goMain }"><img src="${contextPath }/resources/images/main.png" width="135px" height="90px"></a></li>
                <li><a href="${goProject }">작곡하기</a></li> 
                <li><a href="#">공유게시판</a></li>
                <li><a href="#">공지사항</a></li>
                <li><a href="#">문의하기</a></li>
                <li>
                	<c:choose>
	                	<c:when test="${loginUser==null }">
	                   		 <img id="user_before" width="20%" src="${contextPath }/resources/images/user_before.png">
	                	</c:when>
	                	<c:otherwise>
	           				<img id="user_after" width="20%" src="${contextPath }/resources/images/user_after.png"> --%>
	                	</c:otherwise>
                	</c:choose>
                	
                </li>
            </ul>
        </nav>
    </body>
</html>
