<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>JS Drum Kit</title>
<link href="https://fonts.googleapis.com/css?family=Audiowide|Open+Sans"
	rel="stylesheet">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/project/projectView-style.css">
<script>
var pageCheck="projectView";
</script>

</head>
<body oncontextmenu="return false" onselectstart="return false"
	ondragstart="return false">
	<div id="saveModal">
		<div id="savePopup">
			<h5 align="center">프로젝트 저장</h5>
			<div class="folderarea">
				<jsp:include page="folderSelectView.jsp" />
			</div>
			<div class="textarea">
				<label>저장할 이름</label><br> <input type="text" id="projectTitle">
			</div>
			
				<div class="btnarea">
					<button id="save">저장</button>
					<button id="cancel">취소</button>
				</div>
		</div>
	</div>
	<div id="saveMessage" align="center">
		저장중입니다<span class="dot"></span>
	</div>
	<jsp:include page="../common/menubar.jsp" />
	<div class="musicController">
		<div>
			<div>
				<img id="pause" src="${contextPath}/resources/images/pause.png" style="cursor: pointer;" /> 
				<img id="play" src="${contextPath}/resources/images/play.png" style="cursor: pointer;" /> 
				<img id="stop" src="${contextPath}/resources/images/stop.png" style="cursor: pointer;" />
			</div>
			
			<div>
				<!-- length<input id="length" type="number" value="32" min="4" max="32"step=4>  -->
				bpm <input id="bpm" type="number" value="120" min="30" max="300"> 
			</div>
			<div>	
			    beat <input id="beat" type="number"value="8" min="4" max="16">
			</div>
			<div>	
			    length <input id="length" type="number"value="32" min="4" max="64" step="4">
			</div>
			
		</div>
		<div>
			<img src="${contextPath }/resources/images/right-arrow.png">
		</div>
	</div>
	
	<div class="savebtnarea">
			
			 
			<c:if test="${!empty project}">
			<h4 id="title">${project.projectTitle }</h4>
				<c:if test="${loginUser.id == project.projectWriter}"> 
					<button id="overrite">저장</button>
					<button id="savepop">다른 이름으로 저장</button>
				</c:if> 
			</c:if>
			<c:if test="${empty project}">
				<button id="savepop">저장</button>
			</c:if>
	</div>
	
	
	<section id="wrap">
		
		
		<jsp:include page="piano.jsp" />
		<jsp:include page="guitar.jsp" />
		<jsp:include page="bass.jsp" />
		<jsp:include page="drum.jsp" />
	</section>

	<c:forEach var="cList" items="${chord}">
		<audio class="guitarAudio" id="${cList}guitar"
			   src="${contextPath }/resources/sounds/guitar/${cList}.m4a"
			   preload="none"></audio>
	</c:forEach>
	<c:forEach var="dList" items="${drum}">
		<audio class="drumAudio" id="${dList}drum"
			   src="${contextPath }/resources/sounds/drum/${dList}.m4a"
			   preload="none"></audio>
	</c:forEach>
	<input type="hidden" id="padCheck">
	<script>
	var noteArr = '<c:out value="${note}"/>'.split(",");
    var bassNoteArr = '<c:out value="${note1}"/>'.split(",");
	var chordArr = '<c:out value="${chord}"/>'.split(","); 
	var drumArr = '<c:out value="${drum}"/>'.split(","); 
	 var length = $("#length").val();
	$(function() {
		var play;
	    var instruments = ["piano","bass"];
	    var pianoSoundInfo="";
	    var bassSoundInfo="";
	    var guitarSoundInfo="";
	    var drumSoundInfo="";
	    var bpm = $("#bpm").val();
	    var beat = $("#beat").val();
	    
	    if("${loginUser.id}"!="${project.projectWriter}"){
	    	$.ajax({
	    		url:"increaseViewCount.kh",
	    		data:{refPbno:${param.pbNo}},
	    		type:"get",
	    		success:function(result){
	    			console.log(result);
	    		}
	    	});
	    }
	    
	    
	   for(var i = 1; i <= 64; i++) {
		   $(".length"+i).hide(); 
		   
	   }
       for(var i = 1; i <= length; i++) {
	    	   if(i%4==0){
			         $(".length"+i).css("border-right","2px solid grey");
		          }
		       if(i==length){
		             $(".length"+i).css("border-right","1px solid lightgrey");
		       }
	          $(".length"+i).show();
	   }
       $(".padBox").width(40*length + 100);
       
	   $("#length").on("change",function(){
		   length = $("#length").val();
		   for(var i = 1; i <= 64; i++) {
			   $(".length"+i).hide(); 
		   }
		   
	       for(var i = 1; i <= length; i++) {
	    	   if(i%4==0){
			         $(".length"+i).css("border-right","2px solid grey");
		          }
		       if(i==length){
		             $(".length"+i).css("border-right","1px solid lightgrey");
		       }
	          $(".length"+i).show();
	       }
	       
	       $(".padBox").width(40*length + 100);
	       
	       
	   });
	   
	
	   var volume= 0.5;
	   
	 
	   
	   for(var i=0; i < $("audio").length; i++) {
		   $("audio")[i].volume = volume;
	   }
	   // 음소거
	   $("input[name='mute']").on("change",function(){
		   
	         var $mute = $("."+$(this).val()+"Audio");
	         console.log($(this).val());
	         for(var i=0; i<$mute.length; i++){
	 	       	  if($mute[i].volume!=0){
	 	          		$mute[i].volume=0;
	 	          		$(this).next().children().attr("src","${contextPath}/resources/images/mute.png");
	 	          }else{
	 	        		$mute[i].volume=volume;
	 	        		$(this).next().children().attr("src","${contextPath}/resources/images/unmute.png");
	         	  }
		     }
	   });
	   
	   // 볼륨조절
	   $("input[name='volume']").on("change",function(){
	       var $audio = $("."+$(this).attr("class")+"Audio");
	       volume = $(this).val()/10;
	       console.log(volume);
	       console.log($(this).attr("class"))
	       for(var i=0; i<$audio.length; i++){
	    	   $audio[i].volume= volume;
	    	   if(volume==0){
	    		   $(this).prev().children().attr("src","${contextPath}/resources/images/mute.png");
	    	   }else{
	    		   $(this).prev().children().attr("src","${contextPath}/resources/images/unmute.png");
	    	   }
		     }
	   });
	   
	  // 마우스 올렸을 때 색 변화
	  $(".sound").on("mouseenter",function(){
	  	$(this).children().eq(0).css("color","orangered");
	  }).on("mouseleave",function(){
	  	$(this).children().eq(0).css("color","");
	  });
	  
	  // 드래그 이벤트
	 if("${loginUser.id}"=="${project.projectWriter}"){
		  $(".pad").on("mousedown",function(){
		         var $pad = $(this);
		         imprint($pad);
		         $(".pad").on("mouseenter",function() {
						$pad = $(this);
						imprint($pad);
		         });
		         
			});
		  
		  // 마우스 땟을 때 이벤트 제거
		  $(".pad,body").on("mouseup",function(){
		  	$(".pad").off("mouseenter");
		  });
	      
	 }
	  // 안찍혀있을 때 색칠, 찍혀있을 때 색 없앰
	  function imprint(pad){
	  		var sound = pad.parent().attr('class').split(" ")[1]; 
	  		var instrument =pad.parent().attr('class').split(" ")[2];
	  		 console.log(sound+instrument);
	          if (pad.children().val() == "") {
	              $("#padCheck").val(sound+instrument);
	              pad.children().val(sound+instrument);
	              pad.css("background", "#F79F81");
	     		  playSound($("#padCheck").val());
	          } else {
	             pad.css("background", "");
	             pad.children().val("");
	          }
	  }

	   $("#beat,#bpm").on("change",function(){
	  	 if($("#beat").val()>beat){
	  		 $("#beat").val(beat*2);
	  	 }else if($("#beat").val()<beat){
	  	 	 $("#beat").val(beat/2); 
	  	 }
	  	 beat = $("#beat").val();
	  	 bpm = $("#bpm").val();
	  
	   });
	   
	   $("#play").on('click', function(){
	      bpm = $("#bpm").val();
	      beat = $("#beat").val();
	   });

	   function playSound(sound) {
		    const audio = document.querySelector("audio[id='"+ sound+"']");
		    if (!audio) return;
		    audio.currentTime = 0;
		    audio.play();
	   }
	   
	   var idx = 1;
	   function playMusic(){
	  	//$(".pad").css({"opacity":"1","border-left":"1px solid black","border-right":"1px solid black"});
	  		$(".pad").css({"opacity":"1"});
	    	//$(".length"+idx).css({"opacity":"0.5","border-left":"3px solid orange","border-right":"3px solid orange"});	
	    	$(".length"+idx).css({"opacity":"0.5"});	
	    	
	        for (var i = 1; i < 3; i++) {
		        for(var j = 0; j < noteArr.length; j++) {
		        	
		            var sound =$(".piano>."+noteArr[j]+i+".length" + idx).children().val();
		            if(sound!="")playSound(sound);
		        } 
	        }
	        playSound($(".piano>.C3" + ".length" + idx).children().val());
	        for (var i = 0; i < 2; i++) {
		        for(var j = 0; j < noteArr.length; j++) {
		            var sound =$(".bass>."+noteArr[j]+i+".length" + idx).children().val();
		            if(sound!="")playSound(sound);
		        } 
	        }
	        
	       playSound($(".bass>.C2" + ".length" + idx).children().val());
	       
	   	   for(var i = 0; i < drumArr.length; i++) { 
	   			var sound =$("."+drumArr[i]+".length" + idx).children().val();
	   	        if(sound!="")playSound(sound);
	       }
	       for(var i=0; i<chordArr.length; i++){
	    	   var sound =$("."+chordArr[i]+".length" + idx).children().val();
	    	   if(sound!="")playSound(sound);
	 	    } 
	       	play=setTimeout(function(){
	       		  if (idx >= length) {
	                   idx = 1;
	               }else{
	          		  idx++;
	               }
	       		playMusic();
	       	},(1000/(bpm*(bpm/60)))*bpm/(beat/4));
	       	
	   }
	   
	   $("#play").click(function() {
		 $("#play").hide();
		 $("#pause").show();
		 playMusic();
	   });
	   
		$("#pause").click(function() {
			$("#pause").hide();
			$("#play").show();
		   clearInterval(play);
		});
		
		$("#stop").click(function() {
			idx=1;
			$(".pad").css({"opacity":"1"});
			$("#pause").hide();
			$("#play").show();
			clearInterval(play);
		});

	$("#cancel").on("click",function(){
		$("#projectTitle").val("");
		$("#saveModal").css({"display":"none"});
		$(".folders li").children("input:hidden").val(0);
		$(".arrowimg").attr("src","${contextPath }/resources/images/right-arrow.png");
		$(".folders li").children("ul").remove();
		path="${loginUser.name}";
	});	

	$("#savepop").on("click",function(){
		$("#saveModal").css({"display":"block"});
	});

	$("#save").on("click",function(){
		
		var sound="";
		var sounds="";
		var projectTitle= $("#projectTitle").val();
		if(projectTitle.trim()!=""){
			$("#saveMessage").show();
			var loading=setInterval(function(){
				$("#saveMessage").children(".dot").append(".");
				if($("#saveMessage").children(".dot").text().length>=4){
					$("#saveMessage").children(".dot").text(".");
				}
			},300);
			$('body').scrollTop(0);
			$('#scrollbox').scrollLeft(0);
			for(var i =1; i<=length; i++){ 
		       for (var k = 1; k < 3; k++) {
		          for(var j = 0; j < noteArr.length; j++) {
		        	  sound=$(".piano ."+noteArr[j]+k+".length"+i).children().val();
		        	  if(sound==""){
		        	     sounds+="x ";
		        	  }else{
		        		 sounds+=sound+" ";
		        	  }
		         } 
		   	  }
		   	  if($(".piano .C3.length"+i).children().val()==""){
		         	  pianoSoundInfo+=sounds+"x/";
		   	  }else{
		   		  pianoSoundInfo+=sounds+$(".piano .C3.length"+i).children().val()+"/";
		   	  }
		   	  sounds="";
			}
			for(var i =1; i<=length; i++){ 
		      		 for (var k = 0; k < 2; k++) {
		               	for(var j = 0; j < bassNoteArr.length; j++) {
		               		sound=$(".bass ."+bassNoteArr[j]+k+".length"+i).children().val();
		               	    if(sound==""){
		               	    	sounds+="x ";
		               		}else{
		               			sounds+=sound+" ";
		               		}
		                }
		     		 }
		     		 if($(".bass .C2.length"+i).children().val()==""){
			           	  bassSoundInfo+=sounds+"x/";
		           	  }else{
		           		  bassSoundInfo+=sounds+$(".bass .C2.length"+i).children().val()+"/";
		           	  }
		           	 sounds="";
				}
			
			
			for(var i =1; i<=length; i++){ 
		          for(var j = 0; j < chordArr.length; j++) {
		          		sound=$(".guitar ."+chordArr[j]+".length"+i).children().val();
		               	if(sound==""){
		               		sounds+="x ";
		               	}else{
		               		sounds+=sound+" ";
		               	}
		          }
		          guitarSoundInfo+=sounds+"/";
		          sounds="";
			}
		
			for(var i =1; i<=length; i++){ 
		           for(var j = 0; j < drumArr.length; j++) {
		          	    sound=$(".drum ."+drumArr[j]+".length"+i).children().val();
		               	if(sound==""){
		               		sounds+="x ";
		               	}else{
		               		sounds+=sound+" ";
		               	}
		          }
		          drumSoundInfo+=sounds+"/";
		          sounds="";
			}
			var projectImagePath;
			
			html2canvas(document.getElementById("padBox")).then(function(canvas) {
				projectImagePath=canvas.toDataURL("image/jpeg");
		    });
					
			setTimeout(function(){
			
			 	$.ajax({
					url:"savePjt.kh",
					data:{projectTitle:projectTitle,
						  pianoSoundInfo:pianoSoundInfo,
						  bassSoundInfo:bassSoundInfo,
						  guitarSoundInfo:guitarSoundInfo,
						  drumSoundInfo:drumSoundInfo,
						  bpm:bpm,
						  beat:beat,
						  length:length,
						  projectPath:path,
						  projectImagePath:projectImagePath},
					type:"post",
					success:function(result){
						$("#projectTitle").val("");
				 		$("#saveModal").hide();
				 		$(".folders li").children("input:hidden").val(0);
						$(".arrowimg").attr("src","${contextPath }/resources/images/right-arrow.png");
						$(".folders li").children("ul").remove();
						$("#saveMessage").hide();
					}
				});  
			},3000);
			
		}else{
			$("#projectTitle").css("border","2px solid red");
		}
	 });
	 $("#projectTitle").on("focus",function(){
			$("#projectTitle").css("border","");	
	 });
	
	});
	</script>
	
	
	
	<c:if test="${!empty project}">
		<script>
		  	$("#title").text('${project.projectTitle}');
			$("#bpm").val('${project.bpm}');
			$("#beat").val('${project.beat}');
			$("#length").val('${project.length}');

		   length = $("#length").val();
		   for(var i = 1; i <= 64; i++) {
			   $(".length"+i).hide(); 
		   }
		   
	       for(var i = 1; i <= length; i++) {
	    	   if(i%4==0){
			         $(".length"+i).css("border-right","2px solid grey");
		          }
		       if(i==length){
		             $(".length"+i).css("border-right","1px solid lightgrey");
		       }
	          $(".length"+i).show();
	       }
	       
	       $(".padBox").width(40*length + 100);
			
			var beatArr = "<c:out value='${project.pianoSoundInfo}'/>".split("/");
			var soundArr;
	 		for(var i=0; i<length; i++){
	 			soundArr= $.trim(beatArr[i]).split(" ");
	 			var sidx=0;
	 			for(var octv=1; octv<3; octv++){
  		 			 for(var j=0; j<noteArr.length; j++){
  		 				if(soundArr[sidx]!="x"){
	    		 			$(".piano ."+noteArr[j]+octv+".length"+(i+1)).children().val(soundArr[sidx]);
	    		 			$(".piano ."+noteArr[j]+octv+".length"+(i+1)).css("background","#F79F81");
  		 				}
  		 				sidx++;
		 			}
		 		}
  		 		if(soundArr[sidx]!="x"){
	    		 	$(".piano .C3.length"+(i+1)).children().val(soundArr[sidx]);
		 			$(".piano .C3.length"+(i+1)).css("background","#F79F81");
  		 		}
	 		}
	 		beatArr = "<c:out value='${project.bassSoundInfo}'/>".split("/");
	 		for(var i=0; i<length; i++){
	 			soundArr= $.trim(beatArr[i]).split(" ");
	 			var sidx=0;
	 			for(var octv=0; octv<2; octv++){
  		 			 for(var j=0; j<bassNoteArr.length; j++){
  		 				if(soundArr[sidx]!="x"){
	    		 				$(".bass ."+bassNoteArr[j]+octv+".length"+(i+1)).children().val(soundArr[sidx]);
	    		 				$(".bass ."+bassNoteArr[j]+octv+".length"+(i+1)).css("background","#F79F81");
  		 				}
  		 				sidx++;
		 				}
		 			}
  		 		if(soundArr[sidx]!="x"){
	    		 	$(".bass .C2.length"+(i+1)).children().val(soundArr[sidx]);
		 			$(".bass .C2.length"+(i+1)).css("background","#F79F81");
  		 		}
	 		}
 		   
 		   beatArr = "<c:out value='${project.guitarSoundInfo}'/>".split("/");
	 	   for(var i=0; i<length; i++){
	 			soundArr= $.trim(beatArr[i]).split(" ");
	 			var sidx=0;	
  		 		for(var j=0; j<chordArr.length; j++){
	  		 		if(soundArr[sidx]!="x"){
		    		 	$(".guitar ."+chordArr[j]+".length"+(i+1)).children().val(soundArr[sidx]);
		    		 	$(".guitar ."+chordArr[j]+".length"+(i+1)).css("background","#F79F81");
	  		 		}
	  		 		sidx++;
		 		}
	 	   }
 		  
 		  beatArr = "<c:out value='${project.drumSoundInfo}'/>".split("/");
	 	   for(var i=0; i<length; i++){
	 			soundArr= $.trim(beatArr[i]).split(" ");
	 			var sidx=0;	
	 			for(var j=0; j<drumArr.length; j++){
	 				if(soundArr[sidx]!="x"){
  		 				$(".drum ."+drumArr[j]+".length"+(i+1)).children().val(soundArr[sidx]);
  		 				$(".drum ."+drumArr[j]+".length"+(i+1)).css("background","#F79F81");
	 				}
	 				sidx++;
 			    }
	 	   }
 		   sidx=0;
 			
 		   
 		 
		</script>	
		<c:if test="${loginUser.id != project.projectWriter}"> 
		<script>
			$("#bpm,#beat,#length").attr("readonly","readonly");
		</script>
	</c:if>
	</c:if>
	
	
</body>
</html>