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
	.projectArea{
		width:100%;
		height: 100%;
	}
	.projectArea>div{
		margin:10px;
		width:300px;
		height:350px;
		background:rgba(110,110,110,0.5);
		float: left;
		border-radius: 10px;
	}
	.projectArea>div>img{
		margin:10px;
		width:275px;
		height:250px;
	}
	.projectArea>div>div{
		margin:10px;
		width:275px;
		height:100px;
		
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
			<h3  id="folderPath" class="folderPath">내 라이브러리</h3>
			<hr>
			<div id="projectArea" class="projectArea">
			</div>
		</section>
		<jsp:include page="../common/footer.jsp"/>
		
		<script>
			
			$(function(){
				selectProjectList(path);
			});
			function selectProjectList(path){
				console.log("asd");
				$.ajax({
						url:"selectPjt.kh",
						type:"post",
						data:{projectPath:path},
						dataType:"json",
						success:function(projectList){
							$("#projectArea").text("");
							if(projectList.length!=0){
								for(var i in projectList){
									var $div = $("<div class='project'>");
									var $img=$("<img>").attr({"src":""});
									var $info= $("<div>");
								 	$info.append(projectList[i].projectTitle+" ");
								 	$info.append(projectList[i].pCreateDate+"<br>");
								 	$div.append($img);
								 	$div.append($info);
									$("#projectArea").append($div);
								}
							}else{
								$("#projectArea").text("프로젝트가 없습니다");
							}
						}
						
				});
			}
		
		</script>
	
</body>
</html>