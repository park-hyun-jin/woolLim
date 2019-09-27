<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="note1" value="B,AS,A,GS,G,FS,F,E,DS,D,CS,C" scope="request"/>
<h1>Bass</h1>
<input type="checkbox" id="bVolume" name="mute" value="bass">
<label for="bVolume"><img  src="${contextPath}/resources/images/unmute.png"/></label>
<input type="range" name="volume" class="bass" min="0" max="10">
   
<div class="sound C2 bass">
   <div>C2</div>
    <c:forEach var="blength" varStatus="i" begin="1" end="32" step="1">
   <div class='pad C2 length${blength}'>
      <input type='hidden' value="">
   </div>
   </c:forEach>
   <!--  -->
</div>

<c:forEach var="boctv" varStatus="j" begin="0" end="1" step="1">
<c:forEach var="bList" items="${note1}">
   <div class="sound ${bList}${1-boctv} bass">
      <div>${bList}${1-boctv}</div>
      <c:forEach var="blength" varStatus="i" begin="1" end="32" step="1">
      <div class='pad ${bList}${1-boctv} length${blength}'>
      	<input type='hidden' value="">
      </div>
      </c:forEach>
   </div>
</c:forEach>
</c:forEach>
   
   
