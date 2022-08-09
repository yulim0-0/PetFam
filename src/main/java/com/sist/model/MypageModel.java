package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MypageDAO;
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
}
