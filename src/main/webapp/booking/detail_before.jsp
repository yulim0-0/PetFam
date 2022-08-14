<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 쿠키 생성
	String o_no=request.getParameter("o_no");
	Cookie cookie=new Cookie("booking"+o_no,o_no);
	cookie.setPath("/");
	cookie.setMaxAge(60*60*24);
	response.addCookie(cookie);
	RequestDispatcher dispatcher=request.getRequestDispatcher("hos_detail.do");
	dispatcher.forward(request, response);
%>