<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="note1" value="B,AS,A,GS,G,FS,F,E,DS,D,CS,C" scope="application"/>
<h1>Bass</h1>
<select id="bassSelect">
    <option value="bass">bass</option>
    <option value="fuzz">fuzz</option>
</select>

<div class="volumeController">
<input type="checkbox" id="bVolume" name="mute" value="bass">
<label for="bVolume"><img  src="${contextPath}/resources/images/unmute.png"/></label>
<input type="range" name="volume" class="bass" min="0" max="10">
</div>

<div style="white-space:nowrap; overflow-y:hidden; width:80%;">
<div class="padBox" style="width: 1280">
<div class="sound C2 bass">
   	<div>C2</div>
    <c:forEach var="blength" varStatus="i" begin="1" end="64" step="1">
		<div class='pad C2 length${blength}'>
			<input type='hidden' value="">
		</div>
   	</c:forEach>
</div>

<c:forEach var="boctv" varStatus="j" begin="0" end="1">
   	<c:forEach var="bList" items="${note1}">
       <audio class="bassAudio" id="${bList}${boctv}bass" src="${contextPath }/resources/sounds/bass/${bList}${boctv}.mp3" preload="none"></audio>
    </c:forEach>
</c:forEach>
<audio class="bassAudio" id="C2bass" src="${contextPath }/resources/sounds/bass/C2.mp3"preload="none"></audio>

<c:forEach var="boctv" varStatus="j" begin="0" end="1" step="1">
<c:forEach var="bList" items="${note1}">
   <div class="sound ${bList}${1-boctv} bass">
      <div>${fn:replace(bList,'S','#')}${1-boctv}</div>
      <c:forEach var="blength" varStatus="i" begin="1" end="64" step="1">
      <div class='pad ${bList}${1-boctv} length${blength}'>
      	<input type='hidden' value="">
      </div>
      </c:forEach>
   </div>
</c:forEach>
</c:forEach>
</div>
</div>
<script>
	$(function(){
		var noteArray = '<c:out value="${note}"/>'.split(",");
		$("#bassSelect").on('change', function(){
			for(var i = 0; i <= 1; i++) {
				for(var j = 0; j < noteArray.length; j++) {
					$("#"+noteArray[j]+i+"bass").attr("src", $("#"+noteArray[j]+i+"bass").attr("src").replace("sounds/bass", "sounds/" + $(this).val()));
					$("#"+noteArray[j]+i+"bass").attr("src", $("#"+noteArray[j]+i+"bass").attr("src").replace("sounds/fuzz", "sounds/" + $(this).val()));
					
					console.log($("#"+noteArray[j]+i+"piano").attr("src"));
				}
			}
			$("#C2bass").attr("src", $("#C3bass").attr("src").replace("sounds/bass", "sounds/" + $(this).val()));
			$("#C2bass").attr("src", $("#C3bass").attr("src").replace("sounds/fuzz", "sounds/" + $(this).val()));
			
		});
		
		 
		  
		
		
	})
</script>