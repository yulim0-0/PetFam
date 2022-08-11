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
<link rel="stylesheet" href="pboarddist/pboard_style.css">
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
	          <h2>PetBoard</h2>
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
		           
		                <c:forEach var="vo" items="${list }">
						        <tr>
						          <%--
						              adadadaadad (3) ==> reply ==> insert  freeboard=>rcount++
						              
						              .do ==> DispatcherServlet
						                  ==> ~Model 
						                      @RequestMapping(.do)
						                      메소드 ==> 호출 
						                      {
						                          DB연동 
						                          이동할 JSP지정 
						                      }
						           --%>
						          <td width="10%" class="text-center">${vo.p_no }</td>
						          <td width="45%"><a href="../pboard/detail.do?p_no=${vo.p_no }">${vo.subject }</a>
						            &nbsp;&nbsp;
						            <c:if test="${vo.rcount>0 }">
						             (${vo.rcount })
						             	 <small class="favo"><i class="fa fa-heart"></i></small>
						            </c:if>
						          </td>
						          <td width="15%" class="text-center">${vo.id }</td>
						          <td width="20%" class="text-center">${vo.dbday }</td>
						          <td width="10%" class="text-center">${vo.hit }</td>
						          
						        </tr>
						</c:forEach>
						
				</table>
		 </div>
				     <!--  <table class="table">  원래 기본 
				         <tr>
					         <td class="text-right">
						          <input type="checkbox" name=fd value="name">이름
						          <input type="checkbox" name=fd value="subject">제목
						          <input type="checkbox" name=fd value="content">내용
						          <input type=text name=ss size=15 class="input-sm">
						          <input type=button value=검색 class="btn btn-sm btn-primary">
						         </td>
						  </tr>
						
				<!--    </table>  -->
						
								<div id="article-list-menu">
									<a href="#" class="btn square btn-default best"><i class="fa fa-star"></i>인기글</a> 
									<button class="btn square del btn-danger" type="button" id="deleteAllBtn"><i class="fa fa-trash"></i>삭제</button>
								
									<div class="pagination">
										  <ul class="active">
									          <c:if test="${startPage>1 }">
									            <li><a href="../pboard/list.do?page=${startPage-1 }">&lt;</a></li>
									          </c:if>
									          <c:forEach var="i" begin="${startPage }" end="${endPage }">
									            <c:if test="${i==curpage }">
									             
									            </c:if>
									            <c:if test="${i!=curpage }">
									             
									            </c:if>
									            <li><a href="../pboard/list.do?page=${i }">${i }</a></li>
									          </c:forEach>
									          <c:if test="${endPage<totalpage }">
									            <li><a href="../pboard/list.do?page=${endPage+1 }">&gt;</a></li>
									          </c:if>
									      </ul>
									 </div>
								 </div>
 
									<a href="../pboard/insert.do" class="btn square btn-primary write" id="WriteBtn">
										<i class="fa fa-pencil"></i> 글 쓰기</a>
								</div>
		
								<form class="input-group" method="get" id="boardSearchForm">
									<input type="hidden" name="search_type" value="title"/>
									 <span class="input-group-btn">
										<button type="button"
											class="btn square btn-default dropdown-toggle"
											data-toggle="dropdown" aria-haspopup="true"
											aria-expanded="false">
											<span id="search-type-desc">제목</span> <span class="caret"></span>
										</button>
										
										<ul class="dropdown-menu">
											<li><a href="#" data-value="title">제목</a></li>
											<li><a href="#" data-value="titlecont">제목+내용</a></li>
											<li><a href="#" data-value="nickname">작성자</a></li>
									</ul><!--  원래 div였음 -->
									</span>
									    <input type="text" name="search_term" class="form-control" placeholder="검색어" value=""> 
									    	<span class="input-group-btn">
												<button class="btn square btn-default" type="submit">
													<i class="fa fa-search"></i>
												</button>
											</span>
								</form>
							
						</div>
				 </div>
			 </div>
	  </div>

		
<!-- partial -->
  <script  src="pboarddist/pboard_script.js"></script>
</body>
</html>

















