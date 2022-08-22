<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.typekit.net/evl6ifb.css">

</head>
<body>
	<header id="header" class="fixed-top d-flex align-items-center">
		<div class="container d-flex align-items-center justify-content-between">
			<div class="logo">
				<!-- Uncomment below if you prefer to use an image logo -->
				<a href="../main/main.do">
				    <img src="../assets/img/logo.png" alt="" class="img-fluid"></a>
				<h1 class="text-light">
					<a href="../main/main.do"><span style="font-family: geller-headline, serif">PetFam</span></a>
				</h1>
			</div>

			<nav id="navbar" class="navbar">
				<ul>
					<!-- <li><a class="nav-link scrollto active" href="#hero">Home</a></li> -->
					<li class="dropdown">
						<a href="#"><span>예약</span><i class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="../booking/hospital_list.do">병원</a></li>
							<li><a href="../booking/salon_list.do">미용</a></li>
							<li><a href="../booking/training_list.do">훈련</a>
						</ul> 
						<!--   <li><a class="nav-link scrollto" href="#portfolio" hover="Recommendation")>추천</a></li>-->
					<li class="dropdown"><a href="#"><span>추천</span> <i class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="../petplace/cafe.do">카페/식당</a></li>
							<li><a href="../petplace/park.do">공원</a></li>
							<li><a href="../petplace/pension.do">펜션</a></li>
						</ul>
					</li>


					<li class="dropdown">
						<a href="../pboard/list.do"><span>커뮤니티</span><i class="bi bi-chevron-down"></i></a>
						<ul>
							<li><a href="../pboard/list.do">자유 게시판</a></li>
							<li><a href="../ppboard/list.do">반려동물 자랑 게시판</a></li>
							<li><a href="../qna/list.do">문의 게시판</a></li>
							<li><a href="../notice/list.do">공지사항</a></li>
						</ul> 
						<c:if test="${sessionScope.id!=null }">
							<li class="dropdown"><a href="#"><span>마이</span> <i class="bi bi-chevron-down"></i></a>
								<ul>
									<li class="dropdown">
										<a href="#"><span>마이페이지</span> <i class="bi bi-chevron-right"></i></a>
										<ul>
											<li><a href="../mypage/myinfo.do">나의정보</a></li>
											<li><a href="../mypage/myinfo_edit.do">나의정보 수정</a></li>
										</ul>
									</li>
									<li><a href="../mypage/mybooking.do">예약 내역</a></li>
									<li><a href="../mypage/mylike.do">좋아요 내역</a></li>
									<li><a href="../mypage/mywrite.do">게시글 내역</a></li>
									<li><a href="../mypage/myqna.do">문의 내역</a></li>
									<li><a href="../mypage/jjim_list.do">찜 내역</a>
								</ul>
							</li>

							<c:if test="${sessionScope.admin=='y' }">
								<li class="dropdown">
								<a href="#"><span>관리자</span><i class="bi bi-chevron-down"></i></a>
									<ul>
										<li><a href="../admin/admin_booking.do">예약 관리</a></li>
										<li><a href="../admin/admin_community.do">게시글 관리</a></li>
                                        <li><a href="../admin/admin_qna.do">문의 관리</a></li>
										<li><a href="../admin/admin_user.do">계정 관리</a></li>
									</ul>
								</li>
							</c:if>
						</c:if> <!-- 로그인 상태가 아닌 경우 --> <c:if test="${sessionScope.id==null }">
							<li><a href="../user/join.do">회원가입</a></li>
						</c:if>
					<li><a class="nav-link scrollto" href="#contact">문의</a></li>

					<!-- 로그인 상태가 아닌 경우 -->
					<c:if test="${sessionScope.id==null }">
						<li>
							<a class="start" id="login_header" href="../user/login.do">로그인</a>
						</li>
					</c:if>

					<!-- 로그인 상태인 경우 -->
					<c:if test="${sessionScope.id!=null }">
						<li><a class="start" id="logout_header" href="../user/logout.do">로그아웃</a></li>
					</c:if>
				</ul>
				<i class="bi bi-list mobile-nav-toggle"></i>
			</nav>
			<!-- .navbar -->
		</div>
	</header>
</body>
</html>