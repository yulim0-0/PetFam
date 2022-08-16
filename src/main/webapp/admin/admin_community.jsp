<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/admin_community.css">
<script src="js/admin_community.js"></script>
<style>
.pagination li a {
    transition: all 100ms ease-in-out 0s;
    background-color: #FFFFFF;
    border-radius: 5px 5px 5px 5px;
    color: #69696E;
    display: block;
    font: 16px/30px Noto Sans KR, sans-serif;
    height: 30px;
    margin: 0 3px;
    overflow: hidden;
    position: relative;
    text-align: center;
    text-decoration: none;
    width: 30px;
}
.pagination li a:hover {
    background-color: #F34100;
    color: #FFFFFF;
}
.pagination li.active a {
    background-color: #F34100;
    color: #FFFFFF;
}
.pagination li.active a:hover {
    color: #F34100;
}
</style>
</head>
<body>
	<main class="main">
		<div id="wrapper">
			<h1>게시글 전체보기</h1>

			<table id="keywords" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th></th>
						<th><span>No</span></th>
						<th><span>Subject</span></th>
						<th><span>Writer</span></th>
						<th><span>Clicks</span></th>
						<th><span>RegDate</span></th>
					</tr>
				</thead>
				
				<c:forEach var="vo" items="${list }">
					<tbody>
						<tr>
							<td><input type=checkbox /></td>
							<td style="width:10%">${vo.p_no }</td>
							<td onclick="location.href='../pboard/detail.do?p_no=${vo.p_no }'" style="cursor:pointer; text-align : left;">${vo.subject }</td>
							<td>${vo.id }</td>
							<td>${vo.hit }</td>
							<td>${vo.dbday }</td>
						</tr>
					</tbody>
				</c:forEach>
				
				<!-- paging start -->
				<div class="pagination">
					  <ul>
				          <c:if test="${startPage>1 }">
				            <li><a href="../admin/admin_community.do?page=${startPage-1 }">&lt;</a></li>
				          </c:if>
				          <c:forEach var="i" begin="${startPage }" end="${endPage }">
				            <c:if test="${i==curpage }">
				            	<li><a href="../admin/admin_community.do?page=${i }">${i }</a>
				            </c:if>
				            
				            <c:if test="${i!=curpage }">
				            	<li><a href="../admin/admin_community.do?page=${i }">${i }</a>
				            </c:if>
				            
				          </c:forEach>
				          
				          <c:if test="${endPage<totalpage }">
				            <li><a href="../admin/admin_community.do?page=${endPage+1 }">&raquo;</a></li>
				          </c:if>
				      </ul>
				 </div>
			</table>
		</div>
	</main>
</body>
</html>