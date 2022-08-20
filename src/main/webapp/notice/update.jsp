<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../pboard/pboarddist/pboard_style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){

	$('#writeBtn').click(function(){
		let subject=$('#subject').val();
		if(subject.trim()=="")
		{
			$('#subject').focus();
			return;
		}
		
		let content=$('#content').val();
		if(content.trim()=="")
		{
			$('#content').focus();
			return;
		}
		
		$('#frm').submit();
	})
	
})
</script>
</head>
<body>
<div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
    <!-- ################################################################################################ -->
    <ul>
      <li><a href="#">Home</a></li>
      <li><a href="#">커뮤니티</a></li>
      <li><a href="#">수정하기</a></li>
    </ul>
    <!-- ################################################################################################ --> 
  </div>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body --> 
    <h2 class="sectiontitle">수정하기</h2>
    <div class="two_third first">
     <form method=post action="../notice/update_ok.do" id="frm">
      <table class="table">
        <tr>
          <th width=20% class="text-right">작성자</th>
          <td width=80%>${vo.id }
        	 <input type=hidden name=id value="${vo.id }" id="id"> 
            <input type=hidden name=n_no value="${vo.n_no }" id="n_no">
          </td>
        </tr>
        <tr>
          <th width=20% class="text-right">제목</th>
          <td width=80%>
            <input type=text name=subject size=50 class="input-sm" id="subject" value="${vo.subject }">
          </td>
        </tr>
        <tr>
          <th width=20% class="text-right">내용</th>
          <td width=80%>
            <textarea rows="10" cols="50" name=content id="content">${vo.content }</textarea>
          </td>
        </tr>
        
        <tr>
          <td colspan="2" class="text-center">
            <input type=button value="글쓰기" class="btn btn-sm btn-success" id="writeBtn">
            <input type=button value="취소" class="btn btn-sm btn-info"
              onclick="javascript:history.back()">
          </td>
        </tr>
      </table>
      </form>
    </div>
    <script  src="../pboard/pboarddist/pboard_script.js"></script>
   </main>
</div>
</body>
</html>