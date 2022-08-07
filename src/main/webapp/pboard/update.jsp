<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="pboarddist/pboard_style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#writeBtn').hide();
	$('#writeBtn').click(function(){
		let name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		
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
	/*
	    vuejs 
	    axios.get('url',{
	    	params:{
	    		no:1,
	    		pwd:'1234'
	    	}
	    }).then(result=>{})
	*/
	$('#pwd').keyup(function(){
		let pwd=$('#pwd').val();
		let p_no=$('#p_no').val();
		$.ajax({
			type:'post',
            url:'../pboard/pwd_check.do',
            data:{"pwd":pwd,"p_no":p_no},
            // 404 , 500 , 412... success:200
            success:function(result)
            {
            	let res=result.trim();
            	if(res==="yes")
            	{
            		$('#writeBtn').show();
            		$('#print').text("")
            	}
            	else
            	{
            		$('#print').text("비밀번호가 틀립니다!!");
            	    
            	}
            }
		})
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
     <form method=post action="../pboard/update_ok.do" id="frm">
      <table class="table">
        <tr>
          <th width=20% class="text-right">이름</th>
          <td width=80%>
            <input type=text name=name size=15 class="input-sm" id="name" value="${vo.name }">
            <input type=hidden name=p_no value="${vo.p_no }" id="p_no">
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
          <th width=20% class="text-right">비밀번호</th>
          <td width=80% class="inline">
            <input type="password" name=pwd size=10 class="input-sm" id="pwd">
            <span id="print" style="color:red"></span>
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
    <script  src="pboarddist/pboard_script.js"></script>
   </main>
</div>
</body>
</html>