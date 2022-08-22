<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.main {
    padding-top : 140px;
    width:800px;
    margin : 0 auto;
}
</style>
</head>
<body>
<main class="main">
<!-- 예약 검색 -->
<div>
<h4>예약</h4>

<c:forEach var="bo" items="${bookList }">
    <table>
        <tr>
            <th><a href="../booking/hos_detail.do?o_no=${bo.o_no}">번호 : ${bo.o_no }</a></th>
            <td>매장 : ${bo.store }</td>
        </tr>
    </table>
</c:forEach>
</div>

<!-- 추천 검색 -->
<div>
<h4>추천</h4>

<c:forEach var="rec" items="${recList }">
    <table>
        <tr>
            <th><a href="../petplace/petplace_detail.do?c_no=${rec.c_no}">번호 : ${rec.c_no }</a></th>
            <td>장소 : ${rec.title }</td>
        </tr>
    </table>
</c:forEach>
</div>

<!-- 커뮤니티 검색 -->
<div>
<h4>커뮤니티</h4>

<c:forEach var="com" items="${comList }">
    <table>
        <tr>
            <th><a href="../pboard/detail.do?p_no=${com.p_no}">번호 : ${com.p_no }</a></th>
            <td>제목 : ${com.subject }</td>
        </tr>
    </table>
</c:forEach>
</div>

</main>
</body>
</html>