<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
    <meta charset="UTF-8">
        <title></title>
    </head>
    <style>

        .loginForm {
            width: 500px;
            height: 250px;
            border: 1px solid gray;
            border-radius: 5%;
            margin: 10% auto;
            font-size: 20px;
        }

        .loginTable {
            width: 100%;
            height: 100%;
            text-align: center;
        }

        .login_ul {
            text-align: center;
        }

        .login_ul li {
            display: inline-block;
        }

        a {
            text-decoration: none;
        }

        input {
            width: 200px;
            height: 30px;
            
        }

    </style>
    <body>
        <form action="login.kh" class="loginForm" method="post">
            <table class="loginTable">
                <tr>
                    <td><label for="id">아이디 : </label></td>
                    <td><input type="text" id="id" name="id"></td>
                </tr>
                <tr>
                    <td><label for="pwd">비밀번호 : </label></td>
                    <td><input type="password" id="pwd" name="pwd"></td>
                </tr>
                <tr>
                	<td>
                		<button>확인</button>
                		<button type="button">취소</button>
                	<td>
                </tr>
            </table>
            <div>
                <ul class="login_ul">
                    <li><a href="login.kh">회원가입</a></li>
                    <li><a href="#">아이디</a>/<a href="#">비밀번호 찾기</a></li>
                </ul>
            </div>
        </form>
    </body>
</html>