package com.sist.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.MypageDAO;
import com.sist.dao.UserDAO;
import com.sist.vo.PboardVO;
import com.sist.vo.QnaVO;
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
	
	@RequestMapping("mypage/myinfo_edit.do")
	public String user_info_edit(HttpServletRequest request, HttpServletResponse response)
	{	
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		List<UserVO> list=MypageDAO.userInfoEdit(id);
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../mypage/myinfo_edit.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("user/myinfo_edit_ok.do")
	public String user_myinfo_edit_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			String id=request.getParameter("id");
			String pwd=request.getParameter("pwd");
			String name=request.getParameter("name");
			String phone=request.getParameter("phone");
			String birthday=request.getParameter("birthday");
			String zipcode=request.getParameter("zipcode");
			String addr1=request.getParameter("addr1");
			String addr2=request.getParameter("addr2");
			String gender=request.getParameter("gender");
			
			UserVO vo=new UserVO();
			vo.setId(id);
			vo.setName(name);
			vo.setPwd(pwd);
			vo.setPhone(phone);
			vo.setBirthday(birthday);
			vo.setZipcode(zipcode);
			vo.setAddr1(addr1);
			vo.setAddr2(addr2);
			vo.setGender(gender);
			boolean bCheck=UserDAO.userEdit(vo);
			if(bCheck==true)
			{
				HttpSession session=request.getSession();
				session.setAttribute("name", vo.getName());
			}
				request.setAttribute("bCheck", bCheck);
			
		}
		return "../user/myinfo_edit_ok.jsp";

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
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");	// 다운캐스팅
		
		List<PboardVO> list=MypageDAO.userWriteData(id);
		
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../mypage/mywrite.jsp");
		return "../main/main.jsp";
	}
	@RequestMapping("mypage/myqna.do")
	public String user_q(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		
		List<QnaVO> list=MypageDAO.userQnaData(id);
		
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../mypage/myqna.jsp");
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
