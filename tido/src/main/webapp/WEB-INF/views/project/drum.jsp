<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="drum" value="hihat,openhat,snare,kick,crash,ride,hightom,middletom,floortom" scope="request"/>
<h1>Drum</h1>
<div class="volumeController">
<input type="checkbox" id="dVolume" name="mute" value="drum">
<label for="dVolume"><img  src="${contextPath}/resources/images/unmute.png"/></label>
<input type="range" name="volume" class="drum" min="0" max="10">
</div>
<c:forEach var="dList" items="${drum}">
	<div class="sound ${dList } drum">
		<div>${dList }</div>
		<c:forEach var="dlength" varStatus="i" begin="1" end="32" step="1">
			<div class='pad ${dList} length${dlength}'>
				<input type='hidden' value="">
			</div>
		</c:forEach>
		<!--  -->
	</div>
</c:forEach>


