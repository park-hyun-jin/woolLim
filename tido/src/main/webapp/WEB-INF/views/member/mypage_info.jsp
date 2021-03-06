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
                color: black;
            }

            .container {
                width: 1200px;
                height: 800px;
                margin: auto;
                padding: 0;
                background-color: rgba( 255, 255, 255, 0.5 );
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
                color: black;
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
            
            .content a {
            	color: black;
            }
            
            .content a:hover {
				text-decoration: none;
			}

        </style>
    </head>
    <body>
    	<jsp:include page="../common/menubar.jsp"></jsp:include>
    	
    	<c:url var="memberBoardPage" value="memberBoardList.kh">
    		<c:param name="id" value="${loginUser.id }"/>
    	</c:url>
    	<c:url var="memberReplyPage" value="memberReplyList.kh">
    		<c:param name="id" value="${loginUser.id }"/>
    	</c:url>
    	<c:url var="memberQnaPage" value="memberQnaList.kh">
    		<c:param name="id" value="${loginUser.id }"/>
    	</c:url>
    	
        <div class="container">
            <div class="menu">
                <ul>
                    <li><a href="myPageInfo.kh" style="color: dimgrey">회원정보</a></li>
                    <li><a href="projectListView.kh">작곡 프로젝트 관리</a></li>
                    <li><a href="${ memberBoardPage }">작성 글</a></li>
                    <li><a href="${memberReplyPage }">작성 댓글</a></li>
                    <li><a href="${memberQnaPage}">문의 내역</a></li>
                </ul>
            </div>
            <div class="content">
                <div class="content-1">
                    <img src="${contextPath}/resources/muploadFiles/${loginUser.id}/${loginUser.imagePath}"
                    onerror="this.src='${contextPath}/resources/images/noimage.png'">
                </div>
                <div class="content-2">
                    <table id="memberTable">
                        <tr>
                            <td>아이디 :</td>
                            <td>${loginUser.id}</td>
                        </tr>
                        <tr>
                            <td>닉네임 :</td>
                            <td>${loginUser.name}</td>
                        </tr>
                        <tr>
                            <td>가입일 :</td>
                            <td>${loginUser.enrollDate }</td>
                        </tr>
                    </table>
                </div>
                <div class="content-3" align="center">
                    <button type="button" class="btn btn-primary" onclick="updateBtn()" style="background-color:rgb(46, 46, 48)">수정</button>
                    <button type="button" class="btn btn-danger" onclick="deleteBtn()" style="background-color:rgb(136, 5, 16)">탈퇴</button>
                </div>
            </div>
        </div>
        <script>
        	var id = "<c:out value='${loginUser.id}'/>";
        
        	function updateBtn() {
        		location.href="updatePage.kh";
        	}
        	
        	function deleteBtn() {
        		if(confirm("정말 탈퇴하시겠습니까?")) {
        			location.href="mdelete.kh?id="+id;
        		}
        	}
        </script>
    </body>
</html>