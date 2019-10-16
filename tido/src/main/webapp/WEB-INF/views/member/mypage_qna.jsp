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
                width: 1500px;
                height: 700px;
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
                color: black;
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
                color: black;
            }
            
            .selectSearch option {
            	color: black;
            }
            
            .projectTable a {
            	color: black;
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
    	
		<c:url var="memberBoardPage" value="memberBoardList.kh">
    		<c:param name="id" value="${loginUser.id }"/>
    	</c:url>
    	<c:url var="memberReplyPage" value="memberReplyList.kh">
    		<c:param name="id" value="${loginUser.id }"/>
    	</c:url>
    	<c:url var="memberQnaPage" value="memberQnaList.kh">
    		<c:param name="id" value="${loginUser.id }"/>
    	</c:url>
    
    	<jsp:include page="../common/menubar.jsp"></jsp:include>
        <div class="container">
            <div class="menu">
                <ul>
                    <li><a href="myPageInfo.kh">회원정보</a></li>
                    <li><a href="projectListView.kh">작곡 프로젝트 관리</a></li>
                    <li><a href="${ memberBoardPage }">작성 글</a></li>
                    <li><a href="${memberReplyPage }">작성 댓글</a></li>
                    <li><a href="${memberQnaPage}" style="color: dimgrey">문의 내역</a></li>
                </ul>
            </div>
            <div class="content">
                <div class="content-1">
                    <table class="projectTable">
                        <tr>
                            <th>No</th>
                            <th>제목</th>
                            <th>내용</th>
                            <th>최근 수정 일자</th>
                        </tr>
                        <c:forEach var="i" items="${list}">
                        	<tr>
                        		<c:url var="idetail" value="idetail.kh">
									<c:param name="iNo" value="${ i.iNo }"/>
								</c:url>
                        		<td>${i.iNo}</td>
                        		<td><a href="${idetail}">${i.iInquiryTitle}</a></td>
                        		<td><a href="${idetail}">${i.iInquiryContent}</a></td>
                        		<td>${i.iInquiryModifyDate}</td>
                        	</tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="content-2">
                    <ul>
                        <li>
	                        <c:url var="firstPage" value="memberQnaList.kh">
	                        	<c:param name="id" value="${ loginUser.id }"/>
								<c:param name="page" value="${ 1 }"/>
							</c:url>
							<a href="${ firstPage }">&lt;&lt;</a>
                        </li>
                        <li>
                        	<c:if test="${ pi.currentPage <= 1 }">&lt;</c:if>
							<c:if test="${ pi.currentPage > 1 }">
								<c:url var="beforePage" value="memberQnaList.kh">
									<c:param name="id" value="${ loginUser.id }"/>
									<c:param name="page" value="${ pi.currentPage - 1 }"/>
								</c:url>
								<a href="${ beforePage }">&lt;</a> 
							</c:if>
                        </li>
                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        	<li>
                        		<c:if test="${ p == currentPage }">
									<font color="red" size="4"><b>${ p }</b></font>
								</c:if>
                        	</li>
							<c:if test="${ p != currentPage }">
								<c:url var="pagination" value="memberQnaList.kh">
									<c:param name="id" value="${ loginUser.id }"/>
									<c:param name="page" value="${ p }"/>
								</c:url>
								<a class="pageNum" name="${p}" href="${ pagination }">${ p }</a>
							</c:if>
                        </c:forEach>
                        <li>
                        	<c:if test="${ pi.currentPage >= pi.maxPage }">
								&gt;
							</c:if>
							<c:if test="${ pi.currentPage < pi.maxPage }">
								<c:url var="afterPage" value="memberQnaList.kh">
									<c:param name="id" value="${ loginUser.id }"/>
									<c:param name="page" value="${ pi.currentPage + 1 }"/>
								</c:url> 
								<a href="${ afterPage }">&gt;</a>
							</c:if>
                        </li>
                        <li>
                        	<c:url var="lastPage" value="memberQnaList.kh">
                        		<c:param name="id" value="${ loginUser.id }"/>
								<c:param name="page" value="${ pi.maxPage }"/>
                        	</c:url>
                        	<a href="${lastPage}">&gt;&gt;</a>
                        </li>
                    </ul>
                </div>
                <div class="content-3">
                    <form class="form-inline" id="selectForm">
                    	<select name="sort" class="selectSearch">
                    		<c:if  test="${!empty sort}">
                    			<c:if test="${sort == 'title'}">
	                                <option value="title" selected>제목</option>
	                                <option value="content">내용</option>
                    			</c:if>
                    			<c:if test="${sort == 'content'}">
	                                <option value="title">제목</option>
	                                <option value="content" selected>내용</option>
                    			</c:if>
                            </c:if>
                            <c:if test="${empty sort}">
                            	<option value="title" selected>제목</option>
	                            <option value="content">내용</option>
                            </c:if>
                        </select>
                        <input type="hidden" name="id" value="${loginUser.id}">
                        <input type="hidden" name="page" value="${1}">
                        <c:if  test="${!empty search}">
	                        <input type="text" class="form-control" name="search" id="inputPassword2" value="${search}" placeholder="검색어를 입력하세요">
                        </c:if>
                        <c:if test="${empty search}">
                        	<input type="text" class="form-control" name="search" id="inputPassword2" placeholder="검색어를 입력하세요">
                        </c:if>
                        <input class="btn btn-primary" type="submit" value="검색">
                    </form>
                </div>
            </div>
        </div>
        <script>
        	var currentPage = "<c:out value='${pi.currentPage}'/>";
    		$("a[name="+currentPage+"]").css("color", "red");
        </script>
    </body>
</html>