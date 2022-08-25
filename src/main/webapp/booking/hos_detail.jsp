<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
<header id="header" class="fixed-top d-flex align-items-center" style="
    font-family: 'GmarketSansMedium', 'Noto Sans KR', sans-serif;">
		<div class="container d-flex align-items-center justify-content-between">
			<div class="logo">
				<!-- Uncomment below if you prefer to use an image logo -->
				<a href="../main/main.do"><img src="../assets/img/logo.png" alt="" class="img-fluid"></a>
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
						</li></ul> 
						<!--   <li><a class="nav-link scrollto" href="#portfolio" hover="Recommendation")>추천</a></li>-->
					</li><li class="dropdown"><a href="#"><span>추천</span> <i class="bi bi-chevron-down"></i></a>
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

							</li><li class="dropdown"><a href="#"><span>마이</span> <i class="bi bi-chevron-down"></i></a>
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
								</ul>
							</li>


						 <!-- 로그인 상태가 아닌 경우 --> 
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

<head>
    
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="../booking/detaildist/media.css">
    <link rel="stylesheet" href="../booking/detaildist/style.css">

    
	<!-- heart icon library -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
.jjim_btn {
  background-color: #f2f4f5;
  border: none;
  color: grey;
  border-color: 1px solid red;
  padding: 1px 19px;
  font-size: 16px;
  cursor: pointer;
}

.jjim_btn1 {
  background-color: #ffeebc;
  border: none;
  color: #F34100;
  padding: 12px 16px;
  font-size: 16px;
  cursor: pointer;
}

