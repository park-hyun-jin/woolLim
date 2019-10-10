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

 <!-- Central Modal Medium Danger -->
  <button type="button" class="btn btn-outline-danger waves-effect" data-toggle="modal" data-target="#centralModalDanger">Danger</button>

<div class="modal fade" id="centralModalDanger" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
aria-hidden="true">
<div class="modal-dialog modal-notify modal-danger" role="document">
  <!--Content-->
  <div class="modal-content">
    <!--Header-->
    <div class="modal-header">
      <p class="heading lead">Modal Danger</p>

      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true" class="white-text">&times;</span>
      </button>
    </div>

    <!--Body-->
    <form action="report.kh" method="post">
    <div class="modal-body">
      <div class="text-center">
        <i class="fas fa-check fa-4x mb-3 animated rotateIn"></i>
        <p>${board.cBoardNo}</p>
      </div>
    </div>

    <!--Footer-->
    <div class="modal-footer justify-content-center">
      <a type="button" class="btn btn-danger">Get it now <i class="far fa-gem ml-1 text-white"></i></a>
      <a type="button" class="btn btn-outline-danger waves-effect" data-dismiss="modal">No, thanks</a>
    </div>
    </form>
  </div>
  <!--/.Content-->
</div>
</div>