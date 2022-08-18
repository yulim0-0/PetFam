∏<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/myqna.css">
</head>
<body>
	<main class=main>
		<body>
			<div id="wrapper">
				<h1>나의 문의 내역</h1>

				<table id="keywords" cellspacing="0" cellpadding="0">
					<thead>
						<tr>
							<th width=12%><span>고유번호</span></th>
							<th width=40% style="text-align : left"><span>제목</span></th>
							<th width=12%><span>작성일</span></th>
							<th width=12%><span>조회수</span></th>
							<th width=12%><span>작성자</span></th>
							<th width=12%><span>처리여부</span></th>
						</tr>
					</thead>
					<c:forEach var="vo" items="${list }">
						<tbody>
							<c:if test="${vo.group_step == 0 }">
								<c:if test="${vo.isreply == 1}">
									<tr>
									
										<td class="lalign">${vo.q_no }</td>
										<td style="cursor: pointer; text-align:left">
											<a href="../qna/detail.do?q_no=${vo.q_no }">${vo.subject }</a>
										</td>
										<td>${vo.dbday }</td>
										<td>${vo.hit }</td>
										<td>${vo.id }</td>
										<td style="color:#f34100">답변완료</td>	
									</tr>								
								</c:if>
								
								<c:if test="${vo.isreply != 1}">
									<tr>
										<td class="lalign">${vo.q_no }</td>
										<td style="cursor: pointer; text-align:left">
											<a href="../qna/detail.do?q_no=${vo.q_no }">${vo.subject }</a>
										</td>
										<td>${vo.dbday }</td>
										<td>${vo.hit }</td>
										<td>${vo.id }</td>
										<td>답변예정</td>	
									</tr>				
								</c:if>
							</c:if>
							
							<c:if test="${vo.group_step != 0 }">
									<tr>
									
										<td class="lalign">${vo.q_no }</td>
										<td style="cursor: pointer; text-align:left">
											<a href="../qna/detail.do?q_no=${vo.q_no }">${vo.subject }</a>
										</td>
										<td>${vo.dbday }</td>
										<td>${vo.hit }</td>
										<td>${vo.id }</td>
										<td style="color:#f34100">답변</td>	
									</tr>								
								
							</c:if>
						</tbody>
					</c:forEach>
				</table>
			</div>
		</body>
	</main>
</body>
</html>