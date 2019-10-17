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
		background-color: rgba( 255, 255, 255, 0.5 );
	}
	.quantity{
		width:100%;
		height:100%;
	}
	.visitor{
		width:25%;
		height:100%;
		float:left;
		text-align:center;
		font-size:42px;
		color:black;
		border:1px solid black;
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
						<span class="memberCountCon1">${sc.projectCount }</span>
						<br>
						<h4>전체 프로젝트 수</h4>
					</div>
				</div>
				<div class="visitor">
					<div class="counter">
						<span class="memberCountCon2">${sc.boardCount }</span>
						<br>
						<h4>전체 게시글 수</h4>
					</div>
				</div>
				<div class="visitor">
					<div class="counter">
						<span class="memberCountCon3">${sc.memberCount }</span>
						<br>
						<h4>전체 회원 수</h4>
					</div>
				</div>
				<div class="visitor">
					<div class="counter">
						<span class="memberCountCon4">${sc.visitCount }</span>
						<br>
						<h4>전체 방문자 수</h4>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="common/footer.jsp"/>
	<script>
	var memberCountConTxt1= ${sc.projectCount};
	var memberCountConTxt2= ${sc.boardCount};
	var memberCountConTxt3= ${sc.memberCount};
	var memberCountConTxt4= ${sc.visitCount};
	  
	  $({ val : 0 }).animate({ val : memberCountConTxt1 }, {
	   duration: 2000,
	  step: function() {
	    var num = numberWithCommas(Math.floor(this.val));
	    $(".memberCountCon1").text(num);
	  },
	  complete: function() {
	    var num = numberWithCommas(Math.floor(this.val));
	    $(".memberCountCon1").text(num);
	  }
	});
	  
	  $({ val : 0 }).animate({ val : memberCountConTxt2 }, {
		   duration: 2000,
		  step: function() {
		    var num = numberWithCommas(Math.floor(this.val));
		    $(".memberCountCon2").text(num);
		  },
		  complete: function() {
		    var num = numberWithCommas(Math.floor(this.val));
		    $(".memberCountCon2").text(num);
		  }
		});
	  
	  $({ val : 0 }).animate({ val : memberCountConTxt3 }, {
		   duration: 2000,
		  step: function() {
		    var num = numberWithCommas(Math.floor(this.val));
		    $(".memberCountCon3").text(num);
		  },
		  complete: function() {
		    var num = numberWithCommas(Math.floor(this.val));
		    $(".memberCountCon3").text(num);
		  }
		});
	  
	  $({ val : 0 }).animate({ val : memberCountConTxt4 }, {
		   duration: 2000,
		  step: function() {
		    var num = numberWithCommas(Math.floor(this.val));
		    $(".memberCountCon4").text(num);
		  },
		  complete: function() {
		    var num = numberWithCommas(Math.floor(this.val));
		    $(".memberCountCon4").text(num);
		  }
		});

	function numberWithCommas(x) {
	    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	</script>
</body>
</html>