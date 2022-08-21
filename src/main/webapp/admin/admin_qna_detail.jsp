<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="pboarddist/pboard_style.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#ansBtn').click(function(){
		let name=${'#name'}.val();
		let q_no=${'#q_no'}.val();
		let subject=${'#subject'}.val();
		let content=$('#content').val();
		if(content.trim()=="")
		{
			 alert("그만");
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
input[type=text] {
	text-align: center;
	width: 100%;
}

.grid-container {
	display: grid;
	grid-template-columns: auto auto auto;
	gap: 10px;
	background-color: #2196F3;
	padding: 10px;
}

.grid-container>div {
	background-color: rgba(255, 255, 255, 0.8);
	text-align: center;
	padding: 20px 0;
	font-size: 30px;
}

.item1 {
	grid-area: 1/1/2/2;
}

.item2 {
	grid-area: 1/2/2/4;
}

.item3 {
	grid-area: 1/4/2/5;
}

.item4 {
	grid-area: 1/5/2/7;
}

.item5 {
	grid-area: 1/7/2/8;
}

.item6 {
	grid-area: 1/8/2/10;
}

.item7 {
	grid-area: 2/1/3/2;
}

.item8 {
	grid-area: 2/2/3/4;
}

.item9 {
	grid-area: 2/4/3/5;
}

.item10 {
	grid-area: 2/5/3/7;
}

.item11 {
	grid-area: 2/7/3/8;
}

.item12 {
	grid-area: 2/8/3/10;
}

.item13 {
	grid-area: 3/1/4/2;
}

.item14 {
	grid-area: 3/2/4/4;
}

.item15 {
	grid-area: 3/4/4/5;
}

.item16 {
	grid-area: 3/5/4/10;
}

.item17 {
	grid-area: 5/1/6/2;
}

.item18 {
	grid-area: 5/2/6/10;
}
</style>
</head>
<body>
	<div>
		<main style="width: 80%; margin: 140px auto 0 auto;">
			<!-- main body -->
			<c:forEach var="vo" items="${list }">
				<h2 style="text-align: center">문의 보기</h2>
				<div>
					<form method="post" action="../admin/admin_qna_insert_ok.do"
						id="ans_frm">
						<table class="table">
							<tr>
								<th class="item1">원글 번호</th>
								<td class="item2">${vo.q_no }<input type=hidden name=q_no
									id=q_no value="${vo.q_no }">
								</td>
								<th class="item3">원글 작성일</th>
								<td class="item4">${vo.dbday }</td>
								<th class="item5">질문자</th>
								<td class="item6">${vo.id }</td>
							</tr>
							<tr>

							</tr>
							<tr>
								<th class="item7">그룹아이디</th>
								<td class="item8">${vo.group_id }<input type=hidden
									name=group_id id=group_id value="${vo.group_id }"></td>
								<th class="item9">답변자</th>
								<td class="item10" id=id>${id }</td>
								<th class="item11">이름</th>
								<td class="item12" id=name>관리자</td>
							</tr>
							<tr>

							</tr>
							<tr>
								<th class="item13">답변 순서</th>
								<td class="item14" id=id>${vo.group_step }<input type=hidden
									name=group_step id=group_step value="${vo.group_step }">
								</td>
								<th class="item15">제목</th>
								<td>[re] ${vo.subject } <input type=hidden name=subject
									id=subject value="[re] ${vo.subject }">
								</td>
								<th></th>
								<td></td>
							</tr>
						</table>

						<table>
							<tr>
								<th class="item1">본문</th>
								<td class="item2">${vo.content }</td>
							</tr>
							<tr>
								<th class="item17">답변</th>
								<td class="item18">
								    <textarea rows="10" cols="50" name=content id="content"></textarea></td>
							</tr>

							<tr>
								<td></td>
								<td></td>
								<td><input type="password" placeholder="1234" id="pwd"
									name="pwd"></td>
								<td><button title="저장" style="height: 40px; width: 60px;"
										id="ansBtn"></button></td>
							</tr>


							<tr>
								<td colspan="4" class="text-right"><c:if
										test="${vo.group_step!=1}">

										<%-- 관리자가 작성 (1) , (0) 사용자 작성--%>
										<a href="../qna/update.do?q_no=${vo.q_no }"
											class="btn btn-xs btn-danger">수정</a>
										<span class="btn btn-xs btn-info" id="del">삭제</span>
									</c:if> <a href="../qna/list.do" class="btn btn-xs btn-warning">목록</a></td>
							</tr>

							<tr id="delTr" style="display: none">
								<td colspan="4" class="text-right inline"><span>비밀번호:&nbsp;</span>
									<input type=password name=pwd size=10 class="input-sm" id="delPwd">
									<input type=button value="삭제" class="btn btn-sm btn-danger"
									id="delBtn" data-q_no="${vo.q_no }"></td>
							</tr>
						</table>
					</form>
				</div>
			</c:forEach>
		</main>
	</div>
</body>
</html>