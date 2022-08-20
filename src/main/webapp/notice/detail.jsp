<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'>
<link rel="stylesheet" href="pboarddist/pboard_style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
</head>
<body>
<div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
   
    <ul>
      <li><a href="../main/main.do">Home</a></li>
      <li><a href="../pboard/list.do">커뮤니티</a></li>
      <li><a href="../pboard/detail.do">상세보기</a></li>
    </ul>
   
  </div>
</div>

<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body --> 
    <h2 class="sectiontitle">내용보기</h2>
    <div class="two_third first">
     <table class="table">
       <tr>
         <th width=20% class="text-center">번호</th>
         <td width=30% class="text-center">${vo.n_no }</td>
         <th width=20% class="text-center">작성일</th>
         <td width=30% class="text-center">${vo.dbday }</td>
       </tr>
       <tr>
         <th width=20% class="text-center">작성자</th>
         <td width=30% class="text-center">${vo.id }</td>
         <th width=20% class="text-center">조회수</th>
         <td width=30% class="text-center">${vo.hit }</td>
       </tr>
       <tr>
         <th width=20% class="text-center">제목</th>
         <td colspan="3">${vo.subject }</td>
       </tr>
       <tr>
        <td colspan="4" height="200" valign="top" class="text-left">
          <pre style="white-space: pre-wrap;background-color: white;border:none">${vo.content }</pre>
        </td>
       </tr>
       <tr>
       
 
 <td colspan="4" class="text-right">
   <a href="../notice/list.do" class="btn btn-xs btn-warning">목록</a> 
   </td> 
     
   <!-- 관리자 페이지용  -->  
        <%--  <td colspan="4" class="text-right">
         <c:if test="${vo.admin==y}">관리자가 작성 (1) , (0) 사용자 작성
           <a href="../notice/update.do?p_no=${vo.n_no }" class="btn btn-xs btn-danger">수정</a>
           <span class="btn btn-xs btn-info" id="del">삭제</span>
           </c:if>
           <a href="../notice/list.do" class="btn btn-xs btn-warning">목록</a>
         </td>
       </tr>
       <tr id="delTr" style="display:none">
         <td colspan="4" class="text-right inline">
        
          <input type=button value="삭제" class="btn btn-sm btn-danger" id="delBtn" data-n_no="${vo.n_no }">
         </td> --%>
       </tr>
     </table>
	
      </div>
   </main>
</div>
</body>
</html>