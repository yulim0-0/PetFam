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
<script type="text/javascript">
let i=0;
let u=0;
$(function(){
	$('#del').click(function(){
		if(i==0)
		{
			$('#delTr').show("slow");
			$('#del').text("취소")
			i=1;
		}
		else
		{
			$('#delTr').hide();
			$('#del').text("삭제")
			i=0;
		}
	})

	$('#delBtn').on("click",function(){
		let pwd=$('#delPwd').val();
		let p_no=$(this).attr("data-q_no");
		if(pwd.trim()=="")
		{
			$("#delPwd").focus();
			return;
		}
		// ajax=>요청 , 데이터 받기
		//alert("password:"+pwd+"\n번호:"+no)
		/*
		   type => GET/POST
		   url  => 처리할 URL주소 => .do
		   data: => ?()
		   success:function(result)
		   {
			   정상 수행 : 200 ========> text(html),xml,json
		   }
		   error:function(ex)
		   {
			   에러 : 404 , 500 , 412 , 415 , 403....
		   }
			   
			   ../freeoard/delete.do?no=1&pwd=1111
					   
			   HttpRequest request; // 브라우저에 존재
			   --------------------
			   
			   request.open("post","../freeboard/delete.do",true) => 비동기 , false=동기 
		*/
		$.ajax({
			type:'post',
			url:'../qna/delete.do',
			data:{"q_no":q_no,"pwd":pwd},
			success:function(result)
			{
				let res=result.trim();
				if(res=="yes")// 정상 수행 (비밀번호가 같다)
				{
					location.href="../qna/list.do"; // sendRedirect()
				}
				else
				{
					alert("비밀번호가 틀립니다!")
					$('#delPwd').val("");
					$('#delPwd').focus();
				}
			},
			error:function(request, status, error)
			{
				alert(error);
			}
			
		})
	})
	
	$('.up').click(function(){
		$('.updates').hide();
		let p_no=$(this).attr("data-q_no");
		if(u==0)
		{
			$('#update'+q_no).show();
			u=1;
		}
		else
		{
            $('#update'+q_no).hide();
            u=0;
		}
	})
})
</script>
</head>
<body>
<div class="wrapper row3">
  <div id="breadcrumb" class="clear"> 
   
    <ul>
      <li><a href="../main/main.do">Home</a></li>
      <li><a href="../pboard/list.do">커뮤니티</a></li>
      <li><a href="../qna/list.do">문의게시판</a></li>
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
         <td width=30% class="text-center">${vo.q_no }</td>
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
           <a href="../qna/update.do?q_no=${vo.q_no }" class="btn btn-xs btn-danger">수정</a>
           <span class="btn btn-xs btn-info" id="del">삭제</span>
           <a href="../qna/list.do" class="btn btn-xs btn-warning">목록</a>
         </td>
       </tr>
       <tr id="delTr" style="display:none">
         <td colspan="4" class="text-right inline">
          <span>비밀번호 :&nbsp; </span><input type=password name=pwd size=10 class="input-sm" id="delPwd">
          <input type=button value="삭제" class="btn btn-sm btn-danger" id="delBtn" data-q_no="${vo.q_no }">
         </td>
       </tr>
     </table>
      </div>
  
   </main>
</div>
</body>
</html>