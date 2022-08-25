<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Like List</title>
<link rel="stylesheet" href="css/mylike.css">
<style>
/* 상위 구분 시작 */
.subtitle {
    text-align:center;
}
.subline {
    border-bottom: 0.4px solid #212529;
    width : 5%;
    margin : 0 auto;
    margin-bottom : 80px;
    margin-top : 30px
}
</style>
</head>
<body>
	<!-- partial:index.partial.html -->
	<main class="main">
	
	<div>
	 <h2>나의 좋아요</h2>
        <h4 class="subtitle">예약</h4>
        <p class="subline"></p>
			<ul class="cards" >
				<c:forEach var="vo" items="${list }">
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
				</c:forEach>
			</ul>
		</div>
		<!--  -->
		<div>
        <h4 class="subtitle">추천</h4>
        <p class="subline"></p>
            <ul class="cards" >
                <c:forEach var="po" items="${plist }">
                    <li class="cards_item">
                        <div class="card">
                            <div class="card_image">
                                <img src="${po.poster }">
                            </div>
                            <div class="card_content">
                                <h2 class="card_title"></h2>
                                <p class="card_text">${po.title }</p>
                                <div class="btnbtn">
                                <button class="btn card_btn" onclick="location.href='../petplace/cafe.do?o_no=${po.c_no }'" 
                                     style="width: 150px; float: left;  margin-left: 4px; margin-right: 23px; background-color: skyblue ">상세보기</button> 
                                <button class="btn card_btn1" onclick="location.href='../petplace/cafe.do?o_no=${po.c_no }'"
                                     style="width: 150px;" >좋아요 취소</button>
                                </div>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        
        
	</main>
</body>
</html>

