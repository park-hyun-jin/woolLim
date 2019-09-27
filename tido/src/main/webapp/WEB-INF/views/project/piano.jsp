<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="note" value="B,AS,A,GS,G,FS,F,E,DS,D,CS,C" scope="request"/>
<h1>Piano</h1>
<div class="volumeController">
<input type="checkbox" id="pVolume" name="mute" value="piano">
<label for="pVolume"><img src="${contextPath}/resources/images/unmute.png"/></label>
<input type="range" name="volume" class="piano" min="0" max="10">
</div>

<div class="sound C3 piano">
	<div>C3</div>
	<c:forEach var="plength" varStatus="i" begin="1" end="32" step="1">
		<div class='pad C3 length${plength}'>
			<input type='hidden' value="">
		</div>
	</c:forEach>
	<!--  -->
</div>

<c:forEach var="poctv" varStatus="j" begin="1" end="2">
	<c:forEach var="noteList" items="${note}">
		<div class="sound ${noteList}${3-poctv} piano">
			<div>${noteList}${3-poctv}</div>
			<c:forEach var="plength" varStatus="i" begin="1" end="32" step="1">
				<div class='pad ${noteList}${3-poctv} length${plength}'>
					<input type='hidden' value="">
				</div>
			</c:forEach>
		</div>
	</c:forEach>
</c:forEach>




