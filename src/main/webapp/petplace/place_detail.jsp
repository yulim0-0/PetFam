<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">추천</a></li>
      <li><a href="#">카페</a></li>
      <li><a href="#">상세보기</a></li>
    </ul>
    <!-- ################################################################################################ --> 
  </div>
</div>

<div>
  
    <!-- main body --> 
    <!-- ################################################################################################ -->
    <div> 
      <!-- ################################################################################################ -->
      <div class="row">
        <table align="center">
          <tr>
           <td align="center"><h3>${vo.title}</h3>
           </td>
          <tr>
           <td align="center">
             <img src="${vo.poster }" style="width: 50%">
           </td>
          </tr>
        
          <tr>
            <td align="center">주소 : ${vo.addr}</td>
          </tr>
        </table>
      </div>
      </div>
     
  
</div>
</body>
</html>