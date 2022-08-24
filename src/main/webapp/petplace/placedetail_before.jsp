<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 쿠키 생성
	String c_no=request.getParameter("c_no");
	Cookie cookie=new Cookie("petplace"+c_no,c_no);
	cookie.setPath("/");
	cookie.setMaxAge(60*60*24);
	response.addCookie(cookie);
	response.sendRedirect("petplace_detail.do?c_no="+c_no);
%>