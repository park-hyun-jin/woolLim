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
	
	aside>div.asidehead>h3{
		font-family:"Archivo Black";
		padding-top:25px;
	}
	.projectSearch{
		width:85%;
	}
	.imgbtns{
		display:inline-block;
		width:24px;
		height:24px;
		margin-right:8px;
	}
	#folderAddBtn img{
		width:100%;
		height: 100%;
		margin-left:10px;
	}
	.folders,.folders ul{
		list-style: none;
		padding:10px 0 0 0 ;
		color:white;
	}
	.folders:hover,.imgbtns:hover{
	cursor:pointer;
	}
	.folders span{
		margin-left : 10px;
	}
	.folders p{
	   margin: 0;
	}
	.folders ul{
		padding:3px 0 0 0;
		color:black;
		display:none;
	}
	
</style>
</head>
<body>
		<jsp:include page="../common/menubar.jsp"/>
		<section>
			<aside oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
				<div class="asidehead" >
				<h3>내 프로젝트</h3>
				</div>
					<input class="projectSearch">
					<span class="imgbtns"  id="folderAddBtn"><img src="${contextPath }/resources/images/plus.png"></span>
				<ul class="folders">
					<li>
						<p>
							<img id="arrowimg" src="${contextPath }/resources/images/right-arrow.png" width=10px height="10px">
							<img id="folderimg" src="${contextPath }/resources/images/closed_folder.png" width=30px height="30px" style="margin-left:10px">
							<span>내 라이브러리</span>
							<input type="hidden" value=0>
						</p>
						<ul class="folders sub">
						</ul>
					</li>
				</ul>
			</aside>
			<div>
			
			</div>
		</section>
		<jsp:include page="../common/footer.jsp"/>
		
		<script>
			$(function(){
			var folderStatus =0;
			var $folder;
				$(".folders #folderimg,.folders span").on("dblclick",function(){
					$folder = $(this);
					clickFolder($folder);
				});
				
				$("#arrowimg").on("click",function(){
					$folder = $(this);
					clickFolder($folder);
				});
				
				$(".folders #folderimg,.folders span,#arrowimg").on("click",function(){
					$(this).parent().css("background","rgba(0,0,0,0.2)")
				});
				
				
				function clickFolder(folder){
					if(folderStatus==0){
						folderStatus++;
						$("#arrowimg").attr("src","${contextPath }/resources/images/down-arrow.png");
						$(".folders ul").css({"display":"block","cursor":"text"});
					}else{
						folderStatus--;
						$("#arrowimg").attr("src","${contextPath }/resources/images/right-arrow.png");
						$(".folders ul").css("display","none");
					}
					var path;
					if(folder.siblings("input:hidden").val()==0){
						path="${loginUser}";
					}
					console.log(path);
					$.ajax({
						url:"getFolder.kh",
						type:"post",
						data:{path,path},
						dataType:"json",
						success:function(list){
							if(list.length!=0){
								for(var i in list){
									var folderName =list[i].split("${loginUser}")[1].replace('\\','');
									console.log(folderName.split(".")[1]);
									if(folderName.split(".")[1]==undefined){
										var $ul=folder.parent().siblings("ul");
										var $li=$("<li>");
										var $arrowimg=$("<img width=10px height=10px>")
										    .attr({"id":"arrowimg","src":"${contextPath }/resources/images/right-arrow.png"});
										var $folderimg=$("<img width=30px height=30px>")
										    .attr({"id":"folderimg","src":"${contextPath }/resources/images/closed_folder.png"});	
										var $span = $("<span>");
										$li.append("&nbsp; &nbsp; &nbsp; &nbsp;");
										$li.append($arrowimg);
										$li.append($folderimg);
										$span.text(folderName);
										$li.append($span);
										$ul.append($li);
									}
								}
							}
						}
					});
					
				}
			});
		</script>
</body>
</html>