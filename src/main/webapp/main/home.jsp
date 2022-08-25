<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8244d253186302ea3726a5f1803e7dfe"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<script type="text/javascript">
function jjBtn(){
    
    alert('좋아요 완료! \n좋아요를 누른 상품은 마이페이지에서 확인하실 수 있습니다');
}
function hide(){
    document.getElementById("searchMsg").style.display="none";
}
$(function(){
    setInterval(function(){
      $('#searchMsg').hide('blind',{},200)
  },2000);
});
self.setInterval("hide()",3000);
function validation(){
    var searchAll = document.getElementById("searchAll")
    var searchMsg = document.getElementById("searchMsg")
        if (searchAll.value == '') {
            searchAll.focus();
            searchMsg.style.display="block";
            searchMsg.innerHTML="검색어 입력이 필요합니다";
            
            return false;
        }
        else {
            return true;
        }
    }
</script>
</head>
<body>
<main id="main">
    <section id="hero" class="d-flex align-items-center">
        <div class="container">
          <div class="row gy-4">
            <div class="col-lg-6 order-2 order-lg-1 d-flex flex-column justify-content-center">
              <h1>Service for the busy worker who wants to spend time with your fluffy friends</h1>
              <h2>털복숭이 친구들과 함께 하고싶은 바쁜 직장인을 위해</h2>
              <div>
                <c:if test="${sessionScope.id!=null }">
                    <a href="../booking/hospital_list.do" class="btn-get-started scrollto">예약하러 가기</a>
                </c:if>
                <c:if test="${sessionScope.id==null }">
                    <a href="../user/login.do" class="btn-get-started scrollto">예약하러 가기</a>
                </c:if>
              </div>
            </div>
            <div class="col-lg-6 order-1 order-lg-2 hero-img">
              <img src="../assets/img/main_dogcat.png" class="img-fluid animated" alt="">
            </div>
          </div>
        </div>
    </section>


    <!-- ======= Searchbar Section ======= -->
    <section id="searchbar">
        <div class="search-container">
            <form method="post" action="../main/search.do" onsubmit="return validation();">
                <input placeholder="Search" type="text" value="${searchAll }" name="searchAll" id="searchAll" class="searchbar">
                <input type=image class="search-icon" id=searchBtn src="../assets/img/searchBtn.png">
            </form>
            <span class="searchMsg" id="searchMsg" ></span>
        </div>
    </section>
    <!-- End Services Section -->



        <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
      <div class="container" data-aos="fade-up">
        <div class="section-title">
          <h2>Recommendation</h2>
          <p>펫펨이 추천하는 이번 주말 반려견과의 외출</p>
        </div>

            <div class="row"style="justify-content : space-evenly;word-break : keep-all;">
            
              <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100" >
                    
                     <div class="icon-box">
                     <p>카페/식당</p>
                     <a href="../petplace/cafe.do">
                           <img src="http://appdata.hungryapp.co.kr/images/hatdog/ar/2020_02/M158129527416974249.jpg" class="img-fluid" >
                     </a>
                      <h4 class="title"><br>트윈트리</h4>
                      <p class="description">경기도 남양주시 고산로126번길 33-8</p>
                    </div>
                      
              </div>
        
               
          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="200">
            <div class="icon-box">
            <p>공원</p>
            <a href="../petplace/park.do">
             <img src="http://appdata.hungryapp.co.kr/images/hatdog/ar/2022_08/M166122896920548193.jpg" class="img-fluid" alt="">
             </a>
              <h4 class="title"><a href=""><br>물빛찬 수변공원</a></h4>
              <p class="description">세종특별자치시 한누리대로 157</p>
            </div>
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="300">
            <div class="icon-box">
            <p>펜션</p>
            <a href="../petplace/pension.do">
           <img src="http://appdata.hungryapp.co.kr/images/hatdog/ar/2022_04/M165086934703313193.jpg" class="img-fluid" alt="">
           </a>
              <h4 class="title"><a href=""><br>오색애견펜션</a></h4>
              <p class="description">경상북도 김천시 남면 오봉로 362</p>
            </div>
          </div>

        
          </div>
        </div>
      </div>
    </section><!-- End Services Section -->

    <section id="portfolio" class="portfolio">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Booking</h2>
          <p>예약 Top3</p>
        </div>

        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-12">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">전체</li>
              <li data-filter=".filter-app">병원</li>
              <li data-filter=".filter-card">훈련</li>
              <li data-filter=".filter-web">미용</li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container" data-aos="fade-up" data-aos-delay="200">

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="https://www.mypetplus.co.kr/Upload/Product/Pro_%EC%83%81%EC%84%B8%EB%A9%94%EC%9D%B8_%EC%A4%91%EC%84%B1%ED%99%94_34.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
              <c:if test="${sessionScope.id!=null }"> 
                <a href="../booking/jjim.do?o_no=19" onclick="jjBtn()" title="좋아요 추가"><i class="bi bi-plus"></i></a>
                </c:if>
                <a href="../booking/hos_detail.do?o_no=19" title="상세보기"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <p>플러스동물메디컬센터</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="https://www.mypetplus.co.kr/Upload/Product/Pro_%EC%83%81%EC%84%B8%EB%A9%94%EC%9D%B8_52.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <c:if test="${sessionScope.id!=null }"> 
                <a href="../booking/jjim.do?o_no=231" onclick="jjBtn()" title="좋아요 추가"><i class="bi bi-plus"></i></a>
                </c:if>
                <a href="../booking/hos_detail.do?o_no=231" title="상세보기"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <p>순수동물병원</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app">
            <div class="portfolio-wrap">
              <img src="https://www.mypetplus.co.kr/Upload/Product/Pro_%EC%83%81%EC%84%B8%EB%A9%94%EC%9D%B8_%EC%A4%91%EC%84%B1%ED%99%94_44.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
               <c:if test="${sessionScope.id!=null }"> 
                <a href="../booking/jjim.do?o_no=25" title="좋아요 추가"><i class="bi bi-plus"></i></a>
                </c:if>
                <a href="../booking/hos_detail.do?o_no=25" title="상세보기"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <p>치료해주오 광명점</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="https://www.mypetplus.co.kr/Upload/Product/Pro_%EC%83%81%EC%84%B8%EB%A9%94%EC%9D%B8_%EA%B5%90%EC%9C%A1_1.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <c:if test="${sessionScope.id!=null }"> 
                <a href="../booking/jjim.do?o_no=1" onclick="jjBtn()" title="좋아요 추가"><i class="bi bi-plus"></i></a>
                </c:if>
                <a href="../booking/hos_detail.do?o_no=1" title="상세보기"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <p>초롱스쿨 반려견교육센터</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="https://www.mypetplus.co.kr/Upload/Product/Pro_%EC%83%81%EC%84%B8%EB%A9%94%EC%9D%B8_%EC%95%84%EC%B9%B4%EB%8D%B0%EB%AF%B8.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <c:if test="${sessionScope.id!=null }"> 
                <a href="../booking/jjim.do?o_no=2" onclick="jjBtn()" title="좋아요 추가"><i class="bi bi-plus"></i></a>
                </c:if>
                <a href="../booking/hos_detail.do?o_no=2" title="상세보기"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <p>바우라움서울캠퍼스</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card">
            <div class="portfolio-wrap">
              <img src="https://www.mypetplus.co.kr/Upload/Product/Pro_%EC%83%81%EC%84%B8%EB%A9%94%EC%9D%B8_%EC%B9%B4%EB%B0%8D%EC%8B%9C%EA%B7%B8%EB%84%90.jpg" data-gallery="portfolioGallery" class="img-fluid" alt="">
              <div class="portfolio-links">
                <c:if test="${sessionScope.id!=null }"> 
                <a href="../booking/jjim.do?o_no=3" onclick="jjBtn()" title="좋아요 추가"><i class="bi bi-plus"></i></a>
                </c:if>
                <a href="../booking/hos_detail.do?o_no=3" title="상세보기"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <p>조이플마인드케어</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
              <img src="https://www.mypetplus.co.kr/Upload/Product/Pro_%EC%83%81%EC%84%B8%EB%A9%94%EC%9D%B8_6.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <c:if test="${sessionScope.id!=null }"> 
                <a href="../booking/jjim.do?o_no=12" onclick="jjBtn()" title="좋아요 추가"><i class="bi bi-plus"></i></a>
                </c:if>
                <a href="../booking/hos_detail.do?o_no=12" title="상세보기"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <p>도그플러스 애견미용</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
              <img src="https://www.mypetplus.co.kr/Upload/Product/Pro_%EC%83%81%EC%84%B8%EB%A9%94%EC%9D%B8_%EA%B3%A0%EC%96%91%EC%9D%B4%EB%AF%B8%EC%9A%A9.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <c:if test="${sessionScope.id!=null }"> 
                <a href="../booking/jjim.do?o_no=8" onclick="jjBtn()" title="좋아요 추가"><i class="bi bi-plus"></i></a>
                </c:if>
                <a href="../booking/hos_detail.do?o_no=8" title="상세보기"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <p>우리들동물종합병원</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web">
            <div class="portfolio-wrap">
              <img src="https://www.mypetplus.co.kr/upload/201710092001410.jpg" class="img-fluid" alt="">
              <div class="portfolio-links">
                <c:if test="${sessionScope.id!=null }"> 
                <a href="../booking/jjim.do?o_no=14" onclick="jjBtn()" title="좋아요 추가"><i class="bi bi-plus"></i></a>
                </c:if>
                <a href="../booking/hos_detail.do?o_no=14" title="상세보기"><i class="bi bi-link"></i></a>
              </div>
              <div class="portfolio-info">
                <p>잇츠그루밍타임</p>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Portfolio Section -->


  <!-- ======= F.A.Q Section ======= -->
   
    <section id="faq" class="faq section-bg">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>F.A.Q</h2>
          <p>Frequently Asked Questions</p>
        </div>
        
        
        <div class="inner">
            
              <ul class="faq-list1" data-aos="fade-up" data-aos-delay="100">
    
              <li>
                <a id="faq1" data-bs-toggle="collapse" class="collapsed question" href="#faq1">펫팸은 어떤 서비스를 제공하나요?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></a>
                <div id="faq1" class="collapse" data-bs-parent=".faq-list1">
                  <p>
                    저희는 국내 최고 반려동물 전문가들의 교육을 받은 펫시터분들의 전문 케어와 픽업 서비스 등 이용가능한 다양한 서비스 옵션을 제공하고 있습니다. 또한, 프리미엄 안전보장 프로그램과 모바일 앱을 통해 간단하고 쉽게 서비스를 이용할 수 있습니다.
                  </p>
                </div>
              </li>
    
              <li>
                <a data-bs-toggle="collapse" href="#faq2" class="collapsed question">예약 취소 및 환불 규정은 어떻게 되나요?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></a>
                <div id="faq2" class="collapse" data-bs-parent=".faq-list1">
                  <p>
                    예약 취소에 따른 환불 가능 금액은 체크인 전 시간에 따라 달라집니다. 체크인 시간을 기준으로 3일(72시간) 전 취소 시 100% 환불, 3일(72시간) 이내 취소 시 50% 환불됩니다. 1일(24시간) 이내 취소 시엔 환불이 불가하고 조기 서비스 종료 시에도 남은 일수에 해당하는 금액 또한 환불 불가합니다. 다만, 펫시터님의 요청 수락 이후 (매칭 이후) 2시간 이내 취소는 전액 환불이 가능합니다. 예약 변경은 예약 취소 후 다시 예약 신청하셔야 하며, 되도록이면 5일 이전에 해주시길 바랍니다. 예약일 연장에 대해서는 앱 내 [ 프로필 > 고객센터 > 채팅문의/전화문의 ] 로 연락주시면 친절히 안내드리겠습니다.
                  </p>
                </div>
              </li>
    
              <li>
                <a data-bs-toggle="collapse" href="#faq3" class="collapsed question">훈련 예약시 반려동물을 추가하면 비용이 어떻게 되나요?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></a>
                <div id="faq3" class="collapse" data-bs-parent=".faq-list1">
                  <p>
                   맡기시는 반려동물이 2마리 이상일 경우 2번째 반려동물부터 할인된 비용이 적용될 수 있습니다. 각 이용업체마다 0~20000원 사이의 할인 금액이 있을 수 있으니 유의바랍니다. 
                  </p>
                </div>
              </li>
    
              <li>
                <a data-bs-toggle="collapse" href="#faq4" class="collapsed question">예약 대기상태는 무엇인가요?<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></a>
                <div id="faq4" class="collapse" data-bs-parent=".faq-list1">
                  <p>
                    펫팸은 이용업체에서 예약 요청을 승인해야 매칭이 완료됩니다. 예약 대기상태란 아직 이용업체가 예약을 승인하기 전 대기상태를 말합니다. 이 상태에서는 결제가 이뤄지지 않습니다. 24시간 내로 승인하지 않으면 자동으로 예약은 취소됩니다.
                  </p>
                </div>
              </li>
            </ul>
            
              <ul class="faq-list2" data-aos="fade-up" data-aos-delay="100">
    
              <li>
                <a data-bs-toggle="collapse" class="collapsed question" href="#faq5">예약된 체크인 또는 체크아웃 시간보다 늦어졌어요.<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></a>
                <div id="faq5" class="collapse" data-bs-parent=".faq-list2">
                  <p>
                    먼저 체크인 또는 체크아웃 시간보다 늦어지는 경우 반드시 펫시터님께 연락해서 얼만큼 늦어지게 되는 지 연락해주세요. 체크아웃이 늦어지는 경우는 펫시터님이 늦어진 시간 만큼 추가금 결제 요청을 할 수 있습니다.
                  </p>
                </div>
              </li>
    
              <li>
                <a data-bs-toggle="collapse" href="#faq6" class="collapsed question">예약이 확정되고 난 후, 날짜를 다시 변경하고 싶어요<i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></a>
                <div id="faq6" class="collapse" data-bs-parent=".faq-list2">
                  <p>
                    날짜를 다시 변경하시고 싶은 경우, 예약을 취소하고 다시 예약요청을 하셔야합니다. 만약 예약을 취소함으로써 수수료가 발생하는 경우, 고객센터(070-4756-2223)으로 문의해주시면 수수료 환불이 가능합니다.
                  </p>
                </div>
              </li>
    
              <li>
                <a data-bs-toggle="collapse" href="#faq7" class="collapsed question">펫팸을 탈퇴하고 싶어요 <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></a>
                <div id="faq7" class="collapse" data-bs-parent=".faq-list2">
                  <p>
                     하단의 프로필 탭을 누르면 환경설정에서 회원 탈퇴가 가능합니다. 회원 탈퇴시 이전의 대화, 일지는 모두 볼 수 없게 됩니다. 신중히 진행해주시길 부탁드립니다.
                  </p>
                </div>
              </li>
    
              <li>
                <a data-bs-toggle="collapse" href="#faq8" class="collapsed question">아이디랑 비밀번호를 잃어버렸어요. 어떻게 다시 찾죠? <i class="bi bi-chevron-down icon-show"></i><i class="bi bi-chevron-up icon-close"></i></a>
                <div id="faq8" class="collapse" data-bs-parent=".faq-list2">
                  <p>
                    첫 화면에서 로그인 버튼을 눌러 아이디,비밀번호 찾기 버튼을 누르면 아이디 혹은 비밀번호를 찾을 수 있는 페이지로 이동합니다. 아이디의 경우 실명과 휴대폰 번호, 비밀번호의 경우 가입한 아이디를 입력하고 찾기 버튼을 누르면 문자로 해당내용을 받아보실 수 있습니다.
                  </p>
                </div>
              </li>
             </div>
            </ul>  
       </div>

    </section><!-- End F.A.Q Section -->
  
  
    <!-- ======= Team Section ======= -->
    <section id="team" class="team">
      <div class="container">
        <div class="section-title" data-aos="fade-up">
          <h2>Team</h2>
          <p>4조를 소개합니다</p>
        </div>

        <div class="row" style="justify-content : space-evenly;">
          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="100">
            <div class="member">
              <img src="../assets/img/team/team-1.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>김예빈</h4>
                  <span>Chief Executive Officer</span>
                </div>
                <div class="social">
                  <a href="https://github.com/sist-varm/sist_webStudy"><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="200">
            <div class="member">
              <img src="../assets/img/team/team-2.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>정희선</h4>
                  <span>Product Manager</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="300">
            <div class="member">
              <img src="../assets/img/team/team-3.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>김유림</h4>
                  <span>CTO</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
        </div>
          
          
        <div class="row" style="justify-content : space-evenly;">
          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="400">
            <div class="member">
              <img src="../assets/img/team/team-4.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>김지연</h4>
                  <span>Accountant</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="400">
            <div class="member">
              <img src="../assets/img/team/team-5.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>김명우</h4>
                  <span>Accountant</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
          
          <div class="col-xl-3 col-lg-4 col-md-6" data-aos="zoom-in" data-aos-delay="400">
            <div class="member">
              <img src="../assets/img/team/team-6.png" class="img-fluid" alt="">
              <div class="member-info">
                <div class="member-info-content">
                  <h4>백송이</h4>
                  <span>Accountant</span>
                </div>
                <div class="social">
                  <a href=""><i class="bi bi-twitter"></i></a>
                  <a href=""><i class="bi bi-facebook"></i></a>
                  <a href=""><i class="bi bi-instagram"></i></a>
                  <a href=""><i class="bi bi-linkedin"></i></a>
                </div>
              </div>
            </div>
          </div>
          

        </div>

      </div>
    </section><!-- End Team Section -->


    <!-- ======= Contact Us Section ======= -->
    <section id="contact" class="contact">
      <div class="container" data-aos="fade-up">

        <div class="section-title">
          <h2>Contact Us</h2>
          <p>문의 사항은 여기로</p>
        </div>

        <div class="row">

          <div class="col-lg-5 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
            <div class="info">
              <div class="address">
                <i class="bi bi-geo-alt"></i>
                <h4>Location:</h4>
                <p style="padding: 0 0 10px 60px; margin-bottom: -10px;
                font-size: 14px; color: #ab9d95;">서울특별시 강남구 테헤란로 132(역삼동)</p>
                <p>한독약품빌딩 8층 쌍용교육센터</p>
              </div>

              <div class="email">
                <i class="bi bi-envelope"></i>
                <h4>Fax:</h4>
                <p>02-3482-4636</p>
              </div>

              <div class="phone">
                <i class="bi bi-phone"></i>
                <h4>Call:</h4>
                <p>02-3482-4632~5 </p>
              </div>
              <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.365821638151!2d127.0310121152449!3d37.49928923573424!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca1c32408f9b7%3A0x4e3761a4f356d1eb!2z7IyN7Jqp6rWQ7Jyh7IS87YSw!5e0!3m2!1sko!2skr!4v1659323879797!5m2!1sko!2skr" frameborder="0" style="border:0; width: 100%; height: 290px;" allowfullscreen></iframe>
            </div>
          </div>

   
