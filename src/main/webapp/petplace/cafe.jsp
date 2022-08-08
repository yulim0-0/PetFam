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
  
  <link rel="stylesheet" href="../petplace/layout/list_style.css">
</head>
<body>

<br><br><br><br><br><br><br><br><br><br>
 <div class="main">
  <ul class="cards">
  <c:forEach var="vo2" items="${list2 }" varStatus="s2">
   <c:if test="${s2.index%3==0 }">
   <li class="one_quarter first">
   <li class="cards_item">
    <div class="card">
     <div class="card_image"><img src="http://${vo2.poster }"></div>
     <div class="card_content">
      <h2 class="card_store">${vo2.store }</h2>
      <p class="card_title">${vo2.name }</p>
      <p class="card_price">${vo2.price }\</p>
      <a href="../petplace/place_detail.do?o_no=${vo2.c_no }"><button class="btn card_btn">Read More</button></a>
     </div>
    </div>
   </li>
   </li>
  </c:if>
   <c:if test="${s2.index%3!=0 }">
   <li class="one_quarter">
   <li class="cards_item">
    <div class="card">
     <div class="card_image"><img src="http://${vo2.poster }"></div>
     <div class="card_content">
    
      <p class="card_title">${vo2.name }</p>
    
     <a href="../petplace/place_detail.do?c_no=${vo2.c_no }"> <button class="btn card_btn">Read More</button></a>
      
     </div>
    </div>
   </li>
   </li>
  </c:if>
  </c:forEach>
  </ul>
  
  
        <div class="container" align="center">
  <ul class="pagination">
          <c:if test="${startPage2>1 }">
            <li><a href="../petplace/place_list.do?page=${startPage2-1 }">&laquo;</a></li>
          </c:if>
          <c:forEach var="i" begin="${startPage2 }" end="${endPage2 }">
            <c:if test="${i==curpage2 }">
             
            </c:if>
            <c:if test="${i!=curpage2 }">
             
            </c:if>
            <li><a href="../petplace/place_list.do?page=${i }">${i }</a></li>
          </c:forEach>
          <c:if test="${endPage2<totalpage2 }">
            <li><a href="../petplace/place_list.do?page=${endPage2+1 }">&raquo;</a></li>
          </c:if>
        </ul>
        </div>
        
        
        
        
        
        <br><br><br><br><br><br><br><br><br>
        
        오류로 인해 수정중
		
 </div>
 
</body>
</html>