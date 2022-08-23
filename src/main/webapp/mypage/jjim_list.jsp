<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>찜 목록</title>
<link rel="stylesheet" href="css/mylike.css">

</head>
<body>

	<!-- partial:index.partial.html -->

	<main class="main">
	찜목록
		<ul class="cards">
			<c:forEach var="vo" items="${plist }">
				<li class="cards_item">
					<div class="card">
						<div class="card_image">
							<img src="${vo.poster }">
						</div>
						<div class="card_content">
							<h2 class="card_title">${vo.title }</h2>
							<p class="card_text">${vo.addr }</p>
							<p class="card_msg"></p>
							<button class="btn card_btn" onclick="location.href='../petplace/petplace_detail.do?c_no=${vo.c_no }'">Read More</button>
							<br>
							<a href="../petplace/jjim_cancel.do?c_no=${vo.c_no }" class="btn btn-xs btn-primary">취소</a>
						</div>
					</div>
				</li>
			</c:forEach>
			
		</ul>
	</main>
	
</body>
</html>
<%-- 
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
	 <h2>내 좋아요 내역</h2>
		<ul class="cards" >
		
				<li class="cards_item">
					<div class="card">
						<div class="card_image">
							<img src="http://${vo.poster }">
						</div>
						<div class="card_content">
							<h2 class="card_title"></h2>
							<p class="card_text">${vo.name }</p>
							<p class="card_msg">${vo.price }원</p>
							<div class="btnbtn">
							<button class="btn card_btn" onclick="location.href='../booking/hos_detail.do?o_no=${vo.o_no }'" 
								 style="width: 150px; float: left;  margin-left: 4px; margin-right: 23px; background-color: skyblue ">상세보기</button> 
							<button class="btn card_btn1" onclick="location.href='../booking/jjim_cancel.do?o_no=${vo.o_no }'"
								 style="width: 150px;" >좋아요 취소</button>
							</div>
						</div>
					</div>
				</li>
			
		</ul>
	</main>
</body>
</html> --%>
