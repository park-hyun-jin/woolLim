<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
        <title></title>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <style>
    
    	.container {
            width: 800px;
            height: auto;
    		background-color: rgba( 255, 255, 255, 0.5 );
        }

        .joinForm {
            width: 850px;
            height: 900px;
            margin: 5% auto;
            font-size: 20px;
        }

        .join_ul {
            text-align: center;
            padding: 0;
        }

        .join_ul li {
            display: inline-block;
            margin: 5px;
        }

        a {
            text-decoration: none;
        }

        .join_ul button {
            width: 100px;
            height: 40px;
            margin-left: 20px;
            margin-right: 20px;
        }

        .titleArea h1 {
            text-align: center;
            color: gray;
            margin-top: 5%;
        }

        #profileArea {
            width: 250px;
            height: 300px;
            margin: auto;
            margin-bottom: 5%;
        }

        #profileArea h5 {
            margin-top: 10px;
            text-align: center;
        }

        #profileImg {
            width: 250px;
            height: 250px;
        }

        #profileArea:hover {
            cursor: pointer;
        }

        #uploadFile {
            width: min-content;
            margin-bottom: 5%;
            margin-left: 30%;
        }

        .updateTable {
        	width: 100%;
        }

        .updateTable tr {
            height: 80px;
        }

        .updateInput {
            width: 400px;
            padding: .375rem .75rem;
            border-radius: .25rem .25rem;
            border: 1px solid darkgray;
            margin-left: 20px;
        }
        
        .updateTable td:nth-child(3) {
        	width: 200px;
        }

    </style>
    <body>
    	<jsp:include page="../common/menubar.jsp"></jsp:include>
    	
    	<div class="container">
	    	<div class="titleArea">
	            <h1>정보수정</h1>
	        </div>
	        
	        <form action="mupdate.kh" method="POST" class="joinForm" enctype="Multipart/form-data">
	            <div id="profileArea">
	                <img src="${contextPath}/resources/muploadFiles/${loginUser.id}/${loginUser.imagePath}" id="profileImg"
	                onerror="this.src='${contextPath}/resources/images/noimage.png'">
	                <h5>프로필 사진</h5>
	            </div>
	            <input type="file" id="uploadFile" name="uploadFile" multiple="multiple" onchange="loadImg(this,1);">
	            <table class="updateTable">
	                    <tr>
	                        <td>
	                            <label for="inputEmail" >이메일 </label>
	                        </td>
	                        <td>
	                        	<input type="email" class="updateInput" id="inputEmail" placeholder="Email" name="id" value="${loginUser.id}" readonly>
	                        </td>
	                        <td>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <label for="inputPassword">비밀번호 *</label>
	                        </td>
	                        <td>
	                            <input type="password" class="updateInput" id="inputPassword" placeholder="Password" name="pwd" required>
	                        </td>
	                        <td>
	                            <h6 id="pwdText"></h6>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <label for="inputPasswordConfirm">비밀번호 확인 *</label>
	                        </td>
	                        <td>
	                            <input type="password" class="updateInput" id="inputPasswordConfirm" placeholder="Password Confirm" required>
	                        </td>
	                        <td>
	                            <h6 id="pwdConfirmText"></h6>
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            <label for="inputNickName">닉네임 </label>
	                        </td>
	                        <td>
	                            <input type="text" class="updateInput" id="inputNickName" placeholder="nickname" name="name" value="${loginUser.name}" readonly>
	                        </td>
	                        <td>
	                            <h6 id="nickNameText"></h6>
	                        </td>
	                    </tr>
	                </table>
	            <br>
	            <div>
	                <ul class="join_ul">
	                    <li><button type="submit" class="btn btn-success" onclick="return updateBtn();">수정하기</button></li>
	                    <li><button type="button" class="btn btn-secondary" onclick="history.back();">취소하기</button></a></li>
	                </ul>
	            </div>
	        </form>
    	</div>
        
        
        
		<script>
		var pwdCheck = false;
		var pwdConfirmCheck = false;
		
		$(function(){
	        
			// 업로드 버튼 숨김
			$("#uploadFile").hide();
			
			// 이미지 영역 클릭 시 파일 업로드 버튼 동작
			
			$("#profileArea").click(function(){
				$("#uploadFile").click();
			});
	        
			
			
			// 패스워드가 일치하는지 검사
			$("#inputPassword").on("input", function(){
				var check = /^[A-Za-z0-9]{6,18}$/;
				if(check.test($(this).val())) {
					$("#pwdText").text("사용가능한 비밀번호 입니다.").css("color", "green");
					pwdCheck = true;
				}else {
					$("#pwdText").text("영문,숫자 포함 최소 6글자, 최대 18글자만 가능합니다.").css("color", "red");
					pwdCheck = false;
				}
			});
			
			// 패스워드 확인 검사
			$("#inputPasswordConfirm").on("input", function(){
				var pwdVal = $("#inputPassword").val();
				if($(this).val() == pwdVal) {
					$("#pwdConfirmText").text("비밀번호가 일치합니다.").css("color", "green");
					pwdConfirmCheck = true;
				}else {
					$("#pwdConfirmText").text("비밀번호가 일치하지 않습니다.").css("color", "red");
					pwdConfirmCheck = false;
				}
			});
			
		});
		
		function loadImg(value, num) {
			var reader = new FileReader();
			
			// reader.onload : reader 객체가 생성된 경우 이벤트 발생
			reader.onload = function(e){
				$("#profileImg").attr("src", e.target.result); // e.target -> this랑 같은것(위에 있는 input:type:File), 해당 파일의 이름이 나온다
			}
	
	           console.log(value.files[0].name);
			
			// 보안처리(Data URL)
			// RFC 2397 정의되어 있는 개발 규약
			// ex) jspProject/Webcontent/uploadImages~~~
			// 파일의 직접적인 경로 노출 방지
			reader.readAsDataURL(value.files[0]);
			// ex) data:img/jpg:base64/
		}
		
		
		// 가입하기 눌렀을 때 처리
		function updateBtn() {
			var pwd = $("#inputPassword");
	        var pwdConfirm = $("#inputPasswordConfirm");
	        
	        if(pwdCheck == false) {
	        	alert("비밀번호를 다시 입력해주세요");
	        	pwd.focus();
	        	return false;
	        }else if(pwdConfirmCheck == false) {
	        	alert("비밀번호 확인란을 확인해주세요");
	        	pwdConfirm.focus();
	        	return false;
	        }
        }
		
		</script>
    </body>
</html>