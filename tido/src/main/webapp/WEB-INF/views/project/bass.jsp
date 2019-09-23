<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <h1>Bass <input type="checkbox" name="mute" value="bass"></h1>

<% String note1[] = {"C", "CS", "D", "DS", "E", "F", "FS", "G", "GS", "A", "AS","B"}; %>

   <% for(int j = 0; j <= 1; j++) {%>
   	<% for(int k = 0; k < 12; k++) {%>
      <div class="sound <%=note1[k]%><%= j %> bass">
         <div><%=note1[k]%><%= j %></div>
         <% for (int i = 1; i <= 32; i++) { %>
         <div class='pad <%=note1[k]%><%= j %> length<%=i%>'>
         	<input type='hidden' value="">
         </div>
         <% } %>
      </div>
	<% } %>
   <% } %>
   
   

   <div class="sound C2 bass">
      <div>C2</div>
      <%for (int i = 1; i <= 32; i++) {%>
      <div class='pad C2 length<%=i%>'>
         <input type='hidden' value="">
      </div>
      <%}%>
   </div>


 
   
   
   
   