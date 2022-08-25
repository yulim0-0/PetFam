<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Tour Bus</title>
  <link rel="stylesheet" href="..css/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'>
<link rel="stylesheet" href="pboarddist/pboard_style.css">
<style type="text/css">
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
.pagination ul > li {
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

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
 $("#hit").click(function(){

 
 })
</script> 
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
						<h2>PetBoard</h2>
						<div style="margin-top:20px;">
						<div>
							<a href="../pboard/list_hit.do" class="btn square btn-default best" id="hit"><i
								class="fa fa-star"></i>인기글</a>
							<a href="../pboard/list.do" class="btn square btn-default best" id="hit"><i
								class="fa fa-star"></i>최신글</a>	
						</div>
						<c:if test="${sessionScope.id!=null }">
							<!-- 로그인한 사람만 보임  -->
							<a href="../pboard/insert.do"
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
										&nbsp;&nbsp; 
										<c:if test="${vo.rcount>0 }">
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
 <!-- 페이징  -->					
					<div class="container" align="center">
						<div class="pagination" style="width:200px;">
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
				</div>
			
					
 <!--  게시글 검색 -->
				
					<div class="row">
				<div class="input-group">
					<form class="search-container" method="post" action="../pboard/list.do" class="search_bar large">
						<input type="text" id="search-bar" value="${subject }" name=subject
							placeholder="검색어를 입력해 주세요.">
							 <button type="submit" value="Search" id="findBtn">Search</button>
					</form>
				</div>
			</div>
				
				
				
			
	</div>
	

		
<!-- partial -->
  <script  src="pboarddist/pboard_script.js"></script>
   <script src='//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
   <script  src="../pboard/pboarddist/dist/script.js"></script>
</body>
</html>