<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<style>
.text-center{
color:black;}
#form67{
height: 300px;
</style>

 <!-- Central Modal Medium Danger -->


<div class="modal fade" id="centralModalDanger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
aria-hidden="true">
<div class="modal-dialog modal-notify modal-danger" role="document">
  <!--Content-->
  <div class="modal-content">
    <!--Header-->
    <div class="modal-header">
      <p class="heading lead">게시글 신고하기</p>

      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true" class="white-text">&times;</span>
      </button>
    </div>

    <!--Body-->
				<div class="modal-body">
					<div class="text-center">
						<i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
						<input type="hidden" id="contentsNo">
						<input type="hidden" id="reportType">
						<br>
					<input type="radio" id="shit" name="rRrNo" value="1"/><label for="shit">욕설 및 비방</label><br>
					<input type="radio" id="honor" name="rRrNo" value="2"/><label for="honor">명예훼손 / 사생활 침해</label><br>
					<input type="radio" id="advertise" name="rRrNo" value="3"/><label for="advertise">부적절한 홍보 게시글</label><br>
					<input type="radio" id="copy" name="rRrNo" value="4"/><label for="copy">저작권침해</label><br>
					<input type="radio" id="polite" name="rRrNo" value="5"/><label for=""polite"">무분별한 정치적 발언</label><br>
					<input type="radio" id="code" name="rRrNo" value="6"/><label for="code">악성코드</label><br>
					<input type="radio" id="overlap" name="rRrNo" value="7"/><label for="overlap">중복된 글 연속 삽입</label><br>
					
					</div>
				</div>
				<div class="md-form form-sm" id="message">
					<i class="fas fa-pencil-alt prefix"></i>
					<textarea type="text" id="form67" class="md-textarea mb-0" name="rReportContent"></textarea>
					
					<label for="form67">Your message</label>
				</div>

				<!--Footer-->
	    <div class="modal-footer justify-content-center">
	      <a id="reportBtn" type="button" class="btn btn-danger">신고하기 <i class="far fa-gem ml-1 text-white"></i></a>
	      <a type="reset" class="btn btn-outline-danger waves-effect" data-dismiss="modal">취소</a>
	    </div>
  </div>
  <!--/.Content-->
</div>
</div>

<script>
	


	$("#reportBtn").on("click",function(){
		$.ajax({
			url:"insertReport.kh",
			type:"post",
			data:{rContentsNo:Number($("#contentsNo").val()),
				 rRrno:$("input[type='radio']:checked").val(),
				 rReportContent:$("#form67").val(),
				 rReportType:Number($("#reportType").val())
			},
			success:function(result){
				console.log(result);
			}
			
		});
	});

</script>

