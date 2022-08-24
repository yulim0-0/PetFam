<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* String s_his=null;    //쿠키 이름
String s_His=request.getParameter("searchAll");
//쿠키생성
Cookie cookie=new Cookie(s_his,s_His);
cookie.setPath("/");
cookie.setMaxAge(60*60*24);
response.addCookie(cookie);
response.sendRedirect("../main/home.do"); */

// 쿠키 생성
String o_no=request.getParameter("o_no");
Cookie cookie=new Cookie("booking"+o_no,o_no);
cookie.setPath("/");
cookie.setMaxAge(60*60*24);
response.addCookie(cookie);
response.sendRedirect("hos_detail.do?o_no="+o_no);

%>