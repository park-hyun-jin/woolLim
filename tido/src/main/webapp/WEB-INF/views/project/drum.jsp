<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%String drum[] = {"hihat","openhat","snare","kick","crash","ride","hightom","middletom","floortom"}; %>
   <h2>Drum <input type="checkbox" name="mute" value="drum"></h2>
		
   <%for(int j=0; j<drum.length; j++){ %>	
	   <div class="sound <%=drum[j]%> drum">
	      <div><%=drum[j]%></div>
	      <%for (int i = 1; i <= 32; i++) {%>
	      <div class='pad <%=drum[j]%>drum length<%=i%>'>
	      <input type='hidden' value="">
	      </div>
	      <%}%>
	   </div>
   <%}%>

   
 