<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            height: 900px;
            margin: auto;
        }

        .joinForm {
            width: 650px;
            height: 600px;
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

        #inputImg {
            width: min-content;
            margin-bottom: 5%;
            margin-left: 30%;
        }

    </style>
    <body>
        <div class="titleArea">
            <h1>회원가입</h1>
        </div>
        <!--이미지 업로드용 버튼  -->
        <form action="minsert.kh" method="POST" class="joinForm">
            <div id="profileArea">
                <img id="profileImg">
                <h5>프로필 사진</h5>
            </div>
            <input type="file" id="inputImg" name="inputImg" multiple="multiple" onchange="loadImg(this,1);">
            <div class="form-group row">
                <label for="inputEmail" class="col-sm-2 col-form-label">이메일 *</label>
                <div class="col-sm-10">
                <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="id" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label">비밀번호 *</label>
                <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="pwd" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPasswordConfirm" class="col-sm-2 col-form-label">비밀번호 확인 *</label>
                <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPasswordConfirm" placeholder="Password Confirm" required>
                </div>
            </div>
            <div class="form-group row">
                <label for="inputNickname" class="col-sm-2 col-form-label">닉네임 *</label>
                <div class="col-sm-10">
                <input type="text" class="form-control" id="inputNickname" placeholder="nickname" name="name" required>
                </div>
            </div>
            <br>
            <div>
                <ul class="join_ul">
                    <li><button type="submit" class="btn btn-success">가입하기</button></li>
                    <li><button type="button" class="btn btn-secondary" onclick="location.href='history.back()'">취소하기</button></a></li>
                </ul>
            </div>
            <a href="register.kh">이메일 인증</a>
        </form>
        
        
		<script>
			// 업로드 버튼 숨김
			$("#inputImg").hide();
			
			// 이미지 영역 클릭 시 파일 업로드 버튼 동작
			
			$("#profileArea").click(function(){
				$("#inputImg").click();
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
			
			$("#inputPasswordConfirm").on("input", function(){
				var pwdVal = $("inputPassword").val();
				if($(this).val() != pwdVal) {
					
				}
			});
			
		</script>
    </body>
</html>