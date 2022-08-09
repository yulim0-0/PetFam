package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class AdminModel {
	@RequestMapping("admin/admin_booking.do")
	public String admin_booking(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("main_jsp", "../admin/admin_booking.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/admin_community.do")
	public String admin_community(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("main_jsp", "../admin/admin_community.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("admin/admin_user.do")
	public String admin_user(HttpServletRequest request, HttpServletResponse response) 
	{
		request.setAttribute("main_jsp", "../admin/admin_user.jsp");
		return "../main/main.jsp";
	}
}
