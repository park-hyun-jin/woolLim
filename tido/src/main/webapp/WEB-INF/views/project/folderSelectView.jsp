<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style>
div.asidehead>h3{
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
	.folderimg{
		-webkit-filter: invert(100%);
	   	filter: invert(100%);
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
</style>


<ul class="folders depth1">
	<li>
		<p>
				<img class="arrowimg"
				src="${contextPath }/resources/images/right-arrow.png" width=8px
				height="8px"> 
				<img class="folderimg"
				src="${contextPath }/resources/images/closed_folder.png" width=20px
				height="20px" style="margin-left: 10px"> 
				<span class="depth1">내 라이브러리</span> 
				<input type="hidden" value=0>
		</p>
	</li>
</ul>

	<script>
	var path;
			$(function(){
				$(".depth1 li p").css("background","rgba(255,255,255,0.2)");
				path="${loginUser.name}";
				var $folder,$p,$ul,$li,$arrowimg,$folderimg,$span,depth,folderName;
				var lv=1;
				var pathList=new Array();
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
					$(this).parent().css("background","rgba(255,255,255,0.2)");
				});
				function clickFolder(folder){
					if(folder.siblings("input:hidden").val()==0){
						var prevlv=lv;
						lv = folder.parent().children("span").attr("class");
						lv=Number(lv.substring(5));
						
						folder.siblings("input:hidden").val(1);
						folder.parent().children(".arrowimg").attr("src","${contextPath }/resources/images/down-arrow.png");
					
						if(pathList.length!=0){
							var folderList = path.split("\\");
							if(prevlv>lv){
								folderList.slice(prevlv-1,folderList-1);							
							}
							folderList[lv-1] = folder.parent().children("span").text();
							
							console.log(folderList[lv-1]);
							path="${loginUser.name}";
							for(var i =1; i<lv; i++){
								path+="\\"+folderList[i];
							}
						}else{
							path="${loginUser.name}";
							if(lv>1){
								path+="\\"+folder.parent().children("span").text();
							}
						}
						console.log(path);
						$.ajax({
							url:"getFolder.kh",
							type:"post",
							data:{path,path},
							dataType:"json",
							success:function(list){
								if(list.length!=0){
									pathList=list;
									$ul=$("<ul class='folders'>");
									for(var i in list){
										folderName=list[i].split("${loginUser.name}\\")[1];
										$li=$("<li>");
										$arrowimg=$("<img>").css("margin-left",((lv)*20)+"px");
										$folderimg=$("<img>");
										$span = $("<span class='depth"+(lv+1)+"'>");
										$p=$("<p>");
										$p.append($arrowimg);
										$p.append($folderimg);
										$span.text(folderName.split("\\")[folderName.split("\\").length-1]);
										$p.append($span);
										$p.append("<input type='hidden' value=0>")
										$li.append($p);
										$ul.append($li);
										addAttrFolder($ul,$li,$arrowimg,$folderimg,$span,$p);
									}
									folder.parent().parent().append($ul);
									
								}else{
									
								}
								var replacedPath=path.replace("\\"," > ");
								replacedPath=replacedPath.replace("${loginUser.name}","내 라이브러리");
								$(".folderPath").text(replacedPath);
								selectProjectList(path);
							}
						});
					
					}else{
						folder.siblings("input:hidden").val(0);
						folder.parent().children(".arrowimg").attr("src","${contextPath }/resources/images/right-arrow.png");
						folder.parent().parent().children("ul").remove();
					}
				
				}
				
				
				
				function addAttrFolder(ul,li,arrowimg,folderimg,span,p){
					arrowimg.attr({"class":"arrowimg",
								   "src":"${contextPath }/resources/images/right-arrow.png",
								   "width":"8px","height":"8px"})
						    .on("click",function(){
								$folder = $(this);
								$(".folders li p").css("background","");
								$folder.parent().css("background","rgba(255,255,255,0.2)");
								clickFolder($folder);
							});
					folderimg.attr({"class":"img","src":"${contextPath }/resources/images/closed_folder.png",
								   "width":"20px","height":"20px"})
						     .css({"margin-left":"10px","-webkit-filter":"invert(100%)","filter":"invert(100%)"})
							 .on("dblclick",function(){
								 $folder = $(this);
								 $(".folders li p").css("background","");
								 $folder.parent().css("background","rgba(255,255,255,0.2)");
								 clickFolder($folder);
							 });
					span.on("dblclick",function(){
						 $folder = $(this).siblings(".arrowimg");
						 $(".folders li p").css("background","");
						 $folder.parent().css("background","rgba(255,255,255,0.2)");
						 clickFolder($folder);
					 });
					span.on("click",function(){
						 $folder = $(this);
						 $(".folders li p").css("background","");
						 $folder.parent().css("background","rgba(255,255,255,0.2)");
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