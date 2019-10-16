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
	.shareModal{
		position: fixed;
		width:100%;
		height: 100%;
		background: rgba(0,0,0,0.7);
		top:0;
		left:0;
		z-index:3;
		display: none;
	}
	.shareModal>div{
		margin:auto;
		margin-top:150px;
		background:rgba(255,255,255,0.9);
		width:400px;
		height: 400px;
		border-radius: 5px;
	}
	.shareModal>div>h2{
		padding:10px;
		
	}
	.shareModal>div>div{
		width:100%;
		text-align: center;
	}
	.insertTitle{
		height: 10%;
	}
	.refProject{
		height: 20%;
		text-align: left;
		
	}
	.refProject>input{
		width:90%;
	}
	
	.insertContent{
		height: 45%;
	}
	.insertTitle>input{
		width:90%;
		border:1px solid grey;
		border-radius: 3px;
	}
	.insertContent>textarea{
		width:90%;
		height: 90%;
		border:1px solid grey;
		resize: none;
		border-radius: 3px;
	}
	.button{
		height: 15%;
		text-align: center;
	}

</style>
</head>
	<body>
	<jsp:include page="../common/menubar.jsp"/>
	<div class="shareModal">
		<div>
			<h2 align="center">공유하기</h2>
			<div class="insertTitle">
				<input placeholder="제목" id="insertTitle" >
			</div>
			<div class="refProject">
				<label>공유할 프로젝트</label><br>
				<input id="refProject" readonly="readonly" value="">
			</div>
			<div  class="insertContent">
				<textarea placeholder="내용" id="insertContent"></textarea>
			</div>
			<div class="button">
				<button id="shareOk">공유</button>
				<button id="shareCancel">취소</button>
			</div>
		</div>
	</div>
	
	
	
		
		
		<div id="createFolderPop" class="popup">
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
		<div id="updateNamePop" class="popup">
			<div>
				<h6 >이름 변경</h6>
			</div>
			<div>
				<input id="projectName" value>
			</div>
			<div>
				<button id="updateNameOk">확인</button>
				<button id="updateNameCancel">취소</button>
			</div>
		</div>
		<div id="deleteConfirmPop" class="popup">
			<div>
				<h6 >정말 삭제하시겠습니까?</h6>
			</div>
			<div>
				<button id="deleteOk">확인</button>
				<button id="deleteCancel">취소</button>
			</div>
		</div>			
				
		<ul class="contextmenu">
		  <li id="shareProjectMenu"><span>공유하기</span></li>
		  <li id="updateNameMenu"><span>이름 변경</span></li>
		  <li id="deleteProjectMenu"><span>삭제</span></li>
		</ul>
		
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
			<h6 id="loadingMessage">프로젝트를 불러오는 중입니다<span class="dot"></span></h6>
			<div id="projectArea" class="projectArea">
			</div>
		</section>
		<jsp:include page="../common/footer.jsp"/>
		<script>
			var check=true;
			var $project;
			var projectNo;
			var scrollCount=0;
			if(projectCount<=selectCount){
				 //check=false;
			}
						
			$(function(){
				$("#projectArea").hide();
				getProjectCount();
				selectProjectList(path);
				
				$("#folderAddBtn").on("click",function(){
					$("#createFolderPop").show();
				});
				
				$("#addOk").on("click",function(){
					if($("#newFolderName").val().trim()!=""){
						var folderName = $("#newFolderName").val();
						$.ajax({
							url:"addFolder.kh",
							data:{path:path+"\\"+folderName},
							type:"post",
							success:function(result){
								console.log(result);
							}
						});
						$("#createFolderPop").hide();
					}else{
						$("#newFolderName").css({"border":"2px solid red"});
					}	
				});
				$("#addCancel").on("click",function(){
					$("#createFolderPop").hide();
				});
				
			
				$("#projectArea").mouseover(function(){ 
					$("#projectArea").scroll(function(){
						 var scrollT = $(this).scrollTop();
     					 var scrollH = $(this).height();
        				 var contentH = $('#projectArea').height(); 
        			
       					 if(scrollT + scrollH +1 >= contentH) {
							if(check){
						
							$("#projectArea").children("p").text("loading...");
							setTimeout(function(){
								selectProjectList(path);
								scrollCount++;
							},1500);
								check=false;
							}
						}
					});
			 	});
				
				
				$("#updateNameMenu").on("click",function(){
					$("#updateNamePop").show();
					$("#projectName").val($project.children("div").children().eq(0).text()).select();
				});
				
				$("#updateNameOk").on("click",function(){
					var projectTitle =$("#projectName").val();
					if(projectTitle!=""){
						$.ajax({
							url:"updatePjtName.kh",
							data:{pNo:projectNo,projectTitle:projectTitle},
							type:"get",
							success:function(result){
								console.log(result);
								$("#updateNamePop").hide();
								$project.children("div").children().eq(0).text(projectTitle);
							}
						});
					}
					
					
					
					
				});
				
				
				$("#deleteProjectMenu").on("click",function(){
					$("#deleteConfirmPop").show();
				});
				
				$("#deleteOk").on("click",function(){
					$.ajax({
						url:"deletePjt.kh",
						data:{pNo:projectNo},
						type:"get",
						success:function(result){
							console.log(result);
							$("#deleteConfirmPop").hide();
							$project.remove();
						}
					});
				});
				
				$("#shareProjectMenu").on("click",function(){
					$(".shareModal").show();
					$("#refProject").val($project.children("div").children().eq(0).text());
				});
				
				$("#shareOk").on("click",function(){
					var title=$("#insertTitle").val();
					var content=$("#insertContent").val();
					$.ajax({
						url:"insertSharePjt.kh",
						data:{pBoardTitle:title,pBoardContent:content,refPNo:projectNo},
						type:"get",
						success:function(result){
							$(".shareModal").hide();
							$("#insertTitle").val("");
							$("#insertContent").val("");
						}
					});
				});
				$("#shareCancel").on("click",function(){
					$(".shareModal").hide();
					$("#insertTitle").val("");
					$("#insertContent").val("");
				});
			});
			  
		
			function selectProjectList(){
				var loading=setInterval(function(){
					$("#loadingMessage").children(".dot").append(".");
					if($("#loadingMessage").children(".dot").text().length>=4){
						$("#loadingMessage").children(".dot").text(".");
					}
				},300);
				$.ajax({
					url:"selectPjt.kh",
					type:"post",
					data:{projectPath:path,begin:begin,lim:lim},
					dataType:"json",
					success:function(projectList){
						$("#projectArea").show();
						$("#projectArea").children("p").remove();
						clearInterval(loading);
						var replacedPath=path.replace("${loginUser.name}","내 라이브러리");
						replacedPath=replacedPath.replace("\\"," > ");
						$(".folderPath").text(replacedPath) ;
						if(projectList.length!=0){
							$("#loadingMessage").hide();
							for(var i in projectList){
								var $div = $("<div class='project'>");
								var $img=$("<img>");
								$img.attr({"src":projectList[i].projectImagePath});
								var $path = $("<input type='hidden' value="+projectList[i].pNo+">");
								var $info= $("<div>");
							 	$info.append("<p>"+projectList[i].projectTitle+"</p>");
							 	$info.append("<p>"+projectList[i].pCreateDate+"</p>");
							 	$div.append($img);
							 	$div.append($info);
							 	$div.append($path);
								addEvent($div);
								$("#projectArea").append($div);
								
							}
							$("#projectArea").append("<p align='center' style='height:30px'></p>");
							begin=begin+selectCount;
							lim=lim+selectCount;
							if(lim>=projectCount){
								lim=projectCount;
							}
							if(projectList.length<selectCount){
								$("#projectArea").children("p").remove();
								if(	scrollCount>=1){
								$("#projectArea").append("<p align='center'>loading...</p>")
									setTimeout(function(){
										$("#projectArea").children("p").text("더 이상 조회결과가 없습니다.");
									},1500);
								}
								check=false;
							}else{
								check=true;
							}
						
						}else{
							$("#loadingMessage").hide();
							if(	scrollCount>=1){
								$("#projectArea").append("<p align='center'>loading...</p>")
							}
							setTimeout(function(){
								$("#projectArea").children("p").text("조회결과가 없습니다.");
							},1500); 
							check=false;
						}
							
					}
				});
			}
			
			
			
			function addEvent(project){
				project.on("click",function(){
					var pNo=Number($(this).children("input:hidden").val());
					location.href="openPjt.kh?pNo="+pNo+"&id=${loginUser.id}&pbNo=0";
				});
				
				project.contextmenu(function(e){
					$project=$(this);
					projectNo=$(this).children("input[type='hidden']").val();
				    var winWidth = $(document).width();
				    var winHeight = $(document).height();
				    var posX = e.pageX;
				    var posY = e.pageY;
				    var menuWidth = $(".contextmenu").width();
				    var menuHeight = $(".contextmenu").height();
				    var secMargin = 10;
				    if(posX + menuWidth + secMargin >= winWidth
				    && posY + menuHeight + secMargin >= winHeight){
				      posLeft = posX - menuWidth - secMargin + "px";
				      posTop = posY - menuHeight - secMargin + "px";
				    }
				    else if(posX + menuWidth + secMargin >= winWidth){
				      posLeft = posX - menuWidth - secMargin + "px";
				      posTop = posY + secMargin + "px";
				    }
				    else if(posY + menuHeight + secMargin >= winHeight){
				      posLeft = posX + secMargin + "px";
				      posTop = posY - menuHeight - secMargin + "px";
				    }
				    else {
				      posLeft = posX + secMargin + "px";
				      posTop = posY + secMargin + "px";
				    };
				    $(".contextmenu").css({
				      "left": posLeft,
				      "top": posTop
				    }).show();
				    return false;
				  });
				
				  $(document).click(function(){
				    $(".contextmenu").hide();
				  });
				
			}
			
			function getProjectCount(){
				$.ajax({
					url:"getPjtCount.kh",
					data:{path:path},
					type:"post",
					success:function(count){
						projectCount=count;
					}
				});
			}
			
			
		</script>
	
</body>
</html>