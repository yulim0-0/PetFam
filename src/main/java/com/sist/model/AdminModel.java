package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.AdminDAO;
import com.sist.dao.MypageDAO;
import com.sist.vo.UserVO;

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
		List<UserVO> list=AdminDAO.userInfoList();
		request.setAttribute("list", list);
		System.out.println(list);
		request.setAttribute("main_jsp", "../admin/admin_user.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("admin/admin_user_detail.do")
	public String admin_user_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String id=request.getParameter("id");
		List<UserVO> list=MypageDAO.userInfoData(id);
		
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../admin/admin_user_detail.jsp");
		return "../main/main.jsp";
	}
	
}
