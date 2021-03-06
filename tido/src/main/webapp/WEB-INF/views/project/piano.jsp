<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
#asd{
	width:300px;
	height: 300px;
	position: fixed;
	border: 1px solid white;
	display: none;
}
</style>

<c:set var="note" value="B,AS,A,GS,G,FS,F,E,DS,D,CS,C" scope="application"/>
<h1>Piano</h1>
<select id="pianoSelect">
    <option value="piano">piano</option>
    <option value="synth">synth</option>
    <option value="choir">choir</option>
</select>

<div class="volumeController">
<input type="checkbox" id="pVolume" name="mute" value="piano">
<label for="pVolume"><img src="${contextPath}/resources/images/unmute.png"/></label>
<input type="range" name="volume" class="piano" min="0" max="10">
</div>


<div id="scrollbox" style="white-space:nowrap; overflow-y:hidden; width:80%;">
<div id="padBox" class="padBox" style="width: 1280px">
<div class="sound C3 piano">
	<div>C3</div>
	<c:forEach var="plength" varStatus="i" begin="1" end="64" step="1">
		<div class='pad C3 length${plength}'>
			<input type='hidden' value="">
		</div>
	</c:forEach>
</div>


<c:forEach  var="poctv" varStatus="j" begin="1" end="2">
	<c:forEach var="noteList" items="${note}">
	   <audio class="pianoAudio" id="${noteList}${poctv}piano" src="${contextPath }/resources/sounds/piano/${noteList}${poctv}.mp3" preload="none"></audio>
	</c:forEach>
</c:forEach>


<audio class="pianoAudio" id="C3piano" src="${contextPath }/resources/sounds/piano/C3.mp3" preload="none"></audio>

<c:forEach var="poctv" varStatus="j" begin="1" end="2">
<c:forEach var="noteList" items="${note}">
	<div class="sound ${noteList}${3-poctv} piano">
		<div>${fn:replace(noteList,'S','#')}${3-poctv}</div>
		
			<c:forEach var="plength" varStatus="i" begin="1" end="64" step="1">
				<div class='pad ${noteList}${3-poctv} length${plength}'>
					<input type='hidden' value="">
				</div>
			</c:forEach>
	</div>
</c:forEach>
</c:forEach>
</div>
</div>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script>
	$(function(){
		var noteArray = '<c:out value="${note}"/>'.split(",");
		$("#pianoSelect").on('change', function(){
			for(var i = 1; i <= 2; i++) {
				for(var j = 0; j < noteArray.length; j++) {
					$("#"+noteArray[j]+i+"piano").attr("src", $("#"+noteArray[j]+i+"piano").attr("src").replace("sounds/piano", "sounds/" + $(this).val()));
					$("#"+noteArray[j]+i+"piano").attr("src", $("#"+noteArray[j]+i+"piano").attr("src").replace("sounds/synth", "sounds/" + $(this).val()));
					$("#"+noteArray[j]+i+"piano").attr("src", $("#"+noteArray[j]+i+"piano").attr("src").replace("sounds/choir", "sounds/" + $(this).val()));
					
					console.log($("#"+noteArray[j]+i+"piano").attr("src"));
				}
			}
				$("#C3piano").attr("src", $("#C3piano").attr("src").replace("sounds/piano", "sounds/" + $(this).val()));
				$("#C3piano").attr("src", $("#C3piano").attr("src").replace("sounds/synth", "sounds/" + $(this).val()));
				$("#C3piano").attr("src", $("#C3piano").attr("src").replace("sounds/choir", "sounds/" + $(this).val()));
			
		});
		
		 
		  
		
		
	})
</script>