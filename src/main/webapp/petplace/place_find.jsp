<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.sist.dao.*,com.sist.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	
	PetplaceDAO dao=new PetplaceDAO();
	Cookie[] cookies=request.getCookies(); //쿠키 읽기
	List<PetplaceVO> List=new ArrayList<PetplaceVO>();
	if(cookies!=null)
	{
		for(int i=cookies.length-1;i>=0;i--) // 최신부터 출력 
		{
			if(cookies[i].getName().startsWith("petplace")) //movie1
			{
				String c_no=cookies[i].getValue();// 1
				PetplaceVO vo=dao.petplaceDetailData(Integer.parseInt(c_no));
				List.add(vo);
			}
		}
	}
%>

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
<br><br><br><br><br>

<div class="wrapper row3" align="center">
  <main class="container clear"> 
    <!-- main body --> 
    <h2 class="card_title">지역명 검색 추천</h2>
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
     <div class="card_image"><img src="${vo.poster }" class="img2"></div>
     
     
     <div class="card_content">
     
      <b class="card_title">${vo.title }</b> <br> ${addr }
    
     
      <a href="../petplace/placedetail_before.jsp?c_no=${vo.c_no }"><button class="btn card_btn">Read More</button></a>
     </div>
    </div>
   </li>
   </li>
  </c:if>
   <c:if test="${s.index%3!=0 }">
   <li class="one_quarter">
   <li class="cards_item">
    <div class="card">
     <div class="card_image"><img src="${vo.poster }" class="img2"></div>
     <div class="card_content">
     
      <b class="card_title">${vo.title }</b><br> ${addr }
     
    <a href="../petplace/placedetail_before.jsp?c_no=${vo.c_no }"> <button class="btn card_btn">Read More</button></a>
      
     </div>
    </div>
   </li>
   </li>
  </c:if>
  </c:forEach>
  </ul>
   <%--  <div class="container" align="center">
      <div class="pagination" align="center">
       <a href="../petplace/place_find.do?addr=${addr }&page=${curpage>1?curpage-1:curpage}">이전</a>
        ${curpage } page / ${totalpage } pages
        <a href="../petplace/place_find.do?addr=${addr }&page=${curpage<totalpage?curpage+1:curpage}">다음</a> --%>
      <!-- paging start-->
  <div class="container" align="center">
		 <div class="pagination">
          <ul>
         
		  <c:if test="${startPage>1 }">
		   <li><a href="../petplace/place_find.do?addr=${addr }&page=${startPage-1 }">&laquo;</a></li>
		  </c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${i==curpage }">
		     <li class="active"><a href="../petplace/place_find.do?addr=${addr }&page=${i }">${i }</a></li>
			</c:if>
			<c:if test="${i!=curpage }">
		    <li><a href="../petplace/place_find.do?addr=${addr }&page=${i }">${i }</a></li>
			</c:if>
		    </c:forEach>
			<c:if test="${endPage<totalpage }">
			 <li><a href="../petplace/place_find.do?addr=${addr}&page=${endPage+1 }">&raquo;</a></li>
			</c:if>
		  </ul>
		 </div>
		 </div>
	<!-- paging end-->
      </div>
    </div>
  </main>
</div>


<div style="height: 10px"></div>
 		<div class="cookie-row">
    <h3>최근에 본 장소</h3>
    <hr>
     <%
     	int k=0;
        for(PetplaceVO vo:List)
        {
        	if(k>13) break;
     %>
     	<a href="petplace_detail.do?c_no=<%= vo.getC_no()%>"> 
          <img src="<%=vo.getPoster() %>" style="width: 263px;height: 100px"></a>
     <%
     		k++;
        }
     %>
    </div>
 	<!-- cookie end  -->
</body>
</html>