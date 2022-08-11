
	
	
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- grid css -->

 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" href="../petplace/layout/place_style.css">
</head>
<body>
<br><br><br><b></b><br><br>
 <div class="main">
 <b>반려동물 동반 가능 카페 추천</b>
 
 <br>
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
  
  
        <div class="container" align="center">
  <ul class="pagination">
          <c:if test="${startPage>1 }">
            <li><a href="../petplace/cafe.do?page=${startPage-1 }">&laquo;</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage }" end="${endPage }">
            <c:if test="${i==curpage }">
             
            </c:if>
            <c:if test="${i!=curpage }">
             
            </c:if>
            <li><a href="../petplace/cafe.do?page=${i }">${i }</a></li>
          </c:forEach>
          <c:if test="${endPage<totalpage }">
            <li><a href="../petplace/cafe.do?page=${endPage+1 }">&raquo;</a></li>
          </c:if>
        </ul>
        </div>
 </div>
 
</body>
</html>
