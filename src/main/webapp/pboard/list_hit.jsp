<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CodePen - Tour Bus</title>
<link rel="stylesheet" href="..css/style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'>
<link rel="stylesheet" href="pboarddist/pboard_style.css">
<style type="text/css">
h3 {
	font-size: 1.75rem;
}

/*--------------------------------------------------------------
# Navigation Menu
--------------------------------------------------------------*/
/**
* Desktop Navigation 
*/
.navbar {
	padding: 0;
	margin-bottom: 0px;
}
.pbody {
    display: flex;
    flex: 1 1 auto;
    font-family: 'GmarketSansMedium', 'Noto Sans KR', sans-serif;
    color: #212529;
    align-items: baseline;
    justify-content: space-evenly;
}
.navbar ul {
	margin: 0;
	padding: 0;
	display: flex;
	list-style: none;
	align-items: center;
}

.navbar li {
	position: relative;
}

.navbar a, .navbar a:focus {
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 10px 0 10px 30px;
	font-size: 15px;
	color: #4e4039;
	white-space: nowrap;
	transition: 0.3s;
}

.navbar a i, .navbar a:focus i {
	font-size: 12px;
	line-height: 0;
	margin-left: 5px;
}

.navbar a:hover, .navbar .active, .navbar .active:focus, .navbar li:hover>a
	{
	color: #f34100;
}

.navbar .start, .navbar .start:focus {
	background: #f34100;
	color: #fff;
	padding: 10px 25px;
	margin-left: 30px;
	border-radius: 50px;
}

.navbar .start:hover, .navbar .start:focus:hover {
	color: #fff;
	background: #ee7843;
}

.navbar .dropdown ul {
	display: block;
	position: absolute;
	left: 14px;
	top: calc(100% + 30px);
	margin: 0;
	padding: 10px 0;
	z-index: 99;
	opacity: 0;
	visibility: hidden;
	background: #fff;
	box-shadow: 0px 0px 30px rgba(127, 137, 161, 0.25);
	transition: 0.3s;
}

.navbar .dropdown ul li {
	min-width: 200px;
}

.navbar .dropdown ul a {
	padding: 10px 20px;
	font-size: 15px;
	text-transform: none;
}

.navbar .dropdown ul a i {
	font-size: 12px;
}

.navbar .dropdown ul a:hover, .navbar .dropdown ul .active:hover, .navbar .dropdown ul li:hover>a
	{
	color: #f34100;
}

.navbar .dropdown:hover>ul {
	opacity: 1;
	top: 100%;
	visibility: visible;
}

.navbar .dropdown .dropdown ul {
	top: 0;
	left: calc(100% - 30px);
	visibility: hidden;
}

.navbar .dropdown .dropdown:hover>ul {
	opacity: 1;
	top: 0;
	left: 100%;
	visibility: visible;
}

@media ( max-width : 1366px) {
	.navbar .dropdown .dropdown ul {
		left: -90%;
	}
	.navbar .dropdown .dropdown:hover>ul {
		left: -100%;
	}
}

body {
	margin-top: 90px;
}

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

.pagination ul>li {
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

#findBtn:hover {
	color: #f34100;
}
</style>

