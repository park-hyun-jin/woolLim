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
	<form action="register.kh" class="container">
	    <h3>이메일을 입력해주세요</h3>
	    <table class="insertEmailTable">
	        <tr>
	            <td><label for="email">이메일 : </label></td>
	            <td><input type="email" id="email" name="email" required></td>
	        </tr>
	        <tr>
	            <td colspan="2">
	                <input type="submit" value="보내기" onclick="return emailRegister()">
	                <input type="button" value="취소" onclick="window.close();">
	            </td>
	        </tr>
	    </table>
	</form>
    <script>
    
		function emailRegister() {
	        var emailVal = $("#email").val();
	        $.ajax({
				url : "idCheck.kh",
				type : "post",
				data : { memberId : emailVal },
				success : function(check) {
					if(check == "success") {
						alert("중복된 이메일이 존재합니다.");
					}else {
						alert("사용가능한 이메일 입니다.");
				        window.close();
					}
				},
				error : function(e) {
					console.log("통신실패");
				}
			});
	        return false;
		}
    </script>
</body>
</html>