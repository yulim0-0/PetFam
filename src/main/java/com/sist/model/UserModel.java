package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.UserDAO;

@Controller
public class UserModel {
	// 아이디 중복체크
	@RequestMapping("user/idcheck.do")
	public String user_idcheck(HttpServletRequest request, HttpServletResponse response) {
		return "../user/idcheck.jsp";
	}
	@RequestMapping("user/idcheck_ok.do")
	public String user_idcheck_ok(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		int count=UserDAO.userIdCheck(id);
		request.setAttribute("count", count);
		return "../user/idcheck_ok.jsp";
	}
	
	@RequestMapping("user/email_check.do")
	public String user_email_check(HttpServletRequest request, HttpServletResponse response) {
		String email=request.getParameter("email");
		int count=UserDAO.userEmailCheck(email);
		request.setAttribute("count", count);
		return "../user/idcheck_ok.jsp";
	}
	
	@RequestMapping("user/phone_check.do")
	public String user_phone_check(HttpServletRequest request, HttpServletResponse response) {
		String phone=request.getParameter("phone");
		int count=UserDAO.userPhoneCheck(phone);
		request.setAttribute("count", count);
		return "../user/idcheck_ok.jsp";
	}
	
	@RequestMapping("user/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../user/login.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("user/join.do")
	public String join(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../user/join.jsp");
		return "../main/main.jsp";
	}
}
