<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>JS Drum Kit</title>
<link href="https://fonts.googleapis.com/css?family=Audiowide|Open+Sans"
	rel="stylesheet">


<style>
* {
	box-sizing: border-box;
}

body{
	background:grey !important;

}

div {
	width: 100%;
	height: 25px;
	margin: auto;

}
div div:first-child{
	width:4%;
	float: left;
	height: 100%;
	border: 1px solid lightgrey;
}
.pad{
	width: 3%;
	height: 100%;
	border: 1px solid lightgrey;
	float: left;
	background:rgba(255,255,255,0.4)
}
h1{
	color:white;
}
section{
	
	width:95%;
	height:95%;
	margin:auto;
}
.volumeController{
	padding: 0;
	height: 40px;
	position: relative;
}
.volumeController label img{
	position: absolute;
	top: 8px;
}
input[name="mute"]{
	display:none;
}
input[name="volume"]{
	height: 100%;
	width: 120px;
	margin-left: 30px;
}
#pause{
	display:none;
}
</style>
</head>
<body oncontextmenu="return false" onselectstart="return false"
	ondragstart="return false">
	<jsp:include page="../common/menubar.jsp"/>

	<section>
	<div class = "controller">
		<img id="pause" src="${contextPath}/resources/images/pause.png" style="cursor: pointer;"/>
		<img id="play" src="${contextPath}/resources/images/play.png" style="cursor: pointer;"/>
		<img id="stop" src="${contextPath}/resources/images/stop.png" style="cursor: pointer;"/>
		<button id="save">save</button>
		<button id="open">open</button>
		length<input id="length" type="number" value="32" min="4" max="32" step=4>
		bpm<input id="bpm" type="number" value="120" min="30" max="300">
		beat<input id="beat" type="number" value="8" min="4" max="16">
	</div>
	
	
		<jsp:include page="piano.jsp" />
		<jsp:include page="guitar.jsp" />
		<jsp:include page="bass.jsp" />
		<jsp:include page="drum.jsp" />
	</section>
	
	
	
	
	
	<c:forEach var="cList" items="${chord}">
    	<audio class="guitarAudio" id="${cList}guitar" src="${contextPath }/resources/sounds/guitar/${cList}.m4a" preload="none"></audio>
    </c:forEach>
	
	
	  	<c:forEach var="dList" items="${drum}">
   			<audio class="drumAudio" id="${dList}drum" src="${contextPath }/resources/sounds/drum/${dList}.m4a" preload="none"></audio>
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
   function test(){
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
	          	 test();
        	},(1000/(bpm*(bpm/60)))*bpm/(beat/4));
          
    
   }
   
   
   $("#play").click(function() {
	 $("#play").hide();
	 $("#pause").show();
  	 test();
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




$("#save").on("click",function(){
	var sound="";
	var sounds="";
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
	
 $.ajax({
		url:"savePjt.kh",
		data:{pianoSoundInfo:pianoSoundInfo,
			  bassSoundInfo:bassSoundInfo,
			  guitarSoundInfo:guitarSoundInfo,
			  drumSoundInfo:drumSoundInfo,
			  bpm:bpm,
			  beat:beat},
		type:"post",
		success:function(result){
			soundInfo="";
			console.log(result);
		}
	});    		 
 });
  
 
 
 $("#open").on("click",function(){
	 $.ajax({
		url:"openPjt.kh",
		type:"get",
		dataType:"json",
		success:function(project){
			console.log(project.bpm);
			console.log(project.beat);
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