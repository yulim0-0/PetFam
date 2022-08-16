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
		let pp_no=$(this).attr("data-pp_no");
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
			url:'../ppboard/delete.do',
			data:{"pp_no":pp_no,"pwd":pwd},
			success:function(result)
			{
				let res=result.trim();
				if(res=="yes")// 정상 수행 (비밀번호가 같다)
				{
					location.href="../ppboard/list.do"; // sendRedirect()
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
		let pp_no=$(this).attr("data-pp_no");
		if(u==0)
		{
			$('#update'+pp_no).show();
			u=1;
		}
		else
		{
            $('#update'+pp_no).hide();
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
         <td width=30% class="text-center">${vo.pp_no }</td>
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
         <c:if test="${vo.filecount>0 }">
          <tr>
            <th width=20% class="text-center danger">첨부파일</th>
            <td colspan="3" class="text-left">
              <ul>
               <c:forEach var="file" items="${fList }" varStatus="s">
                 <li><a href="download.do?fn=${file }">${file }</a>&nbsp;(${sList[s.index]}Bytes)</li>
               </c:forEach>
              </ul>
            </td>
          </tr>
        </c:if>
       <tr>
        <td colspan="4" height="200" valign="top" class="text-left">
          <pre style="white-space: pre-wrap;background-color: white;border:none">${vo.content }</pre>
        </td>
       </tr>
       <tr>
         <td colspan="4" class="text-right">
           <a href="../ppboard/update.do?pp_no=${vo.pp_no }" class="btn btn-xs btn-danger">수정</a>
           <span class="btn btn-xs btn-info" id="del">삭제</span>
           <a href="../ppboard/list.do" class="btn btn-xs btn-warning">목록</a>
         </td>
       </tr>
       <tr id="delTr" style="display:none">
         <td colspan="4" class="text-right inline">
          <span>비밀번호 : &nbsp; </span><input type=password name=pwd size=10 class="input-sm" id="delPwd">
          <input type=button value="삭제" class="btn btn-sm btn-danger" id="delBtn" data-pp_no="${vo.pp_no }">
         </td>
       </tr>
     </table>
     
	     
		<div id="article-neighbor-list"><!-- 이동은 가능한데 제목이랑 삭제된 게시글에 대한 오류해결 해야함 !! -->
	        <div>
	        <span class="indicator"><strong>▲윗글</strong></span>
	        <a href="../ppboard/detail.do?p_no=${(vo.pp_no)+1 }" class="subject">${vo.subject }</a>
	    </div>
	    <div>
	        <span class="indicator"><strong>▼아랫글</strong></span>
	        <a href="../ppboard/detail.do?p_no=${(vo.pp_no)-1}" class="subject">${vo.subject }</a>
	    </div>
	    </div>
	    
    <%-- 
     <div id="comments">    
        <h2>댓글</h2>
        <ul>
         <c:forEach var="rvo" items="${list }">
          <li>
            <article>
              <header>
                <figure class="avatar">
                 <c:if test="${sessionScope.id==rvo.id}"><!-- 본인이면 -->
                  <span class="btn btn-xs btn-danger up" style="color:black" data-p_no="${rvo.p_no }">수정</span>
                  <a href="../preply/preply_delete.do?p_no=${rvo.p_no }&p_no=${vo.p_no}" class="btn btn-xs btn-success" style="color:black">삭제</a>
                 </c:if>
                </figure>
                <address>
               <a href="#">${rvo.id }&nbsp;(${rvo.dbday })</a>
                </address>
              </header>
              <div class="comcont">
                <p><pre style="white-space: pre-wrap;background-color:white;border:none">${rvo.msg }</pre></p>
              </div>
            </article>
            
          </li>
            <div style="display:none" id="update${rvo.p_no }" class="updates">
	            <table class="table">
		          <tr>
		            <td>
		             <form method=post action="../preply/preply_update.do">
		               <input type=hidden name=p_no value="${vo.p_no }">
		               <input type=hidden name=type value="1">
		               <input type=hidden name=pre_no value="${rvo.p_no }">
		               <textarea rows="5" cols="70" name="msg" style="float: left">${rvo.msg }</textarea>
		               <input type=submit class="btn btn-sm btn-primary" style="height: 105px"
		                value="댓글수정">
		              </form>
		            </td>
		          </tr>
		        </table>
	        </div>
          </c:forEach>
        </ul> 
       </div>
       <c:if test="${sessionScope.id!=null }"><!-- 로그인시에만 보여준다 -->
        <table class="table">
          <tr>
            <td>
             <form method=post action="../preply/preply_insert.do">
               <input type=hidden name=p_no value="${vo.p_no }">
               <input type=hidden name=type value="1">
               <textarea rows="5" cols="100" name="msg" style="float: left"></textarea>
               <input type=submit class="btn btn-sm btn-primary" style="height: 105px"
                value="댓글쓰기">
              </form>
            </td>
          </tr>
        </table>
       </c:if> --%>
      </div> 
  
   </main>
</div>
</body>
</html>