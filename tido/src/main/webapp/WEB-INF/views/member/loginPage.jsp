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
            height: 800px;
            margin: auto;
        }

        .loginForm {
            width: 650px;
            height: 150px;
            margin: 5% auto;
            font-size: 20px;
        }

        .login_ul {
            text-align: center;
            padding: 0;
        }

        .login_ul li {
            display: inline-block;
            margin: 5px;
        }

        a {
            text-decoration: none;
        }

        .login_ul button {
            width: 100px;
            height: 40px;
        }

        .titleArea h1 {
            text-align: center;
            color: gray;
            margin-top: 5%;
        }

    </style>
    <body>
    	<jsp:include page="../common/menubar.jsp"></jsp:include>
        <div class="titleArea">
            <h1>로그인</h1>
        </div>
        <form action="login.kh" method="POST" class="loginForm">
            <div class="form-group row">
                <label for="inputEmail" class="col-sm-2 col-form-label">이메일</label>
                <div class="col-sm-10">
                <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="id">
                </div>
            </div>
            <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col-sm-10">
                <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="pwd">
                </div>
            </div>
            <br>
            <div>
                <ul class="login_ul">
                    <li><button type="submit" class="btn btn-primary">로그인</button></li>
                    <li><button type="button" class="btn btn-secondary" onclick="history.back();">취소하기</button></a></li>
                </ul>
            </div>
        </form>
        <div>
            <ul class="login_ul">
                <li><a href="minsertPage.kh">회원가입</a></li>
                <li><a href="#">아이디</a>/<a href="#">비밀번호 찾기</a></li>
            </ul>
        </div>
    </body>
</html>