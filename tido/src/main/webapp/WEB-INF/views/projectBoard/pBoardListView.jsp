<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script >
	var pageCheck;
</script>
<style>
	section{
			height:1200px;
			overflow: scroll;
	}
	section,#header{
		width:100%;
		margin:auto;
		background:rgba(0,0,0,0.8);
		
	}

	.boardInsertbtn{
	 	background-color: rgb(25,25,25) !important;
	 	border: 2px solid rgb(25,25,25) !important;
	 	margin:10px 10px 0 0;
	}
	#header>h2{
		padding:10px;
		width:80%;
		display:inline-block;
		color: white;

	}
	table{
		margin:auto;
	}
	.pBoard{
		width:50%;
		height:300px;
		background: rgba(0,0,0,0.8);
		border-radius: 5px;
		margin-bottom: 5px;
		color:white;
		margin: auto;
	}
	.reply,.replyarea{
		width:50%;
		height:80px;
		padding-left:10px;
		background: rgba(0,0,0,0.8);
		color:white;
		margin:auto;
	}
	.replyarea{
	   height:30px;
	   margin-bottom: 10px;
	   
	}
	.replyarea:hover{
		cursor: pointer;
		text-decoration: underline;
	}
	.reply>img{
		display:inline-block;
		
		line-height: 80px;
	}
	.reply>div:first-child{
		float:left;
		padding-top:18px;
		width:10%;
	}
	.reply>div:nth-child(2){
		float:left;
		padding-top:14px;
		width:90%;
	}
	.textarea{
		height: 100%;
	
	}
	.reply>div>textarea{
		background: none;
		resize:none;
		border-radius: 5px;
		border:2px solid white;
		color:white;
		height: auto;
		width:95%;
	}
	.pBoard>div{
		float:left;
	}
	
	.pBoardInfo{
		width:60%;
		height: 100%;
	}
	.projectImage{
		width:38%;
		height: 95%;
		border:1px solid white;
		margin:1%;
		border-radius: 10px;
			position:relative;
	}
	.pBoard>.pBoardInfo>div{
		width:100%;
	}
	.writer{
		padding:20px 0 0 20px;
		height: 48px;
	}
	.count{
		padding-left:20px;
		height: 10%;
		padding-left:10px;
	}
	.count span{
		margin-right: 10px;
	}
	.count img{
		width:20px; 
		height:20px;
	}
	.date{
	   font-size:12px;
	   height: 10%;
	   padding:10px;
	}
	.title{
		padding-left:10px;
		font-weight: bolder;
		height: 10%;
	}
	.content{
		padding-left:10px;
		height: 40%;
	}
	.projectImage>img{
		padding:20px;
		padding-bottom:0px;
		width:100%;
		height: 70%;
	}
	.projectImage>div{
		width:100%;
		height: 30%;
		position: relative;
		
	}
	.projectImage>div>p{
		margin:0;
		padding:0;
		padding-left:20px;
		font-size: 12px;
	}
	.projectImage>div>h5{
		margin:0;
		padding:0;
		padding-left:15px;
		font-size: 20px;
	}
	::-webkit-scrollbar{
		display:none;
	}
	.view,.etc{
	  -webkit-filter: invert(100%);
         filter: invert(100%);
	}
	.etc:hover{
		cursor: pointer;
	}
	
	.contextmenu {
	  display: none;
	  position: absolute;
	  width: 200px;
	  margin: 0;
	  padding: 0;
	  background: #FFFFFF;
	  border-radius: 5px;
	  list-style: none;
	  box-shadow:
	    0 15px 35px rgba(50,50,90,0.1),
	    0 5px 15px rgba(0,0,0,0.07);
	  overflow: hidden;
	  z-index: 999999;
	}

.contextmenu li {
  border-left: 3px solid transparent;
  transition: ease .2s;
}

.contextmenu li span {
  display: block;
  padding: 10px;
  color: black;
  text-decoration: none;
  transition: ease .2s;
}
.contextmenu li:hover {
  background: #CE93D8;
  border-left: 3px solid #9C27B0;
  cursor: pointer;
}

.contextmenu li:hover span {
  color: #FFFFFF;
}

.updateModal{
		position: fixed;
		width:100%;
		height: 100%;
		background: rgba(0,0,0,0.7);
		top:0;
		left:0;
		z-index:3;
		display: none;
	}
	.updateModal>div{
		margin:auto;
		margin-top:150px;
		background:rgba(255,255,255,0.9);
		width:400px;
		height: 400px;
		border-radius: 5px;
	}
	.updateModal>div>h2{
		padding:10px;
		
	}
	.updateModal>div>div{
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
	.projectImage:hover{
		cursor: pointer;
		opacity: 0.7;
	}
</style>
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
							<div class="pBoard">
						</c:if>
						<c:if test="${loginUser.id == pb.writerId }">
							<div class="pBoard" style="background: grey">
						</c:if>
						
							<input type="hidden" value="${pb.pbNo }">
							<div class="pBoardInfo">
								<p class="writer">
									<img src="${contextPath }/resources/muploadFiles/${pb.writerId}/${pb.writerImagePath}" width="48" height="48">
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
									<span>${pb.pBoardViewCount}</span>
									<c:if test="${loginUser.id == pb.writerId }">
									<img  class="etc" src="${contextPath }/resources/images/etc.png" width=20px; height="20px">
									</c:if>
								</div>
							</div>
							<c:if test="${loginUser.id != pb.writerId }">
							<div class="projectImage">
							</c:if>
							<c:if test="${loginUser.id == pb.writerId }">
							<div class="projectImage" style="background: grey">
							</c:if>
								<input type="hidden" value="${pb.refPNo }">
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
								<textarea rows="2"  ></textarea>
							</div>
							
						</div>
						<div class="replyarea">
								댓글 보기 <span style="font-size:7px"> ▼</span>
						</div>
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
	    		location.href="openPjt.kh?pNo="+$(this).children().eq(0).val();
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
	    	
	    </script> 
	    
</body>
</html>