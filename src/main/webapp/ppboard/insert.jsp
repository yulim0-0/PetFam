<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="pboarddist/pboard_style.css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
   
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#writeBtn').click(function(){
		/*  let name=$('#id').val();
		if(name.trim()=="")
		{
			$('#id').focus();
			return;
		} */
		 
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
		
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		
		$('#frm').submit();
	})
})
</script>
</head>
<body>
<div class="pi_body">
	<div class="wrapper row3">
	  <div id="breadcrumb" class="clear inline"> 
	    <!-- ################################################################################################ -->
	    <ul>
	      <li><a href="../main/main.do">Home</a></li>
	      <li><a href="../pboard/list.do">커뮤니티</a></li>
	      <li><a href="../ppboard/list.do">반려동물 자랑 게시판</a></li>
	    </ul>
	  </div>
	</div>
	
	<div class="wrapper row3">
	  <main class="container clear"> 
	    <!-- main body --> 
	    <h2 class="sectiontitle">글쓰기</h2>
	    <div class="two_third first">
	     <form method=post action="../ppboard/insert_ok.do" id="frm">
	      <table class="table">
	        <tr>
	          <th width=20% class="text-right">작성자</th>
	          <td width=80%>${id }<!--  아이디 세션정보를 가져와야함 -->
	            <input type=hidden name=id size=50 class="input-sm" id="id" value="${vo.id }">
	          </td>
	        </tr>
	        <tr>
	          <th width=20% class="text-right">제목</th>
	          <td width=80%>
	            <input type=text name=subject size=50 class="input-sm" id="subject">
	          </td>
	        </tr>
	        <tr>
	          <th width=20% class="text-right">내용</th>
	          <td width=80%>
	            <textarea rows="10" cols="50" name=content id="content"></textarea>
	          </td>
	        </tr>
	        <tr>
	          <th width=20% class="text-right">비밀번호</th>
	          <td width=80%>
	            <input type="password" name=pwd size=10 class="input-sm" id="pwd">
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
	   </main>
	</div>
</div>
<script  src="../pboard/pboarddist/pboard_script.js"></script>
</body>
</html>