<script type="text/javascript">
    (function() {
        // https://dashboard.emailjs.com/admin/account
        emailjs.init('hkOrVKRr6wLdONLRw');
    })();
</script>
   
   
<script type="text/javascript">
function clearInput(){
	var input=document.getElementsByClass('form-control');
	
	for(var i=0; i<input.length; i++) {
		input[i].value='';
	}
	
	
}
    window.onload = function() {
        document.getElementById('contact-form').addEventListener('submit', function(event) {
            event.preventDefault();
            // generate a five digit number for the contact_number variable
            this.contact_number.value = Math.random() * 100000 | 0;
            // these IDs from the previous steps
            emailjs.sendForm('service_95ddbb4', 'template_f7gf3it', this)
                .then(function() {
                    console.log('SUCCESS!');
                    var msg = document.getElementById("sent-message")
                    msg.style.display="block"
                    clearInput();
                }, function(error) {
                    console.log('FAILED...', error);
                });
        });
    }
</script>

            <!-- Contact Us < Email to Us Start -->
          <div class="col-lg-7 mt-5 mt-lg-0 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="200">
            <!-- <form action="forms/contact.php" method="post" role="form" class="php-email-form"> -->
            <form action="" id="contact-form" class="php-email-form">
                <input type="hidden" name="contact_number">
              <div class="row">
                <div class="form-group col-md-6">
                  <label for="name">Your Name</label>
                  <input type="text" name="user_name" class="form-control" id="name" placeholder="Your Name" required>
                </div>
                <div class="form-group col-md-6 mt-3 mt-md-0">
                  <label for="name">Your Email</label>
                  <input type="email" class="form-control" name="user_email" id="email" placeholder="Your Email" required>
                </div>
              </div>
              <div class="form-group mt-3">
                <label for="name">Subject</label>
                <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject" required>
              </div>
              <div class="form-group mt-3">
                <label for="name">Message</label>
                <textarea class="form-control" name="message" rows="10" required></textarea>
              </div>
              
              <div class="my-3">
                <div class="loading">Loading</div>
                <div class="sent-message" id="sent-message">Your message has been sent. Thank you!</div>
              </div>
              
              <div class="text-center"><button type="submit" onclick="clearInput();">Send Message</button></div>
            </form>
          </div>
        <!-- Contact Us < Email to Us Start -->
        </div>

      </div>
    </section><!-- End Contact Us Section -->

  </main>
</body>
</html>