<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" href="${contextPath }/resources/css/project/projectListView-style.css" > 
<script>
var pageCheck="projectListView";
</script>
<style>
.createFolderPop{
	width:300px;
	height: 170px;
	position:absolute;
	background: rgba(50,50,50);
	left:0;
	right:0;
	top:300px;
	margin: auto;
	display:none;
	border-radius: 10px;
}
.createFolderPop div h6{
	padding:10px
}

.createFolderPop div{
	text-align: center;
	color:white;
	padding:5px;
}
.createFolderPop div input{
	width:90%;
}
.createFolderPop>#message{
	height:8px;
}

</style>
</head>
<body>
		<jsp:include page="../common/menubar.jsp"/>
		
		
		<div id="createFolderPop" class="createFolderPop">
			<div>
				<h6 >새 폴더 추가</h6>
			</div>
			<div>
				<input id="newFolderName">
			</div>
			<p id="message" align="center"></p>
			<div>
				<button id="addOk">확인</button>
				<button id="addCancel">취소</button>
			</div>
		</div>			
		
		
		<aside oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
			<div class="asidehead">
				<h3>내 프로젝트</h3>
			</div>
			<input id="projectSearch" class="projectSearch">
			<span class="imgbtns" id="folderAddBtn">
			<img src="${contextPath }/resources/images/plus.png">
			</span>
			<jsp:include page="folderSelectView.jsp"/>
		</aside>
		<section>
			<h3  id="folderPath" class="folderPath">내 라이브러리</h3>
			<div id="projectArea" class="projectArea">
			</div>
		</section>
		<jsp:include page="../common/footer.jsp"/>
		<script>
			$(function(){
				selectProjectList(path);
				
				$("#folderAddBtn").on("click",function(){
					$("#createFolderPop").css("display","block");
				});
				
				$("#addOk").on("click",function(){
					if($("#newFolderName").val().trim()!=""){
						var folderName = $("#newFolderName").val();
						$.ajax({
							url:"addFolder.kh",
							data:{path:path+"\\"+folderName},
							type:"post",
							success:function(result){
								if(result=="1"){
									$("#createFolderPop").css("display","none");
									$("#message").text("").css({"border":""});
									$("#newFolderName").val("").css({"border":""});
								}else{
									$("#message").text("같은 이름의 폴더가 존재합니다.").css({"color":"red"});
									setTimeout(function(){
										$("#message").text("").css({"color":""});
									},1500);
								}
							}
						});
						
					}else{
						$("#newFolderName").css({"border":"2px solid red"});
					}	
				});
				
				$("#addCancel").on("click",function(){
					$("#createFolderPop").css("display","none");
					$("#newFolderName").text("").css({"border":""});
				});
				
			});
			function selectProjectList(path){
				$.ajax({
					url:"selectPjt.kh",
					type:"post",
					data:{projectPath:path},
					dataType:"json",
					success:function(projectList){
						var replacedPath=path.replace("${loginUser.name}","내 라이브러리");
						replacedPath=replacedPath.replace("\\"," > ");
						$(".folderPath").text(replacedPath) ;
						$("#projectArea").text("");
						if(projectList.length!=0){
							for(var i in projectList){
								var $div = $("<div class='project'>");
								var $img=$("<img>").attr({"src":""});
								var $path = $("<input type='hidden' value="+projectList[i].pNo+">");
								var $info= $("<div>");
							 	$info.append(projectList[i].projectTitle+" ");
							 	$info.append(projectList[i].pCreateDate+"<br>");
							 	$div.append($img);
							 	$div.append($info);
							 	$div.append($path);
								openProject($div);
								$("#projectArea").append($div);
							}
						}else{
							$("#projectArea").text("프로젝트가 없습니다");
						}
					}
				});
			}
			function openProject(project){
				project.on("click",function(){
					var pNo=Number($(this).children("input:hidden").val());
					location.href="openPjt.kh?pNo="+pNo;
				});
			}
		</script>
	
</body>
</html>