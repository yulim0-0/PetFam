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
		let n_no=$(this).attr("data-n_no");
	
	
		$.ajax({
			type:'post',
			url:'../notice/delete.do',
			data:{"n_no":n_no},
			success:function(result)
			{
				let res=result.trim();
				alert("삭제되었습니다.")
				{
					location.href="../notice/list.do"; // sendRedirect()
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
		let n_no=$(this).attr("data-n_no");
		if(u==0)
		{
			$('#update'+n_no).show();
			u=1;
		}
		else
		{
            $('#update'+n_no).hide();
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
       
 
 
     
   <!-- 관리자용  -->  
       <td colspan="4" class="text-right">
         <c:if test="${sessionScope.admin=='y'}">
           <a href="../notice/update.do?n_no=${vo.n_no }" class="btn btn-xs btn-danger">수정</a>
           <span class="btn btn-xs btn-info" id="del">삭제</span>
           </c:if>
           <a href="../notice/list.do" class="btn btn-xs btn-warning">목록</a>
         </td>
       </tr>
       <tr id="delTr" style="display:none">
         <td colspan="4" class="text-right inline">
        정말 삭제 하시겠습니까? &nbsp;
          <input type=button value="삭제" class="btn btn-sm btn-danger" id="delBtn" data-n_no="${vo.n_no }">
         </td> 
       </tr>
     </table>
	
      </div>
   </main>
</div>
</body>
</html>