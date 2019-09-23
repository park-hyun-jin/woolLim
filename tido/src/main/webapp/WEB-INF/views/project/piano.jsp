<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% String note[] = {"C", "CS", "D", "DS", "E", "F", "FS", "G", "GS", "A", "AS","B"}; %>
<h1>Piano <input type="checkbox" name="mute" value="piano"></h1>


   <% for(int j = 1; j <= 2; j++) {%>
   	<% for(int k = 0; k < 12; k++) {%>
      <div class="sound <%=note[k]%><%= j %> piano">
         <div><%=note[k]%><%= j %></div>
         <% for (int i = 1; i <= 32; i++) { %>
         <div class='pad <%=note[k]%><%= j %> length<%=i%>'>
         	<input type='hidden' value="">
         </div>
         <% } %>
      </div>
	<% } %>
   <% } %>

   <div class="sound C3 piano">
      <div>C3</div>
      <%for (int i = 1; i <= 32; i++) {%>
      <div class='pad C3 length<%=i%>'>
         <input type='hidden' value="">
      </div>
      <%}%>
   </div>
   
  

   