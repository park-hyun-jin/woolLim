<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   
   *{
      box-sizing: border-box;
   }
   section{
      width:95%;
      height:600px;
      margin:100px auto;
   }
    section>div{
    	margin: auto;
    	width:80%;
    	height: 100%;
    }
   section>div>div{
      width:30%;
      height: 500px;
      float: left;
      margin:1.5%;
      background:rgba(255,255,255,0.8);
   }
   section>div>div:hover{
      -webkit-filter: invert(100%);
         filter: invert(100%);
         cursor: pointer;
   }
   section>div>div>div{
      text-align: center;
      font-weight:bolder;
      font-size:20px;
      width:100%;
      height:128px;
      margin-top: 150px;
   }

    @media ( max-width: 768px ) {
	    section{
	      width:100%;
	      height:600px;
	   }
      section>div>div{
	      width:400px;
	      height: 30%;
	      float: none;
	      margin-bottom:10px;
  	 }
  	 section>div>div>div{
      text-align: center;
      font-weight:bolder;
      font-size:20px;
      width:100%;
      height:50%;
      margin-top:10px;
  	 }
   }
</style>
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
	      <div class="area area3"></div>
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