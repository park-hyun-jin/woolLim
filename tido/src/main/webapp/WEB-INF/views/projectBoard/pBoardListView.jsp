<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath }/resources/css/projectBoard/projectBoard-style.css">
<script>
var pnoArray=new Array();
</script>
</head>
<body>
	<jsp:include page="../common/menubar.jsp"/>
	
	<div class="updateModal">
		<div>
			<h4 align="center">수정하기</h4>
			<div class="insertTitle">
				<input placeholder="제목" id="insertTitle" >
			</div>
			<div class="refProject">
				<label>프로젝트명</label><br>
				<input id="refProject" readonly="readonly" value="">
			</div>
			<div  class="insertContent">
				<textarea placeholder="내용" id="insertContent"></textarea>
			</div>
			<div class="button">
				<button id="updateOk">확인</button>
				<button id="updateCancel">취소</button>
			</div>
		</div>
	</div>
	
	<div id="header" >
	<h2>프로젝트 공유 게시판</h2>
	</div>
	<section>
			<c:choose>
				<c:when test ="${!empty pbList }">
					<c:forEach var="pb" items="${ pbList }" varStatus="vs">
						<c:set var="date" value="${fn:split(pb.pBoardCreateDate,'-')}"/> 
						<c:if test="${loginUser.id != pb.writerId }">
							<div class="wrapper">
						</c:if>
						<c:if test="${loginUser.id == pb.writerId }">
							<div class="wrapper" style="background:#585858; opacity: 0.8;" >
						</c:if>
								<div class="pBoard">
								<input class="pbNo" type="hidden" value="${pb.pbNo }">
								<div class="pBoardInfo">
									<p class="writer">
									 	<span class="profileimg">
											<img src="${contextPath }/resources/muploadFiles/${pb.writerId}/${pb.writerImagePath}" width="48" height="48">
									 	</span>
										${pb.memberName}
									<p>
									<p class="date">${date[0]}년 ${date[1]}월 ${date[2]}일</p>
									<h5 class="title">${pb.pBoardTitle}</h5>
									<div class="content">${pb.pBoardContent}</div>
									<div class="count">
										<img src="${contextPath }/resources/images/like.png" width=20px; height="20px">
										<span>${pb.pBoardLikeCount }</span>
										<img class="view" src="${contextPath }/resources/images/listen-music.png" width=20px; height="20px">
										<span>${pb.pBoardViewCount}</span>
										<img class="view" src="${contextPath }/resources/images/reply.png" width=20px; height="20px">
										<span class="replyCount" id="replyCount${vs.index}"></span>
										<c:if test="${loginUser.id == pb.writerId }">
										<img  class="etc" src="${contextPath }/resources/images/etc.png" width=20px; height="20px">
										</c:if>
									</div>
								</div>
				
								<div class="projectImage">
									<input type="hidden" value="${pb.refPNo }">
									<input type="hidden" value="${pb.pbNo }">
									<img src="${pb.projectImagePath}">
									<div>
										<h5>${pb.projectTitle}</h5>
										<p>bpm ${pfList[vs.index].bpm} </p>
										<p>beat ${pfList[vs.index].beat} </p>
										<p>length ${pfList[vs.index].length} </p>
									</div>
								</div>
							</div>
							<div class="reply">
								<div>
									<img src="${contextPath }/resources/muploadFiles/${loginUser.id}/${loginUser.imagePath}" width="48" height="48">
								</div>
								<div class="textarea">
									<textarea class="replyinputarea" rows="2"  ></textarea>
									<input type="hidden" value="${pb.pbNo }">
									<input type="hidden" value="${vs.index }">
								</div>
							</div>
							<div class="replybtnarea">
								<p>
									<span class="replyViewBtn">댓글 보기</span>
									<span style="font-size:7px">▼</span>
									<input type="hidden" value="${pb.pbNo }">
								<p>
							</div>
							<div class="replyView">
								<table></table>
							</div>
						</div>
						<script>
							pnoArray[${vs.index}]=${pb.pbNo};
						</script>
					</c:forEach>
				</c:when>
				<c:otherwise>
					
				</c:otherwise>
			</c:choose>
					
		</section>
		
	     	<jsp:include page="../common/footer.jsp"/>
	     	
	     	
	     <ul class="contextmenu">
		  <li id="updaetpBoardMenu"><span>수정하기</span></li>
		  <li id="deletepBoardMenu"><span>삭제하기</span></li>
		</ul>
			
	    <script>
	    	var pBoard ;
	    	var pBoardNo;
	    	var pbTitle;
	    	var pbContent;
	    	var projectTitle;
	    	$(".projectImage").on("click",function(){
	    		location.href="openPjt.kh?pNo="+$(this).children().eq(0).val()+
	    				"&id=${loginUser.id}&pbNo="+$(this).children().eq(1).val();
	    	});
	    	
	    	$(".etc").on("click",function(e){
				$pBoard=$(this);
				pbTitle=$(this).parent().parent().children(".title").text();
				pbContent=$(this).parent().parent().children(".content").html();	
				projectTitle=$(this).parent().parent().next().children("div").children("h5").text();
				pBoardNo=$(this).parent().parent().parent().children("input").val();
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
	    		
			  $("#updaetpBoardMenu").on("click",function(){
				  $(".updateModal").show();
				  $("#insertTitle").val(pbTitle);
				  $("#refProject").val(projectTitle);
				  pbContent=pbContent.replace(/(<br>)/g,'\r\n');
				  $("#insertContent").text(pbContent);
			  });
			  $("#updateOk").on("click",function(){
				  if($("#insertTitle").val()!=""){
				  	  $.ajax({
				  		  url:"updatepBoard.kh",
				  		  data:{pBoardContent:$("#insertContent").val(),
				  			   pBoardTitle:$("#insertTitle").val(),
				  			   pbNo:pBoardNo},
				  		  type:"post",
				  		  success:function(result){
				  			  $(".updateModal").hide();
				  		  }
				  	  });					  
				  }else{
					  alert("제목을 입력하세요!");
				  }
			  });
	    		
		    $("#deletepBoardMenu").on("click",function(){
		    	if(confirm("정말 삭제하시겠습니까?")){
		    		$.ajax({
		    			url:"deletepBoard.kh",
		    			data:{pbNo:pBoardNo},
		    			type:"get",
		    			success:function(result){
		    				console.log(result);
		    			}
		    		});
		    	}
		    });  
	    	
		    $(".replyViewBtn").on("click",function(){
		    	if($(this).next().text()=="▼"){
			    	$(this).text("댓글 접기");
			    	$(this).next().text("▲");
			    	$(this).parents(".replybtnarea").next("").show();
			    	var $pbNo =$(this).next().next();
			    	selectpbReplyList($pbNo);
		    	}
		    	else if($(this).next().text()=="▲"){
			    	$(this).text("댓글 보기");
			    	$(this).next().text("▼");
			    	$(this).parents(".replybtnarea").next("").hide();
		    	}
		    });
		    $(".replyinputarea").on("focus",function(){
		  		$(".replyinputarea").on("keydown",function(e){
		  			var $pbRContent = $(this);
		  			pBoardNo= $(this).next().val();
			  		if(e.keyCode==13){
				  		e.preventDefault();
				  		if($pbRContent.val()!=""){
					  		$.ajax({
					  			url:"insertPBReply.kh",
					  			data:{pbRContent: $pbRContent.val(),
					  				  pbRWriterId:"${loginUser.id}",
					  				  refPbno:pBoardNo},
					  			type:"post",
					  			success:function(result){
					  				 console.log(result);
					  				 $pbRContent.val("");
					  				if($pbRContent.parent().parent().next().children().children().eq(1).text()=="▼"){
					  				 	$pbRContent.parent().parent().next().children().children().eq(0).click();
					  				}else{
					  					selectpbReplyList($pbRContent.next());	
					  				}
					  				 var $replyCount=$("#replyCount"+$pbRContent.next().next().val());
					  				 getReplyCount(pBoardNo,$replyCount);
					  				
					  			}
					  		});
				  		}
				  	}
		  		});  	
		    });	
		    
			function selectpbReplyList(pbNo){
				var $replyArea=pbNo.parent().parent().siblings(".replyView").children("table");
		    	$.ajax({
		    		url:"selectpbReplyList.kh",
		    		data:{refPbno:pbNo.val()},
		    		type:"post",
		    		success:function(list){
		    			$replyArea.html("");
		    			$.each(list,function(i){
		    				var src ="${contextPath}/resources/muploadFiles/"+list[i].pbRWriterId+"/"+list[i].memberImagePath;
		    				var $img =$("<img>").attr({"src":src,"width":"32px","height":"32px"}).css("margin-right","10px");
			    			var $tr = $("<tr>").css("padding","10px");
			    			var $writer = $("<td width=15%>");
			    			var $content = $("<td width=65%>");
			    			var $createDate = $("<td width=10%>");
			    			var $btn = $("<td width=10%>");
		    				console.log(list[i]);
		    				$writer.append($img);
		    				$writer.append(list[i].pbRWriterName);
		    				$content.text(list[i].pbRContent);
		    				$createDate.text(list[i].pbRCreateDate);
		    				$tr.append($writer);
		    				$tr.append($content);
		    				$tr.append($createDate);
		    				$replyArea.append($tr);
		    			});
		    		}
		    	});
		    }
			
			for(var i =0; i<pnoArray.length; i++){
				var $replyCount =$("#replyCount"+i);
				getReplyCount(pnoArray[i],$replyCount);
			}
			
			function getReplyCount(pbNo,replyCount){
				$.ajax({
					url:"getReplyCount.kh",
					data:{refPbno:Number(pbNo)},
					type:"get",
					success:function(count){
						replyCount.text(count);
					}
				});	
			}
			
			
			
	    </script> 
	    
</body>
</html>