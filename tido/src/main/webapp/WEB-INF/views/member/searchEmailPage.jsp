<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<title></title>
	<style>
		.container {
		    width: fit-content;
		    height: 100px;
		    margin: auto;
		    text-align: center;
		}
		
		table {
		    width: 100%;
		    margin: auto;
		}
		
		.insertEmailTable tr {
		    height: 60px;
		}
		
		.insertEmailTable input {
		    margin-left: 15px;
            margin-right: 15px;
		}
		
		label {
		    margin-right: 10px;
	        }
	</style>
</head>

<body>
	<form action="idCheckStatus.kh" class="container">
	    <h3>이메일을 입력해주세요</h3>
	    <table class="insertEmailTable">
	        <tr>
	            <td><label for="email">이메일 : </label></td>
	            <td><input type="email" id="email" name="email" required></td>
	        </tr>
	        <tr>
	            <td colspan="2">
	                <input type="submit" value="보내기" onclick="return emailRegister();">
	                <input type="button" value="취소" onclick="window.close();">
	            </td>
	        </tr>
	    </table>
	</form>
    <script>
    	
		function emailRegister() {
	        var emailVal = $("#email").val();
	        var emailCheck = false;
	        $.ajax({
				url : "idCheckStatus.kh",
				type : "post",
				async : false,
				data : { memberId : emailVal },
				success : function(check) {
					if(check == "success") {
						alert("가입된 이메일이거나 탈퇴된 이메일입니다..");
						$("#emailCheck").val(0);
					}else {
						alert("아이디가 존재하지 않습니다.");
						$("#emailCheck").val(1);
						emailCheck = true;
						window.close();
					}
				},
				error : function(e) {
					console.log("통신실패");
				}
			});
	        if(confirm("이메일을 보내시겠습니까?")) {
	        	if(!emailCheck) {
		        	return true;
		        }else {
		        	alert("가입되지 않은 이메일입니다.");
		        	return false;
		        }
	        }else {
	        	return false;
	        }
		}
    </script>
</body>
</html>