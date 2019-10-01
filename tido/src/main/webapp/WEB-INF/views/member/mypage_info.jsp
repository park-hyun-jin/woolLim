<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <meta charset="UTF-8">
        <title></title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            .container {
                width: 1200px;
                height: 800px;
                margin: auto;
                padding: 0;
            }

            .menu {
                width: 20%;
                height: 100%;
                margin: 0;
                float: left;
                padding-top: 10%;
            }

            .menu ul {
                height: 80%;
                border-right: 2px solid gray;
            }

            .menu li{
                display: block;
                line-height: 90px;
            }

            .menu li a {
                text-decoration: none;
                color: gray;
                font-size: 25px;
                font-weight: bold;
            }

            .content {
                width: 80%;
                height: 100%;
                float: left;
            }

            .content-1 {
                width: 100%;
                height: 45%;
                position: relative;
                float: left;
            }

            .content-1 img {
                width: 250px;
                height: 250px;
                position: absolute;
                bottom: 0;
                left: 0;
                right: 0;
                margin: auto;
                
            }

            .content-2 {
                width: 100%;
                height: 35%;
                text-align: center;
                float: left;
            }

            .content-2 td:nth-child(1) {
                font-weight: bold;
            }

            #memberTable {
                width: 300px;
                height: 200px;
                font-size: 20px;
                margin: auto;
                margin-top: 5%;
            }

            .content-3 {
                width: 100%;
                height: 20%;
                float: left;
            }

            .content-3 button {
                width: 90px;
                height: 40px;
                margin-left: 10px;
                margin-right: 10px;
                font-size: 17px;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="menu">
                <ul>
                    <li><a href="#" style="color: black">회원정보</a></li>
                    <li><a href="#">작곡 프로젝트 관리</a></li>
                    <li><a href="#">작성 글</a></li>
                    <li><a href="#">작성 댓글</a></li>
                    <li><a href="#">신고 및 문의 내역</a></li>
                </ul>
            </div>
            <div class="content">
                <div class="content-1">
                    <img src="gauss.jpg">
                </div>
                <div class="content-2">
                    <table id="memberTable">
                        <tr>
                            <td>아이디 :</td>
                            <td>sundown710</td>
                        </tr>
                        <tr>
                            <td>닉네임 :</td>
                            <td>쏭싹</td>
                        </tr>
                        <tr>
                            <td>가입일 :</td>
                            <td>2019-09-20</td>
                        </tr>
                    </table>
                </div>
                <div class="content-3" align="center">
                    <button type="button" class="btn btn-primary" style="background-color:rgb(46, 46, 48)">수정</button>
                    <button type="button" class="btn btn-danger" style="background-color:rgb(136, 5, 16)">탈퇴</button>
                </div>
            </div>
        </div>
    </body>
</html>