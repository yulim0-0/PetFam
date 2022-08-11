<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Tour Bus</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'>
<!--  <link rel="stylesheet" type="text/css" href="https://d4fodtu7cqfym.cloudfront.net/fad0d3bf8c478ce27ec4b20657d43000.min.css?v=200103-10"> -->
<link rel="stylesheet" href="../pboard/pboarddist/pboard_style.css">
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
       <!--  <div class='dashcards'>
          <div class='col'>
            <div class='card'>
              <i class='fas fa-home'></i>
              <h5 class='card__subtitle'>Subtitle</h5>
              <h2 class='card__title'>Title</h2>
              <p class='card__extra'>Simple Information</p>
            </div>
          </div>
          <div class='col'>
            <div class='card'>
              <i class='fas fa-home'></i>
              <h5 class='card__subtitle'>Subtitle</h5>
              <h2 class='card__title'>Title</h2>
              <p class='card__extra'>Simple Information</p>
            </div>
          </div>
          <div class='col'>
            <div class='card' id='tour-card'>
              <i class='fas fa-home'></i>
              <h5 class='card__subtitle'>Subtitle</h5>
              <h2 class='card__title'>Title</h2>
              <p class='card__extra'>Simple Information</p>
            </div>
          </div>
        </div> -->
        <div class='ptable-card'>
	          <h2>Qna</h2>
		          <table class='ptable'>
			           <thead>
			              <tr>
					          <td width="10%" class="text-center">번호</td>
					          <td width="45%" class="text-center">제목</td>
					          <td width="15%" class="text-center">이름</td>
					          <td width="20%" class="text-center">작성일</td>
					          <td width="10%" class="text-center">조회수</td>
					        </tr>
			            </thead>
		           
		                <c:forEach var="vo" items="${list }">
						        <tr>
						          <td width="10%" class="text-center">${vo.q_no }</td>
						          <td width="45%">
						             <c:if test="${vo.group_tab==1 }">
						           		 &nbsp;&nbsp;
						             <img src="../qna/re_icon.gif">
						             	<!--  <small class="favo"><i class="fa fa-heart"></i></small> -->
						            </c:if>
						            <a href="../qna/detail.do?q_no=${vo.q_no }">${vo.subject }</a>
						          </td>
						          <td width="15%" class="text-center">${vo.name }</td>
						          <td width="20%" class="text-center">${vo.dbday }</td>
						          <td width="10%" class="text-center">${vo.hit }</td>
						        </tr>
						</c:forEach>
				</table>
		 </div>		
								<div id="article-list-menu">
									<!-- <a href="#" class="btn square btn-default best"><i class="fa fa-star"></i>인기글</a> --> 
								<!-- 	<button class="btn square del btn-danger" type="button" id="deleteAllBtn"><i class="fa fa-trash"></i>삭제</button> -->
								
							
								  <div class="container" align="center">
									  <ul class="pagination">
									          <c:if test="${startPage>1 }">
									            <li><a href="../qna/list.do?page=${startPage-1 }">&laquo;</a></li>
									          </c:if>
									          <c:forEach var="i" begin="${startPage }" end="${endPage }">
									            <c:if test="${i==curpage }">
									             
									            </c:if>
									            <c:if test="${i!=curpage }">
									             
									            </c:if>
									            <li><a href="../qna/list.do?page=${i }">${i }</a></li>
									          </c:forEach>
									          <c:if test="${endPage<totalpage }">
									            <li><a href="../qna/list.do?page=${endPage+1 }">&raquo;</a></li>
									          </c:if>
									        </ul>
									        </div>
									 </div>
 
									<a href="../qna/insert.do" class="btn square btn-primary write" id="WriteBtn"><i class="fa fa-pencil"></i> 글 쓰기</a>
								</div>
		
								
						
						</div>
				 </div>
			 </div>
	  </div>

		
<!-- partial -->
  <script  src="../pboard/pboarddist/pboard_script.js"></script>
</body>
</html>

















