<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
        <title></title>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/css/mdb.min.css" rel="stylesheet">
        <!-- JQuery -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.8.10/js/mdb.min.js"></script>
        
    </head>
<style>
#topRow {
	width: 60%;
	margin: auto;
}

#Send {
	float: right;
}
#customFile{
	background-color: gray;
}
#iinn{
	background-color: rgb(255,255,255,0.5);
	
	width:60%;
	margin: auto;
	
	}
	input{
	color: black;
	}
	#inputGroupFile01{
	background-color: #343a40; 
	
	}
</style>
<body>
	<c:import url="../common/menubar.jsp" />
	<!--Section: Contact v.2-->
	<section class="mb-4">

		<div id="iinn">
		<!--Section heading-->
		<h2 class="h1-responsive font-weight-bold text-center my-4">Detail
			QNA</h2>
		<!--Section description-->
		<p class="text-center w-responsive mx-auto mb-5">Do you have any
			questions? Please do not hesitate to contact us directly. Our team
			will come back to you within a matter of hours to help you.</p>

		<div class="row" id="topRow">
			
			<!--Grid column-->
			<div class="col-md-9 mb-md-0 mb-5">
				<form id="contact-form" name="contact-form" action="mail.php"
					method="POST">

					<!--Grid row-->
					<div class="row">


<!--Grid column-->
						<div class="col-md-6">
							<div class="md-form mb-0">
								<input type="text" id="email" name="memberName" class="form-control" value="${ inquiry.memberName }" readonly>
								<label for="email" class=""></label>
							</div>
						</div>
						<!--Grid column-->





						<!--Grid column-->
						<div class="col-md-6">
							<div class="md-form mb-0">
								<input type="text" id="name" name="" class="form-control" value="${ inquiry.iInquiryDate }" readonly>
								<label for="name" class=""></label>
							</div>
						</div>
						<!--Grid column-->

						
						<!--Grid column-->

					</div>
	
					
					<!--Grid row-->


					<div class="row">
						<div class="col-md-12">
							<div class="md-form mb-0">
							<
								<input type="text" id="subject" name="iInquiryDate" class="form-control" value="${ inquiry.iInquiryTitle }"  readonly>
								<label for="subject" class=""></label>
							</div>
						</div>
					</div>



					<!--Grid row-->
					<div class="row">

						<!--Grid column-->
						<div class="col-md-12">

							<div class="md-form">
							<c:set var="bContent" value="${fn:replace(inquiry.iInquiryContent,'<br>','') }"/>
								<textarea type="text" id="message" name="iInquiryContent" rows="2" 
									class="form-control md-textarea" readonly>${ bContent } </textarea>
								<label for="message"></label>
							</div>

						</div>
					</div>

					<div class="custom-file" >
						<input type="file" class="custom-file-input" id="inputGroupFile01"
							aria-describedby="inputGroupFileAddon01" name="uploadFile" >
						<label class="custom-file-label" for="inputGroupFile01" id="customFile">
						<c:if test="${ !empty inquiry.iInquiryOriginFilename }">
					<a href="${ contextPath }/resources/iuploadFiles/${ inquiry.iInquiryChangeFilename }" download>${ inquiry.iInquiryOriginFilename }</a>
				</c:if>

						</label>
					</div>
					<!--Grid row-->

				</form>
		<br>

				<c:url var="iupView" value="iupView.kh">
					<c:param name="iNo" value="${ inquiry.iNo }" />
				</c:url>
				

				<c:if test="${ loginUser.id eq inquiry.iInquiryId	 }">
				
				<div class="text-center text-md-left" id="Send">
                    <a class="btn btn-primary" onclick="location.href='iList.kh';">list</a>     
                </div>
                
                <div class="text-center text-md-left" id="Send">
                        <a class="btn btn-primary" href="${ iupView }">수정하기</a>
                    </div>
				
				</c:if>
				
				
				
				
				
				
		
				
				
			</div> 
			<!--Grid column-->

			<!--Grid column-->
			<div class="col-md-3 text-center">
				<ul class="list-unstyled mb-0">
					<li><i class="fas fa-map-marker-alt fa-2x"></i>
						<p>San Francisco, CA 94126, USA</p></li>

					<li><i class="fas fa-phone mt-4 fa-2x"></i>
						<p>+ 01 234 567 89</p></li>

					<li><i class="fas fa-envelope mt-4 fa-2x"></i>
						<p>admin@admin.com</p></li>
				</ul>
			</div>
			<!--Grid column-->

		</div>

</div>
	</section>
	<!--Section: Contact v.2-->
</body>
</html>