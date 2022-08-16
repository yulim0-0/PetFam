<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="myinfo_style.css">
<style>
input[type=text], input[type=date] {
	border : 0px;
	width : 100%;
}
</style>

</head>
<body>
	<main class="main">
		<div class="top-menu">
			<h1>개인정보 수정</h1>
		</div>
		
		<form method="post" action="../myinfo/myinfo_edit_ok.do" name="join_frm" id="join_frm">
		<div id="demo">
			<div class="table-responsive-vertical shadow-z-1"
				style="width: 900px; margin: 0 auto;">
				<!-- Table starts here -->
				<table id="table" class="table table-hover table-mc-light-blue">
					<c:forEach var="vo" items="${list }">
						<tbody>
							<tr>
								<td></td>
								<td data-title="ID" class="info_cate">아이디</td>
								<td data-title="Name">${vo.id }</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-title="ID" class="info_cate">이름</td>
								<td><input type=text name=name id=name placeholder=${vo.name }></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-title="ID" class="info_cate">전화번호</td>
								<td><input type=text name=phone id=phone placeholder=${vo.phone }></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-title="ID" class="info_cate">생일</td>
								<td><input type=date name=birthday id=birthday placeholder=${vo.birthday }></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-title="ID" class="info_cate">주소</td>
								<td><input type=text name=addr1 id=addr2 placeholder="[${vo.zipcode }] ${vo.addr1 }"></td>
								<td class="checkBtn">
								<input class="ckBtn" type=button name=zipcode id=zipcode class=zipcode value="우편번호" /></td>
							</tr>
							<tr>
								<td></td>
								<td data-title="ID" class="info_cate">상세주소</td>
								<td><input type=text name=addr2 id=addr2 placeholder=${vo.addr2 }></td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-title="ID" class="info_cate">성별</td>
								<td data-title="Name">
									<input type=radio value="남자" name=sex ${vo.gender=='남자'?"checked":"" }>남자
         							<input type=radio value="여자" name=sex ${vo.gender=='여자'?"checked":"" }>여자
								</td>
								<td></td>
							</tr>


						</tbody>
					</c:forEach>
				</table>


			</div>
			<div class="bottom-button">
				<input style="margin-left: 300px; margin-right: 0px;" type="button" class="editBtn" id="editBtn" value="수정하기" >
				<input style="margin-left: 0px; margin-right: 300px;" type="button" class="cancelBtn" id="cancelBtn" value="취소" >
			</div>

		</div>
		</form>

	</main>

</body>
</html>