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
import com.sist.vo.JjimVO;
import com.sist.vo.PboardVO;
import com.sist.vo.PetplaceVO;
import com.sist.vo.QnaVO;
import com.sist.vo.UserVO;

@Controller
public class MypageModel {
//	@RequestMapping("mypage/myinfo.do")
//	public String infoData(HttpServletRequest request, HttpServletResponse response)
//	{
//		HttpSession session=request.getSession();
//		String id=(String)session.getAttribute("id");
//		List<UserVO> list=MypageDAO.infoData(id);
//		
//		request.setAttribute("list", list);
//		request.setAttribute("main_jsp", "../mypage/myinfo.jsp");
//		return "../main/main.jsp";
//	}
	
	@RequestMapping("mypage/myinfo.do")
	public String myInfoData(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");	// 다운캐스팅
		System.out.println(id);
		UserVO vo=MypageDAO.myInfoData(id);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../mypage/myinfo.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("mypage/myinfo_edit.do")
	public String myinfo_edit(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		UserVO vo=MypageDAO.myInfoData(id);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../mypage/myinfo_edit.jsp");
		return "../main/main.jsp";
	}
	 
	@RequestMapping("mypage/myinfo_edit_ok.do")
	public String myinfo_edit_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		
		
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String email=request.getParameter("email");
		String birthday=request.getParameter("birthday");
		System.out.println("1");
		String zipcode=request.getParameter("zipcode");
		System.out.println(zipcode);
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String gender=request.getParameter("gender");
		
		UserVO vo=new UserVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setPhone(phone);
		vo.setEmail(email);
		vo.setBirthday(birthday);
		vo.setZipcode(zipcode);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setGender(gender);
		
		boolean bCheck=MypageDAO.userEdit(vo);
		if(bCheck==true)
		{
			HttpSession session=request.getSession();
			session.setAttribute("name", vo.getName());
		}
		request.setAttribute("bCheck", bCheck);
		return "../mypage/myinfo_edit_ok.jsp";
	}
		
	@RequestMapping("mypage/mybooking.do")
	public String user_booking(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../mypage/mybooking.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("mypage/mywrite.do")
	public String user_write(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;
		
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");	// 다운캐스팅
		map.put("id",id);
		map.put("start",start);
		map.put("end",end);
		
		List<PboardVO> list=MypageDAO.userWriteData(map);
		int totalpage=MypageDAO.userWriteTotalPage(id);
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
		request.setAttribute("main_jsp", "../mypage/mywrite.jsp");
		return "../main/main.jsp";
	}
	
	
	@RequestMapping("mypage/myqna.do")
	public String user_q(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=10;
		int start=(curpage*rowSize)-(rowSize-1);
		int end=curpage*rowSize;

		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		map.put("id",id);
		map.put("start",start);
		map.put("end",end);
		
		List<QnaVO> list=MypageDAO.userQnaData(map);
		int totalpage=AdminDAO.adminQnaTotalPage();
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
		request.setAttribute("main_jsp", "../mypage/myqna.jsp");
		return "../main/main.jsp";
	}
	
	// 나의 좋아요 - 예약
	@RequestMapping("mypage/mylike.do")
	public String user_like(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<JjimVO> list=MypageDAO.userBookingLikeData(id);
		List<PetplaceVO> plist = MypageDAO.userRecLikeData(id);

		request.setAttribute("plist", plist);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../mypage/mylike.jsp");
		return "../main/main.jsp";
	}
	
	
}
