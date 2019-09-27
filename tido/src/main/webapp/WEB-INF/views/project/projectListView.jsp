<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link rel="styleSheet" href="${contextPath }/resources/css/project" > --%>
<style>

	@import url('https://fonts.googleapis.com/css?family=Archivo+Black|Kanit:400,700i&display=swap');
	section{
		margin:auto;
		width:100%;
		height: 800px;
		background: rgba(200,200,200,0.8);
	}
	aside{
		height: 100%;
		width:300px;
		background: rgba(0,0,0,0.5);
		padding:0 10px 0 10px;
	}
	aside>div.asidehead{
		width:100%;
		height: 80px;
		text-align: center;
		color:white;
		border-bottom: 3px solid grey;
		font-family:"Archivo Black",sans-serif;
	}
	
	aside>div.head>h3{
		font-family:"Archivo Black";
		padding: 20px;
	}
	.projectSearch{
		width:80%;
	}
	#projectSearchBtn{
		background:none;
		border:none;
		width:32px;
		height:32px;
	}
	#projectSearchBtn img{
		width:100%;
		height: 72%;
	}
	.folders span{
		margin-left : 15px;
		color:white;
	}
</style>
</head>
<body>
		<jsp:include page="../common/menubar.jsp"/>
		<section>
			<aside>
				<div class="asidehead">
				<h3>내 프로젝트</h3>
				</div>
				<p><input class="projectSearch"><button id="projectSearchBtn"><img src="${contextPath }/resources/images/search.png"></button></p>
				<p class="folders"><img src="${contextPath }/resources/images/closed_folder.png"><span>내 라이브러리</span></p>
			</aside>
			<div>
			
			</div>
		</section>
		<jsp:include page="../common/footer.jsp"/>
</body>
</html>