<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- grid css -->
<link rel="stylesheet" href="../booking/listdist/list_style.css">
</head>
<body>
 <div class="main">
  <ul class="cards">
  <c:forEach var="vo" items="${list }" varStatus="s">
   <c:if test="${s.index%3==0 }">
   <li class="one_quarter first">
   <li class="cards_item">
    <div class="card">
     <div class="card_image"><img src="http://${vo.poster }"></div>
     <div class="card_content">
      <h2 class="card_store">${vo.store }</h2>
      <p class="card_title">${vo.name }</p>
      <p class="card_price">${vo.price }\</p>
      <button class="btn card_btn">Read More</button>
     </div>
    </div>
   </li>
   </li>
  </c:if>
   <c:if test="${s.index%3!=0 }">
   <li class="one_quarter">
   <li class="cards_item">
    <div class="card">
     <div class="card_image"><img src="http://${vo.poster }"></div>
     <div class="card_content">
      <h2 class="card_store">${vo.store }</h2>
      <p class="card_title">${vo.name }</p>
      <p class="card_price">${vo.price }\</p>
      <button class="btn card_btn">Read More</button>
      
     </div>
    </div>
   </li>
   </li>
  </c:if>
  </c:forEach>
  </ul>
 </div>
</body>
</html>