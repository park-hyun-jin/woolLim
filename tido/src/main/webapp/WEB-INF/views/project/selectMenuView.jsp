<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		box-sizing: border-box;
	}
	section{
		
		width:1500px;
		height:600px;
		margin:100px auto;
	}
	section>div{
		width:480px;
		height: 100%;
		float: left;
		margin:10px;
		background:rgba(255,255,255,0.8);
	}
	section>div:hover{
		-webkit-filter: invert(100%);
   		filter: invert(100%);
   		cursor: pointer;
	}
	section>div>div{
		text-align: center;
		width:100%;
		height:128px;
		margin-top:200px;
	}
	
</style>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	<section>
		<div class="area1" onclick="location.href='newProject.kh'">
			<div>
				<img src="${contextPath }/resources/images/new-project.png">
				<div >작곡하러가기</div>
			</div>
		</div>
		<div class="area2"></div>
		<div class="area3"></div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>