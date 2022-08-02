package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class AboutModel {
	
	@RequestMapping("about/about.do")
	public String about_page(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../about/about.jsp");
		return "../main/main.jsp";
	}
}
