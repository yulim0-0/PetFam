package com.sist.model;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class MainModel {
	@RequestMapping("main/main.do")
	public String main_page(HttpServletRequest reqeust, HttpServletResponse response)
	{
		reqeust.setAttribute("main_jsp", "../main/home.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("main/search.do")
	public String search_page(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../main/search.jsp");
		return "../main/main.jsp";
	}
	
}
