<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	
	BookingDAO dao=new BookingDAO();
	Cookie[] cookies=request.getCookies(); //쿠키 읽기
	List<BookingVO> bList=new ArrayList<BookingVO>();
	if(cookies!=null)
	{
		for(int i=cookies.length-1;i>=0;i--) // 최신부터 출력 
		{
			if(cookies[i].getName().startsWith("booking")) //movie1
			{
				String o_no=cookies[i].getValue();// 1
				BookingVO vo=dao.hospitalDetailData(Integer.parseInt(o_no));
				bList.add(vo);
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>


  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../booking/listdist/list_style.css">
  
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
.cookie-row{
	display: inline;
}
 </style>
</head>
<body>
 <div class="main">
 <%-- <jsp:include page="filter.jsp"/> --%>
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
      <p class="card_price">${vo.strPrice }원</p>
      <a href="../booking/detail_before.jsp?o_no=${vo.o_no }"><button class="btn card_btn">Read More</button></a>
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
      <p class="card_price">${vo.strPrice }원</p>
     <a href="../booking/detail_before.jsp?o_no=${vo.o_no }"> <button class="btn card_btn">Read More</button></a>
     </div>
    </div>
   </li>
   </li>
  </c:if>
  </c:forEach>
  </ul>
  <!-- paging start-->
  <div class="container" align="center">
		 <div class="pagination">
          <ul>
		  <c:if test="${startPage>1 }">
		   <li><a href="../booking/hospital_list.do?page=${startPage-1 }">&laquo;</a></li>
		  </c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i==curpage }">
		     <li class="active"><a href="../booking/hospital_list.do?page=${i }">${i }</a></li>
			</c:if>
			<c:if test="${i!=curpage }">
		    <li><a href="../booking/hospital_list.do?page=${i }">${i }</a></li>
			</c:if>
		    </c:forEach>
			<c:if test="${endPage<totalpage }">
			 <li><a href="../booking/hospital_list.do?page=${endPage+1 }">&raquo;</a></li>
			</c:if>
		  </ul>
		 </div>
		 </div>
	<!-- paging end-->
 </div>
 	<!-- cookie -->
 	<div style="height: 10px"></div>
 		<div class="cookie-row">
    <h3>최근에 본 상품</h3>
    <hr>
     <%
     	int k=0;
        for(BookingVO vo:bList)
        {
        	if(k>13) break;
     %>
     	<a href="hos_detail.do?o_no=<%= vo.getO_no()%>"> 
          <img src="http://<%=vo.getPoster() %>" style="width: 263px;height: 100px">
     <%
     		k++;
        }
     %>
    </div>
 	<!-- cookie end  -->
</body>
</html>