/* Darker background on mouse-over */
.jjim_btn:hover {
  background-color: #ffeebc;
  color: #F34100;
  
  
}
#header .logo h1 a, #header .logo h1 a:hover {
    color: #192f61;
    text-decoration: none;
    padding-left: 12px;
    font-family: geller-headline, serif;
    font-weight: 900;
    font-style: normal;
    font-size: 30px;
}
body {
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 16px;
  color: #707070; }

</style>
</head>

<body>

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="row" style=margin-top:100px;></div>

    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Single Product Details Area Start ##### -->
    <section class="single_product_details_area mb-50">
        <div class="produts-details--content mb-50">
            <div class="container">
                <div class="row justify-content-between">

                    <div class="col-12 col-md-6 col-lg-5">
                        <div class="single_product_thumb">
                            <div id="product_details_slider" class="carousel slide" data-ride="carousel">
                                <div class="carousel-inner">
                                    <div class="carousel-item active">
                                        <a class="product-img" href="http://${vo.poster }" title="Product Image">
                                        <img class="d-block w-100" src="http://${vo.poster }" alt="1">
                                    </a>
                                    </div>
                                  </div>  
                            </div>
                        </div>
                    </div>
				
                    <div class="col-12 col-md-6">
                        <div class="single_product_desc">
                            <h4 class="title">${vo.name }</h4>
                            <h7>${vo.store }</h7>
                            <h4 class="price"> <input type="hidden" value="${vo.price }" id=price>
									   <script>
		                                var n1 = document
		                                        .getElementById("price").value;
		
		                                function numberWithCommas(x) {
		                                    return x
		                                            .toString()
		                                            .replace(
		                                                    /\B(?=(\d{3})+(?!\d))/g,
		                                                    ",");
		                                }
		                                numberWithCommas(n1);
		                                document
		                                        .write(numberWithCommas(n1));
			                            </script> 원</h4>
                            <div class="short_overview">
                                <p>${vo.s_info }</p>
                            </div>

                            <div class="cart--area d-flex flex-wrap align-items-center" >
                                <!-- Reserve -->
  
                               <a href="../booking/booking.do?o_no=${vo.o_no }"><button class="btn alazea-btn ml-15">예약하기</button></a>
                                   
             					  <!-- Wishlist  -->
                                <div class="wishlist-compare d-flex flex-wrap align-items-center">
                                  <!-- 로그인 된 상태에서 -->
                                  <c:if test="${sessionScope.id!=null }"> 
                                 <!-- 찜하기 누를 수 있게 활성화  --> 
                                    <c:if test="${jcount==0 }"> 
                                 	<a href="../booking/jjim.do?o_no=${vo.o_no }"><button class="jjim_btn" ><i class="fa fa-heart"></i></button></a>
                                 	 </c:if> 
                                 <!-- 이미 찜하기 눌렀으면 비활성화  --> 
                                 	<c:if test="${jcount!=0 }"> 
                                 	<button class="jjim_btn1"><i class="fa fa-heart"></i></button>
                                 	 </c:if> 
                                 	</c:if>
                                 </div> 
                                 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="product_details_tab clearfix">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs" role="tablist" id="product-details-tab">
                            <li class="nav-item">
                                <a href="#description" class="nav-link active" data-toggle="tab" role="tab">상품 상세정보</a>
                            </li>
                            <li class="nav-item">
                                <a href="#addi-info" class="nav-link" data-toggle="tab" role="tab">상품 업체위치</a>
                            </li>
                            <li class="nav-item">
                                <a href="#reviews" class="nav-link" data-toggle="tab" role="tab">리뷰 구매평 <span class="text-muted">(1)</span></a>
                            </li>
                        </ul>
                        <!-- Tab Content -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="description">
                                <div class="description_area">
                                    <img src="http://${vo.img }" style=width:100%>
                                    
                                </div><br>
                                <br>
                                <br>
                            </div>
                             <div role="tabpanel" class="tab-pane fade show active" id="addi-info">
                             <div class="aside" style="width:100%;height:100%;margin:auto;">
						       <div id="map" style="width:100%;height:350px;"></div>
								<p><span>주소:</span> <span>${vo.address }</span></p>
								<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b258686433a9d9db37e9d1bbb85cdae3&libraries=services"></script>
								<script>
								var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
								    mapOption = {
								        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								        level: 4 // 지도의 확대 레벨
								    };  
								
								// 지도를 생성합니다    
								var map = new kakao.maps.Map(mapContainer, mapOption); 
								
								// 주소-좌표 변환 객체를 생성합니다
								var geocoder = new kakao.maps.services.Geocoder();
								
								// 주소로 좌표를 검색합니다
								
							
								geocoder.addressSearch('${vo.address }', function(result, status) {
								
								    // 정상적으로 검색이 완료됐으면 
								     if (status === kakao.maps.services.Status.OK) {
								
								        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								
								        // 결과값으로 받은 위치를 마커로 표시합니다
								        var marker = new kakao.maps.Marker({
								            map: map,
								            position: coords
								        });
								
								        // 인포윈도우로 장소에 대한 설명을 표시합니다
								        var infowindow = new kakao.maps.InfoWindow({
								            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.store }</div>'
								        });
								        infowindow.open(map, marker);
								
								        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        map.setCenter(coords);
								    } 
								});    
								</script>
						    </div>
                             </div>
                            <div role="tabpanel" class="tab-pane fade show active" id="reviews">

                                <div class="submit_a_review_area mt-50">
                                    <h4>Reviews</h4>
                                    <form  method="post" action="../booking/review_ok.do" name="review_frm" id="review_frm" >
                                     
                                        <div class="row">
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label for="id" style="font-size: 15px;font-weight: 700;">아이디</label>
                                                    <input type="text" class="form-control" id="id" name="id" value="${id }" readonly>
                                                </div>
                                            </div>
                                          
                                            <div class="col-12 col-md-6">
                                                <div class="form-group">
                                                    <label for="options" style="font-size: 15px;font-weight: 700;">이 평가를 준 이유</label>
                                                    <select class="form-control" id="options" name="options">
                                                          
                                                          <option value="가격">가격</option>
                                                          <option value="서비스">서비스</option>
                                                          <option value="위치">위치</option>
                                                          <option value="기타">기타</option>
                                                    </select>
                                                    <input type="hidden" name="o_no" value="${o_no }">
                                                    <input type="hidden" name="oi_no" value="${ oi_no }">
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <div class="form-group">
                                                    <label for="comments" style="font-size: 15px;font-weight: 700;">리뷰후기</label>
                                                    <textarea class="form-control" id="comments" rows="5" data-max-length="150" name="content"></textarea>
                                                   
                                                </div>
                                            </div>
                                            <div class="col-12">
                                                <button type="submit" class="btn alazea-btn" id="reviewBtn" value="리뷰쓰기">상품 리뷰 쓰기</button>
                                            </div>
                                        </div>
                                        
                                    </form>
                                </div>
                                
                                <div class="reviews_area"><br>
                                <div class="row">
                                   <c:forEach var="vo" items="${list }"> 
                                    <ul>
                                        <li>
                                            <div class="single_user_review mb-15">
                                               
                                                <div class="review-details">
                                                    <p style="font-weight: 700;">리뷰 작성자: &nbsp; <a href="#" style="font-size: 16px;">${vo.id }</a>&nbsp;&nbsp;---- <span>${vo.options }</span> </p>
                                                    <p>${vo.content }</p>
                                                </div>
                                            </div> 
                                        </li>
                                    </ul>
                              </c:forEach> 
                                </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Single Product Details Area End ##### -->
  
 
  
   
  

   



    <!-- ##### Related Product Area Start ##### -->
    <div class="related-products-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center">
                        <h2> HOT 추천 상품</h2>
                    </div>
                </div>
            </div>

            <div class="row">

                <!-- Single Product Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-product-area mb-100">
                        <!-- Product Image -->
                        <div class="product-img">
                            <a href="shop-details.html"><img src="http://mypetplus.co.kr/Upload/Product/Pro_상세메인_교육_1.jpg" alt=""></a>
                            <!-- Product Tag -->
                            <div class="product-tag">
                                <a href="#">Hot</a>
                            </div>
                            <div class="product-meta d-flex">
                                <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                <a href="cart.html" class="add-to-cart-btn">Add to cart</a>
                                
                            </div>
                        </div>
                        <!-- Product Info -->
                        <div class="product-info mt-15 text-center">
                            <a href="shop-details.html">
                                <p>1:1방문교육 - 초롱스쿨</p>
                               
                            </a>
                            <h6>150,000원</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Product Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-product-area mb-100">
                        <!-- Product Image -->
                        <div class="product-img">
                            <a href="shop-details.html"><img src="http://mypetplus.co.kr/Upload/Product/Pro_상세메인_중성화_34.jpg" alt=""></a>
                            <div class="product-meta d-flex">
                                <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                <a href="cart.html" class="add-to-cart-btn">Add to cart</a>
                                
                            </div>
                        </div>
                        <!-- Product Info -->
                        <div class="product-info mt-15 text-center">
                            <a href="shop-details.html">
                                <p>반려견·반려묘 중성화 수술</p>
                            </a>
                            <h6>90,000원</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Product Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-product-area mb-100">
                        <!-- Product Image -->
                        <div class="product-img">
                            <a href="shop-details.html"><img src="http://mypetplus.co.kr/Upload/Product/Pro_상세메인_미용_12.jpg" alt=""></a>
                            <div class="product-meta d-flex">
                                <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                <a href="cart.html" class="add-to-cart-btn">Add to cart</a>
                                
                            </div>
                        </div>
                        <!-- Product Info -->
                        <div class="product-info mt-15 text-center">
                            <a href="shop-details.html">
                                <p>중형견 미용 - 참사랑동물병원</p>
                            </a>
                            <h6>28,000원</h6>
                        </div>
                    </div>
                </div>

                <!-- Single Product Area -->
                <div class="col-12 col-sm-6 col-lg-3">
                    <div class="single-product-area mb-100">
                        <!-- Product Image -->
                        <div class="product-img">
                            <a href="shop-details.html"><img src="http://mypetplus.co.kr/upload/201701041152390.jpg" alt=""></a>
                            <!-- Product Tag -->
                            <div class="product-tag sale-tag">
                                <a href="#">Hot</a>
                            </div>
                            <div class="product-meta d-flex">
                                <a href="#" class="wishlist-btn"><i class="icon_heart_alt"></i></a>
                                <a href="cart.html" class="add-to-cart-btn">Add to cart</a>
                                
                            </div>
                        </div>
                        <!-- Product Info -->
                        <div class="product-info mt-15 text-center">
                            <a href="shop-details.html">
                                <p>예절 및 산책 교육 - 네발아이들</p>
                            </a>
                            <h6>550,000원</h6>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        
        
        
    </div>
    <!-- ##### Related Product Area End ##### -->

    <!-- ##### Footer Area Start ##### -->
   
    <!-- ##### Footer Area End ##### -->

    <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    
    <script src="js/bootstrap/popper.min.js"></script>
   
    <script src="js/bootstrap/bootstrap.min.js"></script>
    
    <script src="js/plugins/plugins.js"></script>
    
    <script src="js/active.js"></script>
</body>

</html>