</head>
<body>
	<!-- partial:index.partial.html -->
	<div class='papp'>
		<div class='pheader'></div>
		<div class='pbody'>
			<div class='psidebar'>
				<ul class="psidebar-nav inline">
					<li>
						<button>
							<h2>커뮤니티</h2>
							<!--   <i class='fas fa-home'></i> -->
						</button>
					</li>
					<li>
						<button type="button" onclick="location.href='../pboard/list.do'">
							<span>자유게시판 </span> <i class='fas fa-book'></i>
						</button>
					</li>
					<!-- <li>
						<button type="button" onclick="location.href='../ppboard/list.do'">
							<span>반려동물 자랑 게시판 </span> <i class='fas fa-car'></i>
						</button>
					</li> -->
					<li>
						<button type="button" onclick="location.href='../qna/list.do'">
							<span>문의 게시판</span> <i class='fas fa-cloud'></i>
						</button>
					</li>
					<li>
						<button type="button" onclick="location.href='../notice/list.do'">
							<span>공지사항</span> <i class='fas fa-cloud'></i>
						</button>
					</li>
				</ul>
			</div>
			<div class='pmain'>
				<div class='pmain__content'>
					<div class='ptable-card'>
						<h2 >PetBoard</h2>
						<div style="margin-top: 20px;">
							<div style="width: 90%;padding-bottom: 20px;">
								<a href="../pboard/list_hit.do" class="btn square btn-default best"
									id="hit"><i class="fa fa-star"></i>인기글</a> <a
									href="../pboard/list.do" class="btn square btn-default best"
									><i class="fa fa-star"></i>최신글</a>
								<c:if test="${sessionScope.id!=null }">
									<!-- 로그인한 사람만 보임  -->
									<a href="../pboard/insert.do" style="margin-bottom: -6px;margin-right: -112px;"
										class="btn square btn-primary write" id="WriteBtn"> <i
										class="fa fa-pencil"></i> 글 쓰기
									</a>
								</c:if>



							</div>
							<table class='ptable'>
								<thead>
									<tr>
										<td width="10%" class="text-center">번호</td>
										<td width="45%" class="text-center">제목</td>
										<td width="15%" class="text-center">작성자</td>
										<td width="20%" class="text-center">작성일</td>
										<td width="10%" class="text-center">조회수</td>
									</tr>
								</thead>
								<!-- 글 리스트 -->
								<c:forEach var="vo" items="${list }">
									<tr>
										<td width="10%" class="text-center">${vo.p_no }</td>
										<td width="45%"><a
											href="../pboard/detail.do?p_no=${vo.p_no }">${vo.subject }</a>
											&nbsp;&nbsp; <c:if test="${vo.rcount>0 }">
						             		(${vo.rcount })
						             	 <small class="favo"><i class="fa fa-heart"></i></small>
											</c:if></td>
										<td width="15%" class="text-center">${vo.id }</td>
										<td width="20%" class="text-center">${vo.dbday }</td>
										<td width="10%" class="text-center">${vo.hit }</td>

									</tr>
								</c:forEach>

							</table>
						</div>
					</div>
					<!-- 페이징  -->
					<div class="container" align="center">
						<div class="pagination" style="    width: 700px;">
							<ul>
								<c:if test="${startPage>1 }">
									<li><a href="../pboard/list_hit.do?page=${startPage-1 }">&laquo;</a></li>
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:if test="${i==curpage }">
										<li class="active"><a href="../pboard/list_hit.do?page=${i }">${i }</a></li>
									</c:if>
									<c:if test="${i!=curpage }">
										<li><a href="../pboard/list_hit.do?page=${i }">${i }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${endPage<totalpage }">
									<li><a href="../pboard/list_hit.do?page=${endPage+1 }">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>



					<!--  게시글 검색 -->
					<div class="row"
						style="width: 50%; height: 100px; margin: 0px auto; margin-bottom: -50px;">
						<div class="input-group"
							style="display: contents; text-align-last: center;">
							<form class="search-container" method="post"
								action="../pboard/list.do" class="search_bar large"
								style="text-align: left; margin-top: -62px;">
								<input type="text" id="search-bar" value="${subject }" name=subject
									style="border: solid 0.1px; border-color:#d0d0d0; background: transparent; width: 60%; padding: 6px;"
									placeholder="검색어를 입력해 주세요.">
								<button type="submit" value="Search" id="findBtn"
									style="padding-left: 15px;">Search</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- partial -->
	<script src="pboarddist/pboard_script.js"></script>
	<script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="../pboard/pboarddist/dist/script.js"></script>
</body>
</html>