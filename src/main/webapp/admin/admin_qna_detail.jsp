<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
	<link href="css/qna_detail.css" rel="stylesheet" />
	
	<title>Admin QnA</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	<script type="text/javascript">
	
	<!-- Favicon-->
	
	<!-- Core theme CSS (includes Bootstrap)-->
	$(function(){
		$('#ansBtn').click(function(){
/* 			let name=${'#name'}.val(); */
/* 			let q_no=${'#q_no'}.val(); */
			let subject=${'#subject'}.val();
			let content=$('#content').val();
			if(content.trim()=="")
			{
				alert("답변 내용 입력 필요")
				 $('#content').focus();
				  return;
			}
			let group_id=$('#group_id').val();
			let group_id=$('#group_step').val();
			let pwd=$('#pwd').val();
			  if(pwd.trim()=="")
	        {
	          $('#pwd').focus();
	          return;
	        }
			
			$('#ans_frm').submit();
			
		})
		
	}}
	</script>
	
	<style>
	.listBtn {
		height: 30px;
		width: 50px;
		font-size: 14px;
		text-align: center;
		border: none;
		cursor: pointer;
		background: #f34100;
		color: #fff;
		border-radius: 50px;
	}
</style>
</head>
<body>
	<main class="main">
		<c:forEach var="vo" items="${list }">
			<!-- Page content-->
			<div class="container mt-5">
				<div class="row">
					<div class="col-lg-8">
						<form method="post" action="../admin/admin_qna_insert_ok.do" id="ans_frm">
							<!-- Post content-->
							<article>
								<!-- Post header-->
								<header class="mb-4">
									<!-- Post title-->
									<h1 class="fw-bolder mb-1">[${vo.q_no }] ${vo.subject }</h1>
									<input type=hidden name=subject id=subject value="[re] ${vo.subject }">
									<input type=hidden name=q_no id=q_no value="${vo.q_no }">
									
									<!-- Post meta content-->
									<div class="text-muted fst-italic mb-2">Posted on ${vo.dbday } by ${vo.id }</div>
									
									
									
									
									<!-- 그룹 아이디, group_step 숨겨서 보내기 -->
                                    <input type=hidden name=group_id id=group_id value="${vo.group_id }">
                                    <input type=hidden name=group_step id=group_step value="${vo.group_step }">
                                     <c:if test="${sessionScope.admin=='y' }">
                                        <input type=hidden name=group_tab id=group_tab value="1">
                                    </c:if>
                                    <c:if test="${sessionScope.admin=='n' }">
                                        <input type=hidden name=group_tab id=group_tab value="0">
                                    </c:if>
                                        <input type=hidden name=group_tab id=group_tab value="1">
                                    <input type=hidden name=name id=name value="${name }" >
                                    
                                    
                                    
                                    
                                    
									<!-- Post categories-->
									<a class="badge bg-secondary text-decoration-none link-light"
										href="#!">Web Design</a> <a
										class="badge bg-secondary text-decoration-none link-light"
										href="#!">Freebies</a>
									<a id=name>${name }</a>
								</header>
								<!-- Preview image figure-->
								<div>
									<figure class="mb-4">
										<p class="content-bg"
											style="width: 100%; height: 400px; border:1px solid #ced4da; padding-top: 50px; padding-left: 30px;">${vo.content }</p>
									</figure>
								</div>
							</article>
							<!-- Comments section-->

							<section class="mb-5">
								<div class="card bg-light">
									<div class="card-body">
										<!-- Comment form-->
										<h4>답변달기</h4>
										<textarea class="form-control" rows="5" id="content" name="content" placeholder="Join the discussion and leave a comment!"></textarea>
										
										<div class="submit-zone">
											<input type="password" id=pwd name=pwd placeholder="Password" />
	                                        <button title="저장" id="ansBtn">저장</button>
	                                        <button type="button" onclick="location.href='../admin/admin_qna.do'" id=listBtn class=listBtn >목록</button>
										</div>
										
									</div>
								
								</div>
							</section>
						</form>
						<!-- Comment with nested comments-->
						<div class="d-flex mb-4"></div>
					</div>
				</div>
			</div>

			<!-- Bootstrap core JS-->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
			<!-- Core theme JS-->
			<script src="js/qna_detail.js"></script>
		</c:forEach>
	</main>
</body>
</html>
	<%-- <div>
		<main style="width: 80%; margin: 140px auto 0 auto;">
			<!-- main body -->
			<c:forEach var="vo" items="${list }">
				<h2 style="text-align: center">문의 보기</h2>
				<div>
					<form method="post" action="../admin/admin_qna_insert_ok.do" id="ans_frm">
						<table class="table">
							<tr>
								<th class="">원글 번호</th>
								<td class="">${vo.q_no }<input type=hidden name=q_no id=q_no value="${vo.q_no }"></td>
								<th class="">원글 작성일</th>
								<td class="">${vo.dbday }</td>
								<th class="">질문자</th>
								<td class="">${vo.id }</td>
							</tr>
							<tr>

							</tr>
							<tr>
								<th class="">그룹아이디</th>
								<td class="">${vo.group_id }<input type=hidden name=group_id id=group_id value="${vo.group_id }"></td>
								<th class="">답변자</th>
								<td class="" id=id>${id }</td>
								<th class="">이름</th>
								<td class="" id=name>관리자</td>
							</tr>
							<tr>

							</tr>
							<tr>
								<th style="width:20%">답변 순서</th>
								<td class="" id=id>${vo.group_step }<input type=hidden
									name=group_step id=group_step value="${vo.group_step }">
								</td>
								<th class="">제목</th>
								<td>[re] ${vo.subject } <input type=hidden name=subject
									id=subject value="[re] ${vo.subject }">
								</td>
								<th></th>
								<td></td>
							</tr>
						</table>

						<table>
							<tr class="content">
								<th>본문</th>
								<td class="">${vo.content }</td>
							</tr>
							<tr>
								<th class="">답변</th>
								<td class="">
								    <textarea rows="10" cols="50" name=content id="content"></textarea></td>
							</tr>

							<tr>
								<td></td>
								<td></td>
								<td><input type="password" placeholder="1234" id="pwd" name="pwd"></td>
								<td><button title="저장" style="height: 40px; width: 60px;" id="ansBtn"></button></td>
							</tr>

							<tr>
								<td colspan="4" class="text-right">
								    <c:if test="${vo.group_step!=1}">
										<span class="btn btn-xs btn-info" id="del">삭제</span>
									</c:if> 
									<a href="../admin/admin_qna.do" class="btn-list">목록</a>
								</td>
							</tr>

							<tr id="delTr" style="display: none">
								<td colspan="4" class="text-right inline"><span>비밀번호:&nbsp;</span>
									<input type=password name=pwd size=10 class="input-sm" id="delPwd">
									<input type=button value="삭제" class="btn btn-sm btn-danger" id="delBtn" data-q_no="${vo.q_no }"></td>
							</tr>
						</table>
					</form>
				</div>
			</c:forEach>
		</main>
	</div> --%>
