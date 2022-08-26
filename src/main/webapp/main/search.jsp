<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search Page</title>
<script type="text/javascript">
function hide(){
    document.getElementById("searchMsg").style.display="none";
}
$(function(){
    setInterval(function(){
      $('#searchMsg').hide('blind',{},200)
  },2000);
});
self.setInterval("hide()",3000);
function validation(){
    var searchAll = document.getElementById("searchAll")
    var searchMsg = document.getElementById("searchMsg")
        if (searchAll.value == '') {
            searchAll.focus();
            searchMsg.style.display="block";
            searchMsg.innerHTML="검색어 입력이 필요합니다";
            
            return false;
        }
        else {
            return true;
        }
    }
</script>
<style>
.main {
    padding-top : 140px;
    width:1200px;
    margin : 0 auto;
    color : #212529;
}

/* 검색 시작 */
.insearch-container {
    margin : 80px 0 80px 0;
}

.insearch {
    text-align : center;
}

.insearch-row {
    margin : 0 auto;
    margin-top : 20px;
    width : 100%;
    cursor : pointer;
}
.search-row:hover {
    background : #fff9ed;
}

.insearchBar {
    border : solid 1px;
    width : 800px;
    height : 50px;
    padding : 0 20px;
    margin : 40px 0;
}

.insearchBtn {
    height: 50px;
    width: 80px;
    font-size: 17x;
    text-align: center;
    border: none;
    cursor: pointer;
    background: #ffeebc;
    color: #212529;
    border-radius: 50px;
}
/* 검색 종료 */



/* 상위 구분 시작 */
.subtitle {
    text-align:center;
}
.subline {
    border-bottom: 0.4px solid #212529;
    width : 5%;
    margin : 0 auto;
    margin-bottom : 80px;
    margin-top : 30px
}
/* 상위 구분 종료 */

h2 {
    text-align : center;
    margin: 50px 0;
}
th a {
    width : 80px;
}
.title {
    width : 700px;
}
.no {
    width:80px;
}

td img {
    width:140px;
    height : 80px;
    padding : 0 20px;
}

.search-title {
    display:grid;
    
}

</style>

</head>
<body>
<main class="main">
<h2>[ ${search } ] 검색 결과입니다</h2>

<div class="insearch">
    <form action="../main/search.do" method="post">
		<input placeholder="${search }" type="text" value="${searchAll }" name="searchAll" id="searchAll" class="insearcBar"> 
		<input type=image class="search-icon" src="../assets/img/searchBtn.png">    
    </form>
    <span class="searchMsg" id="searchMsg" ></span>
</div>


<!-- 예약 검색 -->
<div class="insearch-container">
<h4 class="subtitle">예약</h4>
<p class="subline" style="margin-right:608px;"></p>

<c:forEach var="bo" items="${bookList }">
    <div class="insearch-row">
        <table>
	        <tr onclick="location.href='../booking/hos_detail.do?o_no=${bo.o_no}'">
	           <td><img src="http://${bo.poster }"></td>
               <td class="search-title">
                   ${bo.store }
                   <small class="search-detail">${bo.s_info }</small>
               </td>
	        </tr>
	    </table>
    </div>

</c:forEach>
</div>

<!-- 추천 검색 -->
<div class="insearch-container">
<h4 class="subtitle">추천</h4>
<p class="subline"></p>

<c:forEach var="rec" items="${recList }">
    <div class="insearch-row">
        <table>
	        <tr onclick="location.href='../petplace/petplace_detail.do?c_no=${rec.c_no}'">
	           <td><img src="${rec.poster }"></td>
	           <td class="search-title">
	               ${rec.title }
	               <small class="search-detail">${rec.subtitle }</small>
	           </td>

	        </tr>
	    </table>
    </div>

</c:forEach>
</div>

<!-- 커뮤니티 검색 -->
<div class="insearch-container">
<h4 class="subtitle">커뮤니티</h4>
<p class="subline"></p>

<c:forEach var="com" items="${comList }">
	<div class="insearch-row">
		<table>
			<tr onclick="location.href='../pboard/detail.do?p_no=${com.p_no}'">
				<td><img src="../assets/img/community.png" ></td>
				<td class="search-title">${com.subject }</td>
				<td></td>
			</tr>
		</table>
	</div>
</c:forEach>
</div>

</main>
</body>
</html>