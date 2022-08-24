∏<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mywrite.css">
<style>
 .pagination {
    margin: 20px 0;
    overflow: hidden;
    position: relative;
}
.pagination li {
    float: left;
}
.pagination ul {
    float: left;
    left: 50%;
    position: relative;
}
.pagination ul > li {
    left: -50%;
    position: relative;
}
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
	<main class=main>
		<body>
			<div id="wrapper">
				<h1>내가 쓴 글 목록</h1>

				<table id="keywords" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th width=14%><span>고유번호</span></th>
							<th width=50% style="text-align:left;"><span>제목</span></th>
							<th width=12%><span>작성일</span></th>
							<th width=12%><span>조회수</span></th>
							<th width=12%><span>작성자</span></th>
						</tr>
					</thead>
					<c:forEach var="vo" items="${list }">
						<tbody>
							<tr>
								<td class="lalign">${vo.p_no }</td>
								<td style="cursor: pointer; text-align:left"><a
									href="../pboard/detail.do?p_no=${vo.p_no }">${vo.subject }</a></td>
								<td>${vo.dbday }</td>
								<td>${vo.hit }</td>
								<td>${vo.id }</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>

				<!-- paging start -->
				<div class="pagination">
					<ul>
						<c:if test="${startPage>1 }">
							<li><a href="../mypage/mywrite.do?page=${startPage-1 }">&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${startPage }" end="${endPage }">
							<c:if test="${i==curpage }">
								<li class="active"><a href="../mypage/mywrite?page=${i }">${i }</a>
							</c:if>

							<c:if test="${i!=curpage }">
								<li><a href="../mypage/mywrite.do?page=${i }">${i }</a>
							</c:if>

						</c:forEach>

						<c:if test="${endPage<totalpage }">
							<li><a href="../mypage/mywrite.do?page=${endPage+1 }">&raquo;</a></li>
						</c:if>
					</ul>
				</div>
				<!-- paging end -->
			</div>
		</body>
	</main>
</body>
</html>