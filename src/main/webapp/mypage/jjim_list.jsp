<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>찜 목록</title>
<link rel="stylesheet" href="css/jjimlist.css">

</head>
<body>

	<!-- partial:index.partial.html -->
	<main class="main">
		<ul class="cards">
			<c:forEach var="vo" items="${list }">
				<li class="cards_item">
					<div class="card">
						<div class="card_image">
							사진<img src="${vo.poster }">
						</div>
						<div class="card_content">
							<h2 class="card_title">${vo.title }</h2>
							<p class="card_text">${vo.addr }</p>
							<p class="card_msg"></p>
							<button class="btn card_btn" onclick="location.href='../petplace/petplace_detail.do?c_no=${vo.c_no }'">Read More</button>
						</div>
					</div>
				</li>
			</c:forEach>
			
		</ul>
	</main>
	<br><br><br><br><br><br><br><br><br>찜 목록
</body>
</html>