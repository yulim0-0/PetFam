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
      <li><a href="#">예약</a></li>
      <li><a href="#">병원</a></li>
      <li><a href="#">병원상세</a></li>
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
           <td align="center"><h3>${vo.name }</h3></td>
          </tr>
            <tr>
            <td align="center">${vo.s_info }</td>
          </tr>
          <tr>
           <td align="center">
             <img src="http://${vo.img }" style="width: 50%">
           </td>
          </tr>
        
          <tr>
            <td align="center">주소 : ${vo.address }</td>
          </tr>
        </table>
      </div>
      </div>
     
  
</div>
</body>
</html>