package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
@Controller
public class PetplaceModel {

	@RequestMapping("petplace/cafe.do")
	public String main_page(HttpServletRequest reqeust, HttpServletResponse response)
	{
		reqeust.setAttribute("main_jsp", "../petplace/cafe.jsp");
		return "../main/main.jsp";
	
	}
}
