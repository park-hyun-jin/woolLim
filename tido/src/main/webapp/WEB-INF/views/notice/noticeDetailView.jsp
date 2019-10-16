<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
 
        <style>
        form{
            
            width: 50%;
            padding: 0 100px;
            margin: auto;
           background-color: rgb(255,255,255,0.3);
        }
		#inputAddress2{
			height: 400px;
		}
		#button{
			float : right;
		}	
		
		
 #inputCity{
  background-color: #343a40; 
  width: 100%;
        }

       strong{
       color: black;
       }
       h5{
       background-color: rgb(255,255,255,0.3);
       }
        </style>
        
       
    </head>
    <body>
   <c:import url="../common/menubar.jsp" />
    <br>
    <br>
    	<div id="bodyForm">
        <form>
        
        <h2 align="center">${ notice.nNo }</h2>
        <h5 class="card-header info-color white-text text-center py-4" id="toptoptop">
            <strong>공지사항 상세</strong>
        </h5>
            <div class="form-row">
            
              <div class="form-group col-md-6">
                <label for="inputEmail4">nickName</label>
                <div type="text" class="form-control" id="inputEmail4" >${ notice.memberName }</div>
              </div>
              <div class="form-group col-md-6">
                <label for="inputPassword4">SYSDATE</label>
                <div type="text" class="form-control" id="inputPassword4" >${notice.pnoticeCreateDate }</div>
              </div>
            </div>
            
            <div class="form-group">
              <label for="inputAddress">제목</label>
              <div type="text" class="form-control" id="inputAddress" >${ notice.pnoticeTitle }</div>
            </div>
            
            <div class="form-group" >
              <label for="inputAddress2">내용</label>
            	
              <div type="text" class="form-control" id="inputAddress2">${notice.pnoticeContent}</div>
            </div>
            
		<div class="form-row">
			<div class="form-group col-md-6">
				<c:if test="${ !empty notice.pnoticeFilePath }">
					<label for="inputCity">첨부파일</label>
					<div class="form-control" id="inputCity">
						<a
							href="${ contextPath }/resources/nuploadFiles/${ notice.pnoticeFilePath}"
							download> ${ notice.pnoticeFilePath } </a>
					</div>
				</c:if>
			</div>

			<c:url var="nupView" value="nupView.kh">
				<c:param name="nNo" value="${ notice.nNo }" />
			</c:url>
			<c:url var="ndelete" value="ndelete.kh">
				<c:param name="nNo" value="${ notice.nNo }" />
			</c:url>


			<c:if test="${ loginUser.id == 'admin@admin.com' }">
				<tr>
					<td colspan="2" align="center">
						<div class="form-group col-md-6">
							<div class="form-group text-center" id="button">
								<a href="${ ndelete }" type="submit" id="join-submit"
									class="btn btn-info"> 삭제하기<i class="fa fa-check spaceLeft"></i>
								</a> <a type="submit" class="btn btn-primary" href="${ nupView }">
									수정하기<i class="fa fa-times spaceLeft"></i>
								</a>
							</div>
						</div>
					</td>
				</tr>
			</c:if>
</div>
</form>




		</div>
		</body>
</html>