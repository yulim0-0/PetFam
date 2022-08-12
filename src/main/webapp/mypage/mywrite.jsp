<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/mywrite.css">

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
							<th width=50%><span>제목</span></th>
							<th width=12%><span>작성일</span></th>
							<th width=12%><span>조회수</span></th>
							<th width=12%><span>작성자</span></th>
						</tr>
					</thead>
					<c:forEach var="vo" items="${list }">

						<tbody>
							<tr>
								<td class="lalign">${vo.p_no }</td>
								<td style="cursor: pointer"><a
									href="../pboard/detail.do?p_no=${vo.p_no }">${vo.subject }</a></td>
								<td>${vo.dbday }</td>
								<td>${vo.hit }</td>
								<td>${vo.id }</td>
							</tr>
						</tbody>
					</c:forEach>

				</table>
			</div>
		</body>
	</main>
</body>
</html>