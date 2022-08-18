<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>좋아요 목록</title>
<link rel="stylesheet" href="css/mylike.css">

</head>
<body>
	
	<!-- partial:index.partial.html -->
	<main class="main">
		<ul class="cards">
			<c:forEach var="vo" items="${list }">
				<li class="cards_item">
					<div class="card">
						<div class="card_image">
							<img src="http://${vo.poster }">
						</div>
						<div class="card_content">
							<h2 class="card_title">${vo.j_no }</h2>
							<p class="card_text">${vo.name }</p>
							<p class="card_msg">90,000원</p>
							<button class="btn card_btn">Read More</button>
						</div>
					</div>
				</li>
			</c:forEach>
			
		</ul>
	</main>
</body>
</html>
