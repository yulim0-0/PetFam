package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MypageDAO;
import com.sist.vo.PboardVO;
import com.sist.vo.UserVO;

@Controller
public class MypageModel {
	
	@RequestMapping("mypage/myinfo.do")
	public String user_info(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");	// 다운캐스팅
		
		List<UserVO> list=MypageDAO.userInfoData(id);
		
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../mypage/myinfo.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/mybooking.do")
	public String user_booking(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../mypage/mybooking.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/myinfo_edit.do")
	public String user_info_edit(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../mypage/myinfo_edit.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/mywrite.do")
	public String user_write(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");	// 다운캐스팅
		
		List<PboardVO> list=MypageDAO.userWriteData(id);
		
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../mypage/mywrite.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/mywrite_detail.do")
	public String user_write_detail(HttpServletRequest request, HttpServletResponse response)
	{
		String p_no=request.getParameter("p_no");
		
		List<PboardVO> list=MypageDAO.userWriteDetailData(Integer.parseInt(p_no));
		
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../mypage/mywrite_detail.jsp");
		return "../main/main.jsp";
	}
}
