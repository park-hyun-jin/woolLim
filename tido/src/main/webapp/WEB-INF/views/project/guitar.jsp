<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String[] chord ={"C","Cm", "CS","CSm","D", "Dm", "EF", "EFm","E","Em","F", "Fm", "FS","FSm", "G", "Gm","GS","GSm","A","Am","BF","BFm","B","Bm"}; %>



   <h2>Guitar <input type="checkbox" name="mute" value="guitar"></h2>
		<%for(int j=0; j<24; j++) {%>
		
		   <div class="sound <%=chord[j]%> guitar">
		      <div><%=chord[j]%></div>
		      <%for (int i = 1; i <= 32; i++) {%>
		      <div class='pad <%=chord[j]%> length<%=i%>'><input type='hidden' value=""></div>
		      <%}%>
		   </div>
		   
	   <%} %>
	   
	
   
  
 