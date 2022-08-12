<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="myinfo_style.css">
</head>
<body>
	<main class="main">
		<div class="top-menu">
			<h1>개인정보</h1>
		</div>

		<div id="demo">
			<div class="table-responsive-vertical shadow-z-1"
				style="width: 800px; margin: 0 auto;">
				<!-- Table starts here -->
				<table id="table" class="table table-hover table-mc-light-blue">
					<c:forEach var="vo" items="${list }">
						<!-- <thead>
							<tr>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</thead> -->
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
								<td data-title="Name">${vo.name }</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-title="ID" class="info_cate">전화번호</td>
								<td data-title="Name">${vo.phone }</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-title="ID" class="info_cate">생일</td>
								<td data-title="Name">${vo.birthday }</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-title="ID" class="info_cate">주소</td>
								<td data-title="Name">[${vo.zipcode }]  ${vo.addr1 }  ${vo.addr2 }</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td data-title="ID" class="info_cate">성별</td>
								<td data-title="Name">${vo.gender }</td>
								<td></td>
							</tr>


						</tbody>
					</c:forEach>
				</table>


			</div>
			<div class="bottom-button">
				<input type="button" class="control-button up" id="editBtn" value="수정하기" onclick="../mypage/myinfo_edit.do">
			</div>

		</div>


	</main>

</body>
</html>