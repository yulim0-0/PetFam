<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>[Community] 자유게시판</title>
  <link rel="stylesheet" href="../pboard/pboarddist/pboard_style.css">
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'>
 <link rel="stylesheet" href="../ppboard/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="../ppboard/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="../ppboard/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="../ppboard/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="../ppboard/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="../ppboard/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="../ppboard/css/style.css" type="text/css">

<style type="text/css">
.pagination {
    margin: 20px 0;
    overflow: hidden;
    position: relative;
    text-align:center;
}
.pagination li {
    float: left;
}
.pagination ul {
    float: left;
    left: 50%;
    position: relative;
}
.pagination ul > li {
    left: -50%;
    position: relative;
}
.pagination li a {
    transition: all 100ms ease-in-out 0s;
    background-color: /* #F7F7F8; */#FFFF;
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
    background-color: #f34100;;
    color: #FFFFFF;
}
.pagination li.active a {
    background-color: #f34100;;
    color: #FFFFFF;
}
.pagination li.active a:hover {
    color: #FFFFFF;
}

</style>
</head>
<body>
<!-- partial:index.partial.html -->
<div class='app'>
  <div class='pheader'>
    
  </div>
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
          <button type="button" onclick= "location.href='../pboard/list.do'">
	          <span>자유게시판 </span>
	           <i class='fas fa-book'></i>
          </button>
        </li>
        <li>
          <button type="button" onclick= "location.href='../ppboard/list.do'">
            <span>반려동물 자랑 게시판 </span>
            <i class='fas fa-car'></i>
          </button>
        </li>
        <li>
          <button type="button" onclick= "location.href='../qna/list.do'">
            <span>문의 게시판</span>
            <i class='fas fa-cloud'></i>
          </button>
        </li>
         <li>
          <button type="button" onclick= "location.href='../notice/list.do'">
            <span>공지사항</span>
            <i class='fas fa-cloud'></i>
          </button>
        </li>
      </ul>
    </div>
    <div class='main'>
      <div class='main__content'>
        <div class='ptable-card'>
        <div class="row">
	          <h2>Pet Pride Board</h2>
	         <div style="margin-top: 15px;padding-right: 21px;padding-left: 21px;">
	          <a href="#" class="btn square btn-default best"><i class="fa fa-star"></i>인기글</a> 
	             <c:if test="${sessionScope.id!=null }"><!-- 로그인한 사람만 보임  -->
								<a href="../ppboard/insert.do" class="btn square btn-primary write" id="WriteBtn">
								<i class="fa fa-pencil"></i> 글 쓰기</a>
					</c:if>	
				</div>
				</div>	
		          <table class='ptable'>
			   		  <c:forEach var="vo" items="${list }">        
				<div class="col-lg-4 col-md-3">  
                    <div class="row">
                     <!--  <div class="col-lg-4 col-md-4 col-sm-4">  -->
                            <div class="blog__item">
                            
                                <!-- <div class="blog__item__pic"> -->
                                <a href="../ppboard/detail.do?pp_no=${vo.pp_no }">
                                    <img src="../ppboard/test.jpg" alt=""></a>
                                    <input type=hidden name=pp_no size=50 class="input-sm" id="pp_no" value="${vo.pp_no }">
                                <!-- </div> -->
                                <div class="blog__item__text">
                                    <ul>
                                        <li><i class="bi bi-calendar-heart"></i>&nbsp;&nbsp;${vo.dbday }</li>
                                       <i class="bi bi-chat-left-heart"></i>
                                         <li><c:if test="${vo.rcount>0 }">
						             			(${vo.rcount })
						             	 <small class="favo"></small>
						           		 </c:if></li>
						           		 <li><i class="bi bi-eye"></i>&nbsp;&nbsp;${ vo.hit }</li>
                                    </ul>
                                    <ul><li>작성자 :</li><li> ${vo.id }</li></ul>
                                    <h5><a href="../ppboard/detail.do?pp_no=${vo.pp_no }">${vo.subject }</a></h5>
                                    <ul>${vo.content }</ul>
                                </div>
                            </div>
                        </div>
                      </div>
              </c:forEach>
				</table>
		 </div>
								<div class="container" align="center">
									<div class="pagination" style="width:200px;">
										<ul>
											<c:if test="${startPage>1 }">
												<li><a href="../pboard/list.do?page=${startPage-1 }">&laquo;</a></li>
											</c:if>
											<c:forEach var="i" begin="${startPage }" end="${endPage }">
												<c:if test="${i==curpage }">
													<li class="active"><a href="../pboard/list.do?page=${i }">${i }</a></li>
												</c:if>
												<c:if test="${i!=curpage }">
													<li><a href="../pboard/list.do?page=${i }">${i }</a></li>
												</c:if>
											</c:forEach>
											<c:if test="${endPage<totalpage }">
												<li><a href="../pboard/list.do?page=${endPage+1 }">&raquo;</a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
			
								</div>
		<!-- 검색  -->
								<form class="search_bar large">
									  <div class="search_dropdown" style="width: 16px;">
									    <span >제목+내용</span>
									    <ul>
									      <li class="selected" value="T" >제목+내용</li>
									      <li value="A">제목</li>
									      <li value="TA">작성자</li>
									    </ul>
									  </div>
									
									  <input type="text" placeholder="검색어를 입력해 주세요." id="keyword" autocomplete=off/>
									  <input type="hidden" id="page" value="${curpage }">
							          <input type="hidden" id="cno" value="${curcno}">
							      <div class="input-group-append">
									  <button type="submit" value="Search" id="findBtn">Search</button>
								  </div>
								</form> 
							
						</div>
				 </div>
			 </div>
	  </div>

		
<!-- partial -->
  <script  src="../pboard/pboarddist/pboard_script.js"></script>
</body>
</html>

















