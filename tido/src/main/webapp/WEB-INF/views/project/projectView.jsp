<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>JS Drum Kit</title>
<link href="https://fonts.googleapis.com/css?family=Audiowide|Open+Sans"
	rel="stylesheet">
<link rel="stylesheet"
	href="${ pageContext.servletContext.contextPath }/resources/css/project/projectView-style.css">
</head>
<body oncontextmenu="return false" onselectstart="return false"
	ondragstart="return false">
	<div id="saveModal">
		<div>
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
				<button id="savepop">저장</button>
				<button id="open">open</button>
			</div>
		</div>
		<div>
			<img src="${contextPath }/resources/images/right-arrow.png">
		</div>
	</div>
	<section>
		
		
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
	$(function() {
		var play;
	    var instruments = ["piano","bass"];
	    var pianoSoundInfo="";
	    var bassSoundInfo="";
	    var guitarSoundInfo="";
	    var drumSoundInfo="";
	    var bpm = $("#bpm").val();
	    var length = $("#length").val();
	    var beat = $("#beat").val();
	    var noteArr = '<c:out value="${note}"/>'.split(",");
	    var bassNoteArr = '<c:out value="${note1}"/>'.split(",");
		var chordArr = '<c:out value="${chord}"/>'.split(","); 
		var drumArr = '<c:out value="${drum}"/>'.split(","); 
	   
	   $("#length").on("change",function(){
	  	 
	       for(var i = 1; i <= $("#length").val(); i++) {
	          $(".length"+i).show();
	       }
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
	   
	   $("#length").on('change', function(){
	      length = $("#length").val();
	      for(var i = 1; i <= length; i++) {
	         $(".length"+i).show();
	      }
	      
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
	        
	        for (var i = 0; i < 2; i++) {
		        for(var j = 0; j < noteArr.length; j++) {
		            var sound =$(".bass>."+noteArr[j]+i+".length" + idx).children().val();
		            if(sound!="")playSound(sound);
		        } 
	        }
	        
	       playSound($(".C3 " + ".length" + idx).children().val());
	       
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
			for(var i =1; i<=32; i++){ 
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
			for(var i =1; i<=32; i++){ 
		      		 for (var k = 0; k < 2; k++) {
		               	for(var j = 0; j < bassNoteArr.length; j++) {
		               		sound=$(".bass ."+bassNoteArr[j]+k+".length"+i).children().val();
		               		console.log(i+""+sound)
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
					 console.log(bassSoundInfo);
		           	 sounds="";
				}
			
			
			for(var i =1; i<=32; i++){ 
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
		
			for(var i =1; i<=32; i++){ 
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
			
			console.log(path);
		 	$.ajax({
				url:"savePjt.kh",
				data:{projectTitle:projectTitle,
					  pianoSoundInfo:pianoSoundInfo,
					  bassSoundInfo:bassSoundInfo,
					  guitarSoundInfo:guitarSoundInfo,
					  drumSoundInfo:drumSoundInfo,
					  bpm:bpm,
					  beat:beat,
					  projectPath:path},
				type:"post",
				success:function(result){
					$("#projectTitle").val("");
			 		$("#saveModal").css({"display":"none"});
			 		$(".folders li").children("input:hidden").val(0);
					$(".arrowimg").attr("src","${contextPath }/resources/images/right-arrow.png");
					$(".folders li").children("ul").remove();
					
				}
			});  
		}else{
			$("#projectTitle").css("border","2px solid red");
		}
	 });
	 $("#projectTitle").on("focus",function(){
			$("#projectTitle").css("border","");	
	 });
	  
	 $("#open").on("click",function(){
		 $.ajax({
			url:"openPjt.kh",
			type:"get",
			dataType:"json",
			success:function(project){
				$("#bpm").val(project.bpm);
				$("#beat").val(project.beat);
				var beatArr = project.pianoSoundInfo.split("/");
				var soundArr;
		 		for(var i=0; i<32; i++){
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
	  		 			console.log(soundArr[sidx]);
		    		 	$(".piano .C3.length"+i).children().val(soundArr[sidx]);
			 			$(".piano .C3.length"+i).css("background","#F79F81");
	  		 		}
		 		}
		 		beatArr = project.bassSoundInfo.split("/");
		 		console.log(beatArr);
		 		for(var i=0; i<32; i++){
		 			soundArr= $.trim(beatArr[i]).split(" ");
		 			var sidx=0;
		 			console.log(soundArr);
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
	  		 			console.log(soundArr[sidx]);
		    		 	$(".bass .C2.length"+i).children().val(soundArr[sidx]);
			 			$(".bass .C2.length"+i).css("background","#F79F81");
	  		 		}
		 		}
	 		   
	 		   beatArr = project.guitarSoundInfo.split("/");
		 	   for(var i=0; i<32; i++){
		 			soundArr= $.trim(beatArr[i]).split(" ");
		 			var sidx=0;	
		 			console.log(soundArr);
	  		 		for(var j=0; j<chordArr.length; j++){
		  		 		if(soundArr[sidx]!="x"){
			    		 	$(".guitar ."+chordArr[j]+".length"+(i+1)).children().val(soundArr[sidx]);
			    		 	$(".guitar ."+chordArr[j]+".length"+(i+1)).css("background","#F79F81");
		  		 		}
		  		 		sidx++;
			 		}
		 	   }
	 		  
	 		  beatArr = project.drumSoundInfo.split("/");
		 	   for(var i=0; i<32; i++){
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
	 		 
			}
		});   
	 });
	});
	</script>
</body>
</html>