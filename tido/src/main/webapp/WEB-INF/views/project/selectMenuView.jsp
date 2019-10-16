<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="styleSheet" href="${contextPath }/resources/css/project/selectMenuView-style.css" > 
</head>
<body>
   <jsp:include page="../common/menubar.jsp"/>
   <section>
	   <div>
	      <div class="area area1" onclick="location.href='newProject.kh'">
	         <div>
	            <img src="${contextPath }/resources/images/new-project.png">
	            <div >작곡하러가기</div>
	         </div>
	      </div>
	      <div class="area area2" onclick="location.href='projectListView.kh'">
	         <div>
	            <img src="${contextPath }/resources/images/open-project.png">
	            <div >내 프로젝트</div>
	         </div>
	      </div>
	      <div class="area area3" onclick="location.href='pjtBoardListView.kh'">
	      	 <div>
	            <img src="${contextPath }/resources/images/share-music.png">
	            <div >공유게시판</div>
	         </div>
	      </div>
	   </div>
   </section>
   <jsp:include page="../common/footer.jsp"/>
   
   <c:if test="${loginUser==null }">   
      <script>
      
      $(function(){
         $(".area2").on("mouseenter",function(){
            $(this).children().children().eq(0).hide();
            $(this).children().children().eq(1).text("로그인 해주세요").css("line-height","128px");
 		     $(".area2").attr("onclick","");
         }).on("mouseleave",function(){
            $(this).children().children().eq(0).show();
            $(this).children().children().eq(1).text("내 프로젝트").css("line-height","");;
         });
         
      });
      </script>
   </c:if>   
 
</body>
</html>
