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
		position:relative;
	}
	.visitor-div{
		top:10%;
		position:absolute;
		right:0;
		left:0;
		margin:auto;
		width:1200px;
		height:200px;
		border:1px solid white;
		padding: 30px 0;
		background-color: #E0ECF8;
	}
	.quantity{
		width:100%;
		border:1px solid red;
		height:100%;
	}
	.visitor{
		width:25%;
		height:100%;
		float:left;
		text-align:center;
		font-size:42px;
		color:black;
		border:1px solid blue;
	}
	.counter{
		padding:10px;
		width:100%;
		height:100%;
	}
</style>
</head>
<body>
	<jsp:include page="common/menubar.jsp"/>
	<section>
		<div class="visitor-div">
			<div class="quantity">			
				<div class="visitor">
					<div class="counter">
						<span>count</span>
						<br>
						<h4>전체 프로젝트 수</h4>
					</div>
				</div>
				<div class="visitor">
					<div class="counter">
						<span>count</span>
						<br>
						<h4>전체 프로젝트 수</h4>
					</div>
				</div>
				<div class="visitor">
					<div class="counter">
						<span>count</span>
						<br>
						<h4>전체 프로젝트 수</h4>
					</div>
				</div>
				<div class="visitor">
					<div class="counter">
						<span class="total"></span>
						<br>
						<h4>전체 방문자 수</h4>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="common/footer.jsp"/>
	<script>
		$(function(){
			$.ajax({
				url : "visitor.kh",
				type : "POST",
				success : function(result){
					console.log(result);
					$(".total").text(result);
				}
			});
		});
	</script>
</body>
</html>