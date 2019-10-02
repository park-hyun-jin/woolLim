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
                width: 1500px;
                height: 700px;
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
                height: 60%;
                float: left;
            }

            .projectTable {
                width: 800px;
                height: 200px;
                margin: 15% auto;
                text-align: center;
            }

            .projectTable tr {
                border-bottom: 1px solid gray;
            }

            .content-2 {
                width: 100%;
                height: 10%;
                float: left;
            }

            .content-2 ul {
                text-align: center;
            }

            .content-2 li {
                display: inline-block;
                font-size: 20px;
                margin: 5px;
                color: dimgray;
            }

            .content-3 {
                width: 100%;
                height: 30%;
                float: left;
                position: relative;
            }

            .content-3 form {
                width: 400px;
                right: 0;
                position: absolute;
                display: inline-block;
            }

            .selectSearch {
                width: 70px;
                height: 36px;
                vertical-align: middle;
            }

        </style>
    </head>
    <body>
        <div class="container">
            <div class="menu">
                <ul>
                    <li><a href="#">회원정보</a></li>
                    <li><a href="#">작곡 프로젝트 관리</a></li>
                    <li><a href="#" style="color: black">작성 글</a></li>
                    <li><a href="#">작성 댓글</a></li>
                    <li><a href="#">신고 및 문의 내역</a></li>
                </ul>
            </div>
            <div class="content">
                <div class="content-1">
                    <table class="projectTable">
                        <tr>
                            <th>No</th>
                            <th>제목</th>
                            <th>내용</th>
                            <th>조회수</th>
                            <th>최근 수정 일자</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>검정고무신</td>
                            <td>ㅋㅋㅋㅋㅋㅋㅋ</td>
                            <td>3</td>
                            <td>2019-09-23</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>검정고무신</td>
                            <td>ㅋㅋㅋㅋㅋㅋㅋ</td>
                            <td>3</td>
                            <td>2019-09-23</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>검정고무신</td>
                            <td>ㅋㅋㅋㅋㅋㅋㅋ</td>
                            <td>3</td>
                            <td>2019-09-23</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>검정고무신</td>
                            <td>ㅋㅋㅋㅋㅋㅋㅋ</td>
                            <td>3</td>
                            <td>2019-09-23</td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td>검정고무신</td>
                            <td>ㅋㅋㅋㅋㅋㅋㅋ</td>
                            <td>3</td>
                            <td>2019-09-23</td>
                        </tr>
                    </table>
                </div>
                <div class="content-2">
                    <ul>
                        <li>&lt;&lt;</li>
                        <li>&lt;</li>
                        <li>1</li>
                        <li>2</li>
                        <li>3</li>
                        <li>4</li>
                        <li>5</li>
                        <li>&gt;</li>
                        <li>&gt;&gt;</li>
                    </ul>
                </div>
                <div class="content-3">
                    <form class="form-inline">
                            <select name="selectSearch" class="selectSearch">
                                <option value="title" selected>제목</option>
                                <option value="content">내용</option>
                            </select>
                            <input type="text" class="form-control" name="projectSearch" id="inputPassword2" placeholder="검색어를 입력하세요">
                            <input class="btn btn-primary" type="submit" value="검색">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>