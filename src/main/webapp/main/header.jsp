<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
        <a href="../main/main.do"><img src="../assets/img/logo.png" alt="" class="img-fluid"></a>
        <h1 class="text-light"><a href="../main/main.do"><span>PetFam</span></a></h1>
      </div>

      <nav id="navbar" class="navbar">
        <ul>
<!--           <li><a class="nav-link scrollto active" href="#hero">Home</a></li> -->
          <li class="dropdown"><a href="#"><span>예약</span> <i class="bi bi-chevron-down"></i></a>
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
          
          
          <li class="dropdown"><a href="../pboard/list.do"><span>커뮤니티</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
              <li><a href="../pboard/list.do">자유</a></li>
              <li><a href="#">자랑</a></li>
              <li><a href="#">QnA</a></li>
            </ul>
            
            
          <li class="dropdown"><a href="#"><span>마이</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="../user/join.do">회원가입</a></li>
              <li><a href="#">나의 예약</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">예약 내역</a></li>
              <li><a href="#">예약 현황</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#contact">문의</a></li>
          <li><a class="getstarted scrollto" href="../user/login.do">로그인</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header>
</body>
</html>