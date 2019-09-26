<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
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
		font-weight:bolder;
		font-size:20px;
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
		<div class="area2" onclick="location.href='ProjectListView.kh'">
			<div>
				<img src="${contextPath }/resources/images/open-project.png">
				<div >내 프로젝트 열기</div>
			</div>
		</div>
		<div class="area3"></div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
	
	
	
	<c:if test="${loginUser==null }">	
		<script>
			$(".area2").on("mouseenter",function(){
				$(this).children().children().eq(0).hide();
				$(this).children().children().eq(1).text("로그인 해주세요").css("line-height","128px");
			}).on("mouseleave",function(){
				$(this).children().children().eq(0).show();
				$(this).children().children().eq(1).text("내 프로젝트 열기").css("line-height","");;
			});
		</script>
	</c:if>	
</body>
</html>