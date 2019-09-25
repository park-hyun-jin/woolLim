<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="note1" value="C,CS,D,DS,E,F,FS,G,GS,A,AS,B" scope="request"/>
<h1>Bass <input type="checkbox" name="mute" value="bass"></h1>

   <c:forEach var="boctv" varStatus="j" begin="0" end="1" step="1">
   <c:forEach var="bList" items="${note1}">
      <div class="sound ${bList}${boctv} bass">
         <div>${bList}${boctv}</div>
         <c:forEach var="blength" varStatus="i" begin="1" end="32" step="1">
         <div class='pad ${bList}${boctv} length${blength}'>
         	<input type='hidden' value="">
         </div>
         </c:forEach>
      </div>
	</c:forEach>
   </c:forEach>
   
   

   <div class="sound C2 bass">
      <div>C2</div>
       <c:forEach var="blength" varStatus="i" begin="1" end="32" step="1">
      <div class='pad C2 length${blength}'>
         <input type='hidden' value="">
      </div>
      </c:forEach>
      <!--  -->
   </div>