<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*,com.sist.dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">

<head>
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/bootstrap/popper.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <script src="js/plugins/plugins.js"></script>
    <script src="js/active.js"></script>
     
    
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    

    <!-- Favicon -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="../petplace/detail_layout/style.css">

</head>

<body>

    
<br><br>
<br><br>
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
                                        <a class="product-img" href="${vo.poster }" title="Product Image">
                                        <img class="d-block w-100" src="${vo.poster }" alt="1">
                                    </a>
                                    </div>
                                  </div>  
                            </div>
                        </div>
                    </div>
				
                    <div class="col-12 col-md-6">
                        <div class="single_product_desc">
                            <h4 class="title">${vo.title}</h4>
                         </div>
                         <div class="one_half first">
						      <table class="table">
						       <tr>
						        <td colspan="2">
						         <h4> <span style="color:orange">상세정보</span></h4>
						        </td>
						       </tr>
						       <tr>
						        <th width=30%>주소</th>
						        <td width=70%>${vo.addr }</td>
						       </tr>
						       <tr>
						        <th width=30%>전화번호</th>
						        <td width=70%>${vo.tel }</td>
						       </tr>
						       <tr>
						       	 <th width=30%>카테고리</th>
						       	 <td width=70%>
						        	<c:if test="${vo.category eq '2' }"> 카페,식당</c:if>
								         <c:if test="${vo.category eq '3' }"> 카페,식당</c:if>  
								        <c:if test="${vo.category eq '11' }"> 공원</c:if>
								        <c:if test="${vo.category eq '1' }"> 펜션</c:if>
								        <c:if test="${vo.category eq '4' }"> 펜션</c:if>
								        <c:if test="${vo.category eq '5' }"> 펜션</c:if>
								        <c:if test="${vo.category eq '6' }"> 펜션</c:if>
								        <c:if test="${vo.category eq '7' }"> 펜션</c:if>
								        <c:if test="${vo.category eq '8' }"> 펜션</c:if>
								        <c:if test="${vo.category eq '9' }"> 펜션</c:if>
						        </td>
						       </tr>
						       
						        <tr>
						       <td colspan="2" class="text-center">
							       
							       <p>
                                	    <span>Share on:</span>
                                    	<span>
	                                    	<a href="#"><i class="fa fa-facebook"></i></a>
	                                    	<a href="#"><i class="fa fa-twitter"></i></a>
	                                    	<a href="#"><i class="fa fa-pinterest"></i></a>
	                                    	<a href="#"><i class="fa fa-google-plus"></i></a>
                                		</span>
                                	   </p>
                                	   
                                	   
							       </td>
							      </tr>
							      </table>            
							    
							    
							    
							                         

                           <!--  <div class="cart--area d-flex flex-wrap align-items-center" > -->
                                <!-- Add to Cart Form -->
                               
                              
                              <div class="wishlist-compare d-flex flex-wrap align-items-center">
                                  <!-- 로그인 된 상태에서 -->
                                   <c:if test="${sessionScope.id!=null }">
                                  	<c:if test="${jcount==0 }">
							        	 <a href="../petplace/jjim.do?c_no=${vo.c_no }" class="btn alazea-btn ml-15">찜하기</a>
							        </c:if>
							        <c:if test="${jcount!=0 }">
							       		  <span class="btn alazea-btn ml-15">찜하기</span>
							        </c:if>
                                	</c:if>
                                
							        <a href="javascript:history.back()" class="btn alazea-btn ml-15">목록</a>
							         
                             </div> 
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
                                <a href="#description" class="nav-link active" data-toggle="tab" role="tab">상세정보</a>
                            </li>
                            <li class="nav-item">
                                <a href="#addi-info" class="nav-link" data-toggle="tab" role="tab">Additional Information</a>
                            </li>
                           
                        </ul>
                        <!-- Tab Content -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="description">
                                <div class="description_area">
                                  <p> ${vo.subtitle } </p>
                                    
                                </div><br>
                                <br>
                                <br>
                            </div>
                             <div role="tabpanel" class="tab-pane fade show active" id="addi-info">
                             <div class="aside" style="width:100%;height:100%;margin:auto;">
						       <div id="map" style="width:100%;height:350px;"></div>
								<p><span>주소:</span> <span>${vo.addr}</span></p>
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
								
							
								geocoder.addressSearch('${vo.addr }', function(result, status) {
								
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
								            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.title }</div>'
								        });
								        infowindow.open(map, marker);
								
								        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        map.setCenter(coords);
								    } 
								});    
								</script>
						    </div>
                             </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Single Product Details Area End ##### -->
  
 
  
   
  

   



    
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