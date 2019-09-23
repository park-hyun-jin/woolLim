`<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>JS Drum Kit</title>
<link href="https://fonts.googleapis.com/css?family=Audiowide|Open+Sans"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>


<style>
* {
	box-sizing: border-box;
}

body{
	background:#A9D0F5;
	
}

div {
	width: 100%;
	height: 25px;
	margin: auto;

}
div div:first-child{
	width:65px;
	float: left;
	height: 100%;
	border: 1px solid grey;
}
.pad{
	width: 45px;
	height: 100%;
	border: 1px solid grey;
	float: left;
	background:rgba(255,255,255,0.4)
}
</style>
</head>
<body oncontextmenu="return false" onselectstart="return false"
	ondragstart="return false">
	<%@ include file="../common/menubar.jsp" %>

	
	
	<button id="stop">멈춤</button>
	<button id="play">재생</button>
	<button id="test">save</button>
	<button id="open">open</button>
	
	length<input id="length" type="number" value="32" min="4" max="32" step=4>
	bpm<input id="bpm" type="number" value="120" min="30" max="300">
	beat<input id="beat" type="number" value="8" min="4" max="16">
	

	<section>
		<%@ include file="piano.jsp" %>
		<%@ include file="guitar.jsp" %>
		<%@ include file="bass.jsp" %>
		<%@ include file="drum.jsp" %>
	</section>
	
	
	
	
	
	<% for(int j = 1; j <= 2; j++) {%>
	   	<% for(int k = 0; k < 12; k++) {%>
	         <audio class="pianoAudio" id="<%=note[k]%><%= j %>piano" src="${contextPath }/resources/sounds/piano/<%=note[k]%><%= j %>.wav" preload="none"></audio>
	
	    <% } %>
    <% } %>
   			<audio class="pianoAudio" id="C3piano" src="${contextPath }/resources/sounds/piano/C3.wav" preload="none"></audio>
	
	<%for(int j=0; j<24; j++) {%> 
    	<audio class="guitarAudio" id="<%=chord[j]%>guitar" src="${contextPath }/resources/sounds/guitar/<%=chord[j]%>.m4a" preload="none"></audio>
    <%} %>
	
	<% for(int j = 0; j <= 1; j++) {%>
	   	<% for(int k = 0; k < 12; k++) {%>
	         <audio class="bassAudio" id="<%=note1[k]%><%= j %>bass" src="${contextPath }/resources/sounds/bass/<%=note1[k]%><%= j %>.wav" preload="none"></audio>
	
	    <% } %>
    <% } %>
   			<audio class="bassAudio" id="C2bass" src="${contextPath }/resources/sounds/bass/C2.wav"preload="none"></audio>
	
	  <%for(int j=0; j<drum.length; j++){ %>	
   		<audio class="drumAudio" id="<%=drum[j]%>drum" src="${contextPath }/resources/sounds/drum/<%=drum[j]%>.m4a" preload="none"></audio>
   	  <%} %>
	
	
	



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
          
    	 $("#test").on("click",function(){
    		var sound="";
    		var sounds="";
    		
    		for(var i =1; i<=32; i++){ 
	             <%for (int i = 1; i < 3; i++) {%>
		               	<% for(int j = 0; j < note.length; j++) {%>
		               		sound=$(".piano .<%=note[j]%><%=i%>.length"+i).children().val();
		               	    if(sound==""){
		               	    	sounds+="x ";
		               		}else{
		               			sounds+=sound+" ";
		               		}
		                <%} %>
	           	  <%}%>
	           	  if($(".piano .C3.length"+i).children().val()==""){
		           	  pianoSoundInfo+=sounds+"x/";
	           	  }else{
	           		  pianoSoundInfo+=sounds+$(".piano .C3.length"+i).children().val()+"/";
	           	  }
	           	  sounds="";
    		}
    		for(var i =1; i<=32; i++){ 
	             <%for (int i = 0; i < 2; i++) {%>
		               	<% for(int j = 0; j < note1.length; j++) {%>
		               		sound=$(".bass .<%=note1[j]%><%=i%>.length"+i).children().val();
		               		console.log(i+""+sound)
		               	    if(sound==""){
		               	    	sounds+="x ";
		               		}else{
		               			sounds+=sound+" ";
		               		}
		                <%} %>
	           		 <%}%>
	           		 if($(".bass .C2.length"+i).children().val()==""){
			           	  bassSoundInfo+=sounds+"x/";
		           	  }else{
		           		  bassSoundInfo+=sounds+$(".bass .C2bass.length"+i).children().val()+"/";
		           	  }
	    			 console.log(bassSoundInfo);
		           	 sounds="";
   			}
    		console.log(bassSoundInfo);
    		for(var i =1; i<=32; i++){ 
		          <% for(int j = 0; j < chord.length; j++) {%>
		          		sound=$(".guitar .<%=chord[j]%>.length"+i).children().val();
		               	if(sound==""){
		               		sounds+="x ";
		               	}else{
		               		sounds+=sound+" ";
		               	}
		          <%} %>
		          guitarSoundInfo+=sounds+"/";
		          sounds="";
  			}
    	
    		for(var i =1; i<=32; i++){ 
		          <% for(int j = 0; j < drum.length; j++) {%>
		          	    sound=$(".drum .<%=drum[j]%>drum.length"+i).children().val();
		               	if(sound==""){
		               		sounds+="x ";
		               	}else{
		               		sounds+=sound+" ";
		               	}
		          <%} %>
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
 					$("#bpm").val(project.bpm);
					$("#beat").val(project.beat);
					
					var beatArr = project.pianoSoundInfo.split("/");
 					var soundArr;
    		 		<%for(int i=0; i<32; i++){%>
    		 			soundArr= beatArr[<%=i%>].trim().split(" ");
    		 			var sidx=0;	
    		 			<%for(int octv=1; octv<3; octv++){
	    		 			for(int j=0; j<note.length; j++){%>
	    		 			
	    		 				if(soundArr[sidx]!="x"){
		    		 				$(".piano .<%=note[j]%><%=octv%>.length<%=i+1%>").children().val(soundArr[sidx]);
		    		 				$(".piano .<%=note[j]%><%=octv%>.length<%=i+1%>").css("background","#01DF74");
	    		 				}
	    		 				sidx++;
	    		 		<%}
	    		 		}%>
	    		 		if(soundArr[sidx]!="x"){
	    		 			console.log(soundArr[sidx]);
		    		 		$(".piano .C3.length<%=i+1%>").children().val(soundArr[sidx]);
			 				$(".piano .C3.length<%=i+1%>").css("background","#01DF74");
	    		 		}
    		 		<%}%>
    		 		sidx=0;
    		 		beatArr = project.bassSoundInfo.split("/");
    		 		console.log(beatArr);
    		 		<%for(int i=0; i<32; i++){%>
    		 			soundArr= beatArr[<%=i%>].trim().split(" ");
    		 			var sidx=0;	
    		 			<%for(int octv=0; octv<2; octv++){
	    		 			for(int j=0; j<note.length; j++){%>
	    		 			
	    		 				if(soundArr[sidx]!="x"){
		    		 				$(".bass .<%=note[j]%><%=octv%>.length<%=i+1%>").children().val(soundArr[sidx]);
		    		 				$(".bass .<%=note[j]%><%=octv%>.length<%=i+1%>").css("background","#01DF74");
	    		 				}
	    		 				sidx++;
	    		 		<%}
	    		 		}%>
	    		 		if(soundArr[sidx]!="x"){
	    		 			console.log(soundArr[sidx]);
		    		 		$(".bass .C2.length<%=i+1%>").children().val(soundArr[sidx]);
			 				$(".bass .C2.length<%=i+1%>").css("background","#01DF74");
	    		 		}
    		 		<%}%>
		 		   
		 		   sidx=0;
		 		   beatArr = project.guitarSoundInfo.split("/");
    		 	   <%for(int i=0; i<32; i++){%>
			 			soundArr= beatArr[<%=i%>].trim().split(" ");
			 			var sidx=0;	
			 			<%for(int j=0; j<chord.length; j++){%>
	    		 			
	    		 			if(soundArr[sidx]!="x"){
		    		 			$(".guitar .<%=chord[j]%>.length<%=i+1%>").children().val(soundArr[sidx]);
		    		 			$(".guitar .<%=chord[j]%>.length<%=i+1%>").css("background","#01DF74");
	    		 			}
	    		 			sidx++;
	    		 		<%}%>
		 		   <%}%>
		 		   
		 		   sidx=0;
		 		  beatArr = project.drumSoundInfo.split("/");
    		 	   <%for(int i=0; i<32; i++){%>
			 			soundArr= beatArr[<%=i%>].trim().split(" ");
			 			var sidx=0;	
			 			<%for(int j=0; j<drum.length; j++){%>
	    		 			
	    		 				if(soundArr[sidx]!="x"){
		    		 				$(".drum .<%=drum[j]%>drum.length<%=i+1%>").children().val(soundArr[sidx]);
		    		 				$(".drum .<%=drum[j]%>drum.length<%=i+1%>").css("background","#01DF74");
	    		 				}
	    		 				sidx++;
	    		 		<%}%>
		 		   <%}%>
		 		   sidx=0;
 				}
 			});    
    	 });
    	  
    	  
         
         $("#length").on("change",function(){
        	   for(var i = 1; i < 33; i++) {
                   $(".length"+i).hide();
                }
                for(var i = 1; i <= $("#length").val(); i++) {
                   $(".length"+i).show();
                }
         });
      
      
      
      
      
     
		
         function playSound(sound, ins) {
        	 console.log(sound);
            if (sound != '') {
               const audio = document.querySelector("audio[id='" + sound+"']");
               if (!audio)
                  return;
              
         
               audio.currentTime = 0;
               audio.play();
             
            }
            
         }
         
         $("input[name='mute']").on("change",function(){
        	
 	          
 	          var $mute = $("."+$(this).val()+"Audio");
 	          console.log($(this).val());
	 	      console.log($mute[0]);
	 	      console.log($mute[1]);
 	          for(var i=0; i<$mute.length; i++){
		 	       	  if($mute[i].volume!=0){
		 	          		$mute[i].volume=0;
		 	          }else{
		 	        		$mute[i].volume=1.0;
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
        		var sound = pad.parent().children().eq(0).text(); 
        		var instrument =pad.parent().attr('class').split(" ")[2];
                if (pad.children().val() == "") {
	                $("#padCheck").val(sound+instrument);
	                pad.children().val(sound+instrument);
	                pad.css("background", "#01DF74");
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

         
         
         
         var idx = 1;
         function test(){
        	//$(".pad").css({"opacity":"1","border-left":"1px solid black","border-right":"1px solid black"});
        	$(".pad").css({"opacity":"1"});
          	//$(".length"+idx).css({"opacity":"0.5","border-left":"3px solid orange","border-right":"3px solid orange"});	
          	$(".length"+idx).css({"opacity":"0.5"});	
              <%for (int k = 0; k <2; k++) {%>
	                <%for (int i = 0; i < 3; i++) {%>
		               	<% for(int j = 0; j < note.length; j++) {%>
		               	  	var sound =$("."+instruments[<%=k%>]+">.<%=note[j]+i%>.length" + idx).children().val();
		               		if(sound!=undefined){
		                 	 	playSound(sound);
		               		}
		                <%} %>
	               <%}%>
             <%}%>
             playSound($(".C3 " + ".length" + idx).children().val());
             
         	   <%for(int i = 0; i < drum.length; i++) { %>
             		playSound($(".<%=drum[i]%>drum.length" + idx).children().val());
             <%}%>
             
             <%for(int i=0; i<chord.length; i++){%>
             		playSound($(".<%=chord[i]%>" + ".length" + idx).children().val());
       	    <%}%>
       	   
	       	
	        	   
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
        	 test();
          });
       <%--   $("#play").click(function() {
            play = setInterval(function() {
            	$(".pad").css({"opacity":"1","border-left":"1px solid black","border-right":"1px solid black"});
            	$(".length"+idx).css({"opacity":"0.5","border-left":"3px solid orange","border-right":"3px solid orange"});	
                <%for (int k = 0; k <2; k++) {%>
	                <%for (int i = 0; i < 3; i++) {%>
		               	<% for(int j = 0; j < note.length; j++) {%>
		               	  	var sound =$("."+instruments[<%=k%>]+">.<%=note[j]+i%>.length" + idx).children().val();
		               		if(sound!=undefined){
		                 	 	playSound(sound);
		               		}
		                <%} %>
	               <%}%>
               <%}%>
               playSound($(".C3 " + ".length" + idx).children().val());
               
           	   <%for(int i = 0; i < drum.length; i++) { %>
               		playSound($(".<%=drum[i]%>drum.length" + idx).children().val());
               <%}%>
               
               <%for(int i=0; i<chord.length; i++){%>
               		playSound($(".<%=chord[i]%>" + ".length" + idx).children().val());
         	   <%}%>
            
               idx++;
               if (idx > length) {
                  idx = 1
               }
            }, (1000/(bpm*(bpm/60)))*bpm/(beat/4));
         }); --%>
         
      $("#stop").click(function() {
         clearInterval(play);
      });
      
   
});

</script>
</body>
</html>