<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="chord" value="C,Cm,CS,CSm,D,Dm,EF,EFm,E,Em,F,Fm,FS,FSm,G,Gm,GS,GSm,A,Am,BF,BFm,B,Bm" scope="request"/>


<h1>Guitar</h1>
<input type="checkbox" name="mute" value="guitar">
<input type="range" name="volume" class="guitar" min="0" max="10">

<c:forEach var="cList" items="${chord}" >
	
	<div class="sound ${cList} guitar">
		<div>${cList}</div>
		<c:forEach var="glength" varStatus="i" begin="1" end="32" step="1">
			<div class='pad ${cList} length${glength}'>
				<input type='hidden' value="">
			</div>
		</c:forEach>
		<!--  -->
	</div>

</c:forEach>




