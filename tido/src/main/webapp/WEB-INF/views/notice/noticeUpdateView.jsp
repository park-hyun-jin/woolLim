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

        <style>
            
        #materialRegisterFormPhone{
            height: 500px;
            
        }
        form{
            
            width: 60%;
            padding: 3% ;
            margin: auto;
        }
        #file{
            width: 50%;
            float: right;
        }
      
        #browse{
       background-color: black;
        }
        
       
        </style>
    </head>
    <body>
     <c:import url="../common/menubar.jsp" />
<!-- Material form register -->
<div class="card">

        <h5 class="card-header blue-grey darken-3 white-text text-center py-4">
            <strong>공지사항 수정</strong>
        </h5>
    
        <!--Card content-->
        <div class="card-body px-lg-5 pt-0" id="cardContent">
    
            <!-- Form -->
            <form class="text-center" style="color: #757575;" action="nupdate.kh" enctype="Multipart/form-data" method="post">

				<input type="hidden" name="nNo" value="${ notice.nNo }" />
				<input type="hidden" name="pnoticeFilePath" value="${ notice.pnoticeFilePath }" />

				<div class="form-row">
                    <div class="col">
                        <!-- First -->
                        <div class="md-form">
                            <input type="text" id="materialRegisterFormFirstName" class="form-control" name="memberName" value="${ notice.memberName }" readonly="readonly">
                            <label for="materialRegisterFormFirstName"></label>
                        </div>
                    </div>
                    <div class="col">
                        <!-- Last -->
                        <div class="md-form">
                            <input type="text" id="materialRegisterFormLastName" class="form-control" name="pmemberId" value="${ notice.pmemberId }" readonly="readonly">
                            <label for="materialRegisterFormLastName"></label>
                        </div>
                    </div>
                </div>
    
                <!-- Title -->
                <div class="md-form mt-0">
                <div>
     
                    <input type="text" id="materialRegisterFormEmail" class="form-control" name="pnoticeModifyDate" value="${ notice.pnoticeModifyDate }">
                 
                    <label for="materialRegisterFormEmail"></label>
                </div>
    </div>
    <div class="md-form mt-0">
                <div>
                	
                    <input type="text" id="materialRegisterFormEmail" class="form-control" name="pnoticeTitle" value="${ notice.pnoticeTitle }">
                 
                    <label for="materialRegisterFormEmail"></label>
                </div>
    </div>
                <!-- nayoung -->
				<div class="md-form">
					<div>
						<c:set var="pnoticeContent"
							value="${fn:replace(notice.pnoticeContent,'<br>','') }" />
						<textarea type="text" id="materialRegisterFormPhone"
							class="form-control"
							aria-describedby="materialRegisterFormPhoneHelpBlock"
							name="pnoticeContent" value="${ notice.pnoticeContent }">${pnoticeContent}
                    </textarea>
					</div>
					<label for="materialRegisterFormPhone"></label> <small
						id="materialRegisterFormPhoneHelpBlock"
						class="form-text text-muted mb-4"> Optional - for two step
						authentication </small>
					<div>

					
						<div class="custom-file" id="file">
							<input type="file" class="custom-file-input" name="reloadFile">
							<%-- <c:if test="${ !empty notice.pnoticeFilePath }">
									
						<a href="${ contextPath }/resources/nuploadFiles/${ notice.pnoticeFilePath }"download>${ notice.pnoticeFilePath }</a>
							</c:if> --%>
							<label id="browse" class="custom-file-label" for="inputGroupFile01"><a href="${ contextPath }/resources/nuploadFiles/${ notice.pnoticeFilePath }"download>${ notice.pnoticeFilePath }</a></label>
						</div>
							
					</div>
				</div>
				<br> <br>

				<!-- Newsletter -->
               
    
                <!-- Sign up button -->
            



				<p align="center">
					<c:url var="updateNotice" value="nupdate.kh" />
					<c:url var="back" value="${header.referer }" />
					
					<button
						class="btn btn-outline-info btn-rounded btn-block my-4 waves-effect z-depth-0" onclick="location.href='${updateNotice}'">Aqua</button>
					<button
						class="btn btn-outline-red btn-rounded btn-block my-4 waves-effect z-depth-0" onclick="location.href='${back}'">Aqua</button>

				</p>
				<!-- Terms of service -->
                <p>By clicking
                    <em>notice up</em> you agree to our
                    <a href="" target="_blank">terms of service</a>
    
            </form>
            <!-- Form -->
 
        </div>
    
    </div>
    <!-- Material form register -->
    </body>
</html>