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
	
	aside>div.asidehead>h3{
		font-family:"Archivo Black";
		padding-top:25px;
	}
	.projectSearch{
		width:85%;
	}
	.imgbtns{
		display:inline-block;
		width:6%;
		height:22px;
		margin-right:8px;
	}
	#folderAddBtn img{
		width:100%;
		height: 100%;
		margin-left:10px;
		-webkit-filter: invert(100%);
   		filter: invert(100%);
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
	.folderTitle{
		font-weight: bolder;
	}
	
</style>
</head>
<body>
		<jsp:include page="../common/menubar.jsp"/>
		<aside oncontextmenu="return false" onselectstart="return false" ondragstart="return false">
				<div class="asidehead" >
				<h3>내 프로젝트</h3>
				</div>
					<input class="projectSearch">
					<span class="imgbtns"  id="folderAddBtn"><img src="${contextPath }/resources/images/plus.png"></span>
				<ul class="folders depth1">
					<li>
						<p>
							<img class="arrowimg" src="${contextPath }/resources/images/right-arrow.png" width=8px height="8px">
							<img class="folderimg" src="${contextPath }/resources/images/closed_folder.png" width=25px height="25px" style="margin-left:10px">
							<span>내 라이브러리</span>
							<input type="hidden" value=0>
						</p>
					</li>
				</ul>
		</aside>
		<section>
			<h3 class="folderTitle">내 라이브러리</h3>
			<hr>
		</section>
	
		
		<jsp:include page="../common/footer.jsp"/>
		
		<script>
		
			$(function(){
				var folderStatus =0;
				var $folder;
				var $p;
				var $ul;
				var $li;
				var $arrowimg;
				var $folderimg;
				var $span;
				var path="${loginUser}";
				var depth;
				$(".folders .folderimg,.folders span").on("dblclick",function(){
					$folder = $(this);
					clickFolder($folder);
				});
				
				$(".arrowimg").on("click",function(){
					$folder = $(this);
					clickFolder($folder);
				});
				
				$(".folders .folderimg,.folders span,.arrowimg").on("click",function(){
					$(".folders li p").css("background","");
					$(this).parent().css("background","rgba(0,0,0,0.2)");
				});
				
				
				
				
				
				function clickFolder(folder){
					if(folder.siblings("input:hidden").val()==0){
						folder.siblings("input:hidden").val(1);
						folder.parent().children(".arrowimg").attr("src","${contextPath }/resources/images/down-arrow.png");
						
						depth =folder.parent().parent().parent().attr("class").split(" ")[1];
						depth=Number(depth.substring(depth.length-1,depth.length));
						if(depth>1){
							var folderNames;
							for(var i=2; i<=depth; i++){
								folderNames =folder.parents(".depth"+i).children().children().children("span");
								for(var j=0; j<folderNames.length; j++){
									if(folderNames.eq(j).text()==folder.siblings("span").text()){
										path=path.split(folder.siblings("span").text())[0];
										path+="\\"+folder.siblings("span").text();
									}
								}
							}
							console.log("path:"+path);
							$(".folderTitle").text(path.replace("\\",">"));
						}
						$.ajax({
							url:"getFolder.kh",
							type:"post",
							data:{path,path},
							dataType:"json",
							success:function(list){
								if(list.length!=0){
									var lv = folder.parent().parent().parent().attr("class").split(" ")[1];
									lv = Number(lv.substring(lv.length-1,lv.length))+1;
									$ul=$("<ul class='folders depth"+lv+"'>");
									for(var i in list){
										var userFolder= list[i].split("${loginUser}")[1].split('\\');
										var folderName =userFolder[userFolder.length-1];
										if(folderName.split(".")[1]==undefined){
											$li=$("<li>");
											$arrowimg=$("<img>").css("margin-left",((lv-1)*20)+"px");
											$folderimg=$("<img>");
											$span = $("<span>");
											$p=$("<p>");
											$p.append($arrowimg);
											$p.append($folderimg);
											$span.text(folderName);
											$p.append($span);
											$p.append("<input type='hidden' value=0>")
											$li.append($p);
											$ul.append($li);
											addAttrFolder($ul,$li,$arrowimg,$folderimg,$span,$p);
										}
									}
									folder.parent().parent().append($ul);
								}
							}
						});
					
					}else{
						folder.siblings("input:hidden").val(0);
						folder.parent().children(".arrowimg").attr("src","${contextPath }/resources/images/right-arrow.png");
						folder.parent().parent().children("ul").remove();
					}
				}
				
				function addAttrFolder(ul,li,arrowimg,folderimg,span,p){
					console.log(span.html);
					arrowimg.attr({"class":"arrowimg",
								   "src":"${contextPath }/resources/images/right-arrow.png",
								   "width":"8px","height":"8px"})
						    .on("click",function(){
								$folder = $(this);
								$(".folders li p").css("background","");
								$folder.parent().css("background","rgba(0,0,0,0.2)");
								clickFolder($folder);
							});
					folderimg.attr({"class":"img","src":"${contextPath }/resources/images/closed_folder.png",
								   "width":"25px","height":"25px"})
						     .css({"margin-left":"10px"})
							 .on("dblclick",function(){
								 $folder = $(this);
								 $(".folders li p").css("background","");
								 $folder.parent().css("background","rgba(0,0,0,0.2)");
								 clickFolder($folder);
							 });
					span.on("dblclick",function(){
						 $folder = $(this).siblings(".arrowimg");
						 $(".folders li p").css("background","");
						 $folder.parent().css("background","rgba(0,0,0,0.2)");
						 clickFolder($folder);
					 });
					span.on("click",function(){
						 $folder = $(this);
						 $(".folders li p").css("background","");
						 $folder.parent().css("background","rgba(0,0,0,0.2)");
					 });
					
					p.on("mouseenter",function(){
						p.css("cursor","pointer");
					}).on("mouseleave",function(){
						p.css("cursor","text");
					});
					
					span.css({"margin-left":"10px","color":"white"});
					ul.css({"display":"block","cursor":"text"});
				}
				
				
			});
		</script>
</body>
</html>