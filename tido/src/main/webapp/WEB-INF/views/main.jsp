<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	section{
		
		width:1500px;
		height:600px;
		margin:100px auto;
	}
	
</style>
</head>
<body>
	<jsp:include page="common/menubar.jsp"/>
	<section>
	
	</section>
	<jsp:include page="common/footer.jsp"/>
	<script>
		$(function(){
			$.ajax({
				url : "temp.kh",
				type : "POST",
				success : function(result){
					console.log(result);
				}
			});
		});
	</script>
</body>
</html>