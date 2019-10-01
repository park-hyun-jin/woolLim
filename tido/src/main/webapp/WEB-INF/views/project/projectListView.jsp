<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="styleSheet" href="${contextPath }/resources/css/project" > --%>
<style>
	
	@import url('https://fonts.googleapis.com/css?family=Archivo+Black|Kanit:400,700i&display=swap');
	*{
		box-sizing: border-box;
	}
	section{
		width:80%;
		height:800px;
		background: rgba(200,200,200,0.8);
		float:left;
	}
	aside{
		height:800px;
		width:20%;
		background: rgba(0,0,0,0.7);
		padding:0 10px 0 10px;
		float:left;
	}
	aside>div.asidehead{
		width:100%;
		height: 80px;
		text-align: center;
		color:white;
		border-bottom: 3px solid grey;
		font-family:"Archivo Black",sans-serif;
	}
	.folderPath{
		font-weight: bolder;
	}
	
</style>
</head>
<body>
		<jsp:include page="../common/menubar.jsp"/>
		<aside oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
		<div class="asidehead">
			<h3>내 프로젝트</h3>
		</div>
		<input class="projectSearch">
		<span class="imgbtns" id="folderAddBtn">
		<img src="${contextPath }/resources/images/plus.png">
		</span>
		<jsp:include page="folderSelectView.jsp"/>
		</aside>
		<section>
			<h3 class="folderPath">내 라이브러리</h3>
			<hr>
		</section>
		<jsp:include page="../common/footer.jsp"/>
		
	
</body>
</html>