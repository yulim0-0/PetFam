package com.sist.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.AdminDAO;
import com.sist.dao.MypageDAO;
import com.sist.dao.PboardDAO;
import com.sist.vo.PboardVO;
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
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=9;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		map.put("start", start);
		map.put("end",end);
		
		List<PboardVO> list=AdminDAO.userWriteList(map);
		int totalpage=AdminDAO.userWriteTotalPage();
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		
		if(endPage>totalpage)
			endPage=totalpage;
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("list", list);
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
