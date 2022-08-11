<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.table{
	width:800px;
	margin : 100px auto;
}
</style>
</head>
<body>
<main class=main>
<c:forEach var="vo" items="${list }">
	<table class="table">
		<tr>
			<th>제목</th>
			<th>내용</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>작성자</th>
		</tr>
		<tr>
			<td style="cursor:pointer"><a href="../pboard/detail.do?p_no=${vo.p_no }">${vo.subject }</a></td>
			<td></td>
			<td>${vo.dbday }</td>
			<td>${vo.hit }</td>
			<td>${vo.id }</td>
		</tr>
	</table>
</c:forEach>

</main>
</body>
</html>