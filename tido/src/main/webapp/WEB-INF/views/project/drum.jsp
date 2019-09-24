<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="drum">hihat,openhat,snare,kick,crash,ride,hightom,middletom,floortom</c:set>
<h2>
	Drum <input type="checkbox" name="mute" value="drum">
</h2>

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


