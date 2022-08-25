package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MainDAO;
import com.sist.vo.BookingVO;
import com.sist.vo.PboardVO;
import com.sist.vo.PetplaceVO;

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
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		String search=request.getParameter("searchAll");
		
		List<PboardVO> comList=MainDAO.totalComFindData(search);
		List<PetplaceVO> recList=MainDAO.totalRecFindData(search);
		List<BookingVO> bookList=MainDAO.totalBookFindData(search);
		request.setAttribute("search", search);
		request.setAttribute("comList", comList);
		request.setAttribute("recList", recList);
		request.setAttribute("bookList", bookList);
		request.setAttribute("main_jsp", "../main/search.jsp");
		return "../main/main.jsp";
	}
	
	
}
