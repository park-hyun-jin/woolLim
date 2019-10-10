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

        body {
            width: 1200px;
            height: 1000px;
            margin: auto;
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
        
        #inputEmail {
            cursor: pointer;
        }

        .insertTable {
        	width: 100%;
        }

        .insertTable tr {
            height: 80px;
        }

        .insertInput {
            width: 400px;
            padding: .375rem .75rem;
            border-radius: .25rem .25rem;
            border: 1px solid darkgray;
            margin-left: 20px;
        }

    </style>
    <body>
        <div class="titleArea">
            <h1>회원가입</h1>
        </div>
        <form action="minsert.kh" method="POST" class="joinForm" enctype="Multipart/form-data">
            <div id="profileArea">
                <img id="profileImg">
                <h5>프로필 사진</h5>
            </div>
            <input type="file" id="uploadFile" name="uploadFile" multiple="multiple" onchange="loadImg(this,1);">
            <table class="insertTable">
                    <tr>
                        <td>
                            <label for="inputEmail" >이메일 *</label>
                        </td>
                        <td>
                        	<c:if test="${empty emailMsg}">
                        		<input type="email" class="insertInput" id="inputEmail" placeholder="Email" name="id" value="${memberId}" readonly required>
                        	</c:if>
                        	<c:if test="${!empty emailMsg}">
                            	<input type="email" class="insertInput" id="inputEmail" placeholder="Email" name="id" readonly required>
                            	<script>alert("${emailMsg}")</script>
                        	</c:if>
                        </td>
                        <td>
                        	<c:choose>
                        		<c:when test="${empty emailMsg && !empty memberId}">
                        			<h6 id="emailText" style="color:green">이메일이 인증되었습니다.</h6>
                        		</c:when>
                        		<c:when test="${!empty emailMsg && empty memberId}">
                        			<h6 id="emailText" style="color:red">이메일이 인증되지 않았습니다. 다시 인증해주세요</h6>
                        		</c:when>
                        		<c:otherwise>
                        			<h6 id="emailText" style="color:red">이메일을 인증해주세요.</h6>
                        		</c:otherwise>
                        	</c:choose>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="inputPassword">비밀번호 *</label>
                        </td>
                        <td>
                            <input type="password" class="insertInput" id="inputPassword" placeholder="Password" name="pwd" required>
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
                            <input type="password" class="insertInput" id="inputPasswordConfirm" placeholder="Password Confirm" required>
                        </td>
                        <td>
                            <h6 id="pwdConfirmText"></h6>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label for="inputNickName">닉네임 *</label>
                        </td>
                        <td>
                            <input type="text" class="insertInput" id="inputNickName" placeholder="nickname" name="name" required>
                        </td>
                        <td>
                            <h6 id="nickNameText"></h6>
                        </td>
                    </tr>
                </table>
            <br>
            <div>
                <ul class="join_ul">
                    <li><button type="submit" class="btn btn-success" onclick="return insertBtn();">가입하기</button></li>
                    <li><button type="button" class="btn btn-secondary" onclick="history.back();">취소하기</button></a></li>
                </ul>
            </div>
        </form>
        
        
		<script>
		var emailVal = $("#inputEmail").val();
		var pwdCheck = false;
		var pwdConfirmCheck = false;
		var nickNameCheck = false;
		
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
			
			// 닉네임 검사
			$("#inputNickName").on("input", function(){
				var nameVal = $(this).val();
				var regExp = /^[A-z0-9가-힣]{2,10}$/;
				$.ajax({
					url : "nameCheck.kh",
					type : "post",
					data : { name : nameVal },
					success : function(check) {
						if(check == "fail") {
							if(regExp.test(nameVal)) {
								$("#nickNameText").text("사용 가능한 닉네임입니다.").css("color", "green");
								nickNameCheck = true;
							}else {
								$("#nickNameText").text("한글,영문,숫자 포함 최소 2글자 최대 10글자만 가능합니다.").css("color", "red");
								nickNameCheck = false;
							}
						}else {
							$("#nickNameText").text("이미 사용중인 닉네임입니다.").css("color", "red");
							nickNameCheck = false;
						}
					},
					error : function(e) {
						console.log("통신실패");
					}
				});
			});
			
			// 이메일 input을 클릭했을 때 인증메세지를 보낼 수 있는 창이 열린다
			$("#inputEmail").click(function(){
	            if($(this).val() == "") {
	                window.open("emailRegistPage.kh", "이메일 입력창", "width=500px, height=200px, left=700, top=400");
	            }else {
	            	if(confirm("이메일을 다시 입력하시겠습니까?")) {
	            		window.open("emailRegistPage.kh", "이메일 입력창", "width=500px, height=200px, left=700, top=400");
	            	}
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
		function insertBtn() {
			var pwd = $("#inputPassword");
	        var pwdConfirm = $("#inputPasswordConfirm");
	        var nickName = $("#inputNickName");
			
	        if(pwdCheck == false) {
	        	alert("비밀번호를 다시 입력해주세요");
	        	pwd.focus();
	        	return false;
	        }else if(pwdConfirmCheck == false) {
	        	alert("비밀번호 확인란을 확인해주세요");
	        	pwdConfirm.focus();
	        	return false;
	        }else if(nickNameCheck == false) {
	        	alert("닉네임을 확인해주세요.");
	        	nickName.focus();
	        	return false;
	        }
        }
		
		</script>
    </body>
</html>