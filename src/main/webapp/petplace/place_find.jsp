 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- grid css -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../petplace/layout/place_style.css">

  
  <!-- pagination css-->
 <style type="text/css">
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
</head>
<body>
<br><br><br><b></b><br><br>

<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body --> 
    <h2 class="sectiontitle">지역별 추천장소 찾기</h2>
    <div class="row inline">
      <form method="post" action="../petplace/place_find.do">
       <input type=text name=addr size=35 class="input-sm" value="${addr }">
       <input type=submit value="검색">
      </form>
    </div>
    
<div class="main">
  <ul class="cards">
  <c:forEach var="vo" items="${list }" varStatus="s">
   <c:if test="${s.index%3==0 }">
   <li class="one_quarter first">
   <li class="cards_item">
    <div class="card">
     <div class="card_image"><img src="${vo.poster }"></div>
     
     
     <div class="card_content">
    
      <p class="card_title">${vo.title }</p>
     
      <a href="../petplace/petplace_detail.do?c_no=${vo.c_no }"><button class="btn card_btn">Read More</button></a>
     </div>
    </div>
   </li>
   </li>
  </c:if>
   <c:if test="${s.index%3!=0 }">
   <li class="one_quarter">
   <li class="cards_item">
    <div class="card">
     <div class="card_image"><img src="${vo.poster }"></div>
     <div class="card_content">
     
      <p class="card_title">${vo.title }</p>
      
    <a href="../petplace/petplace_detail.do?c_no=${vo.c_no }"> <button class="btn card_btn">Read More</button></a>
      
     </div>
    </div>
   </li>
   </li>
  </c:if>
  </c:forEach>
  </ul>
    <div class="row">
      <div class="text-center">
        <a href="../petplace/place_find.do?addr=${addr }&page=${curpage>1?curpage-1:curpage}" class="btn btn-sm btn-success">이전</a>
        ${curpage } page / ${totalpage } pages
        <a href="../petplace/place_find.do?addr=${addr }&page=${curpage<totalpage?curpage+1:curpage}" class="btn btn-sm btn-info">다음</a>
      </div>
    </div>
  </main>
</div>
</body>
</html>