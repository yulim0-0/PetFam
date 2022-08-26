<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>My Like</title>
<link rel="stylesheet" href="css/mylike.css">
</head>
<body>
	<!-- partial:index.partial.html -->
	<div class="cards">
		<div>
			<h4 class="subtitle">예약</h4>
			<img src="css/tape.png" class=tape>
		</div>

		<c:forEach var="vo" items="${list }">
			<div class="card">
				<div class="card__image-holder">
					<img class="card__image" src="http://${vo.poster }">
					<div class="card-title">
						<a href="#" class="toggle-info btn"> <span class="left"></span> <span
							class="right"></span>
						</a>
						<h2>
							${vo.name } <input type="hidden" value="${vo.price }" id=price>
							<small>${vo.price }원
							</small>
						</h2>
					</div>
					<div class="card-flap flap1">
						<div class="card-description">${vo.s_info }</div>
						<div class="card-flap flap2">
							<div class="card-actions">
								<button
									onclick="location.href='../booking/hos_detail.do?o_no=${vo.o_no }'"
									class="btn">Read more</button>
								<button
									onclick="location.href='../booking/jjim_cancel.do?o_no=${vo.o_no }'"
									class="btn">Cancel Like</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
	<div class="cards">
		<div>
			<h4 class="subtitle">추천</h4>
			<img src="css/tape.png" class=tape>
		</div>

		<c:forEach var="po" items="${plist }">
			<div class="card">
				<div class="card__image-holder">
					<img class="card__image" src="${po.poster }">
					<div class="card-title">
						<a href="#" class="toggle-info btn"> <span class="left"></span> <span
							class="right"></span>
						</a>
						<h2>
							${po.title } <small>${po.tel }</small>
						</h2>
					</div>
					<div class="card-flap flap1">
						<div class="card-description">${vo.s_info }</div>
						<div class="card-flap flap2">
							<div class="card-actions">
								<button
									onclick="location.href='../petplace/cafe.do?o_no=${po.c_no }'"
									class="btn">Read more</button>
								<button
									onclick="location.href='../petplace/jjim_cancel.do?c_no=${po.c_no }'"
									class="btn">Cancel Like</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
	<!-- partial -->
	<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script
		src='//cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js'></script>
	<script src="js/mylike.js"></script>

</body>
</html>

