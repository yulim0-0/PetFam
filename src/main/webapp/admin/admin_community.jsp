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
</head>
<body>
	<main class="main">
		<div id="wrapper">
			<h1>Sortable Table of Search Queries</h1>

			<table id="keywords" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th><span>P_NO</span></th>
						<th><span>Subject</span></th>
						<th><span>Writer</span></th>
						<th><span>Clicks</span></th>
					</tr>
				</thead>
				<c:forEach var="vo" items="${list }">

					<tbody>
						<tr onclick="location.href='../pboard/detail.do?p_no=${vo.p_no }'" style="cursor:pointer">
							<td class="lalign">${vo.p_no }</td>
							<td>${vo.subject }</td>
							<td>${vo.id }</td>
							<td>${vo.hit }</td>
						</tr>

					</tbody>
				</c:forEach>

			</table>
		</div>
	</main>
</body>
</html>