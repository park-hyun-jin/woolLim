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
.createFolderBtn{
	width:300px;
	height: 120px;
	position:absolute;
	background: rgba(0,0,0,0.6);
	left:0;
	right:0;
	top:300px;
	margin: auto;
	display:none;
	border-radius: 10px;
}
.createFolderBtn div{
	text-align: center;
	color:white;
	padding:5px;
}
.createFolderBtn div input{
	width:90%;
}
</style>
</head>
<body>
		<jsp:include page="../common/menubar.jsp"/>
		
		
		<div id="createFolderBtn" class="createFolderBtn">
			<div>
				<h6 >새 폴더 추가</h6>
			</div>
			<div>
				<input id="newFolderName">
			</div>
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
		<section id="projectWrapper">
			<h3  id="folderPath" class="folderPath">내 라이브러리</h3>
			<div id="projectArea" class="projectArea">
			</div>
		</section>
		<jsp:include page="../common/footer.jsp"/>
		<script>
			var check=true;
		
			$(function(){
				getProjectCount();
				selectProjectList(path);
				
				$("#folderAddBtn").on("click",function(){
					$("#createFolderBtn").css("display","block");
				});
				
				$("#addOk").on("click",function(){
					if($("#newFolderName").val().trim()!=""){
						var folderName = $("#newFolderName").val();
						$.ajax({
							url:"addFolder.kh",
							data:{path:path+"\\"+folderName},
							type:"post",
							success:function(result){
								$("#createFolderBtn").css("display","none");
							}
						});
						
					}else{
						$("#newFolderName").css({"border":"2px solid red"});
					}	
				});
				
				
			
				$("#projectArea").mouseover(function(){ 
					$("#projectArea").scroll(function(){
						 var scrollT = $(this).scrollTop();
     					 var scrollH = $(this).height();
        				 var contentH = $('#projectArea').height(); 
        			
       					 if(scrollT + scrollH +1 >= contentH) {
							if(check){
							console.log("Asd");
							setTimeout(function(){
								selectProjectList(path);
							},1500);
								check=false;
							}
						}
					});
			 	});
				
				
			});
			  
		
			function selectProjectList(){
				
				
				console.log("begin:"+begin);
				console.log("lim:"+lim);
				$.ajax({
					url:"selectPjt.kh",
					type:"post",
					data:{projectPath:path,begin:begin,lim:lim},
					dataType:"json",
					success:function(projectList){
						var replacedPath=path.replace("${loginUser.name}","내 라이브러리");
						replacedPath=replacedPath.replace("\\"," > ");
						$(".folderPath").text(replacedPath) ;
				
						if(projectList.length!=0){
							for(var i in projectList){
								var $div = $("<div class='project'>");
								var $img=$("<img>").attr({"src":""});
								var $path = $("<input type='hidden' value="+projectList[i].pNo+">");
								var $info= $("<div>");
							 	$info.append(projectList[i].projectTitle+"<br>");
							 	$info.append(projectList[i].pCreateDate);
							 	$div.append($img);
							 	$div.append($info);
							 	$div.append($path);
								openProject($div);
								$("#projectArea").append($div);
							
							}
							begin=begin+16;
							lim=lim+16;
							if(lim>=projectCount){
								lim=projectCount;
								
							} 
						}else{
							$("#projectArea").text("프로젝트가 없습니다");
						}

						if(begin<=projectCount){
							check=true;
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
			
			function getProjectCount(){
				$.ajax({
					url:"getPjtCount.kh",
					data:{path:path},
					type:"post",
					success:function(count){
						console.log("ASdasdasd");
						projectCount=count;
					}
				});
			}
			
			
		</script>
	
</body>
</html>