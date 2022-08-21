package com.sist.model;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.UserDAO;
import com.sist.vo.UserVO;

@Controller
public class UserModel {
	// 아이디 중복체크 모달창 열기
	@RequestMapping("user/idcheck.do")
	public String user_idcheck(HttpServletRequest request, HttpServletResponse response) {
		return "../user/idcheck.jsp";
	}
	
	// 실제 아이디 중복 체크
	@RequestMapping("user/idcheck_ok.do")
	public String user_idcheck_ok(HttpServletRequest request, HttpServletResponse response) {
		String id=request.getParameter("id");
		UserDAO dao=new UserDAO();
		int count=dao.userIdCheck(id);
		request.setAttribute("count", count);
		return "../user/idcheck_ok.jsp";
	}
	
	@RequestMapping("user/email_check.do")
	public String user_email_check(HttpServletRequest request, HttpServletResponse response) {
		String email=request.getParameter("email");
		int count=UserDAO.userEmailCheck(email);
		request.setAttribute("count", count);
		return "../user/idcheck_ok.jsp";
	}
	
	@RequestMapping("user/phone_check.do")
	public String user_phone_check(HttpServletRequest request, HttpServletResponse response) {
		String phone=request.getParameter("phone");
		int count=UserDAO.userPhoneCheck(phone);
		request.setAttribute("count", count);
		return "../user/idcheck_ok.jsp";
	}
	
	@RequestMapping("user/login.do")
	public String login(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../user/login.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("user/join.do")
	public String join(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../user/join.jsp");
		return "../main/main.jsp";
	}
//	ID       NOT NULL VARCHAR2(20)  
//	PWD               VARCHAR2(20)  
//	NAME              VARCHAR2(10)  
//	BIRTHDAY          VARCHAR2(8)   
//	PHONE             VARCHAR2(13)  
//	EMAIL             VARCHAR2(30)  
//	ZIPCODE           NUMBER(5)     
//	ADDR1             VARCHAR2(100) 
//	ADDR2             VARCHAR2(100) 
//	GENDER            VARCHAR2(10)  

	@RequestMapping("user/join_ok.do")
	public String user_join_ok(HttpServletRequest request, HttpServletResponse response)
	{
		// 사용자 전송값 받기
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {		}
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String birthday=request.getParameter("birthday");
		String email=request.getParameter("email");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String phone=request.getParameter("phone");
		String gender=request.getParameter("gender");
		String zipcode=request.getParameter("zipcode");
		
		
		UserVO vo=new UserVO();
		vo.setId(id);
		vo.setName(name);
		vo.setBirthday(birthday);
		vo.setPwd(pwd);
		vo.setPhone(phone);
		vo.setEmail(email);
		vo.setZipcode(zipcode);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setGender(gender);
		
		System.out.println("email:"+email);
		UserDAO.userInsert(vo);
		return "redirect:../main/main.do";
		
	}
	
	// 로그인
	@RequestMapping("user/login_ok.do")
	public String user_login_ok(HttpServletRequest request, HttpServletResponse response)
	{
		String id=request.getParameter("id");
		System.out.println(id);
		String pwd=request.getParameter("pwd");
		
		UserVO vo=UserDAO.isLogin(id, pwd);
		String result=vo.getMsg();
		
		if(result.equals("OK"))
		{
			HttpSession session=request.getSession();
			session.setAttribute("id", vo.getId());
			session.setAttribute("name", vo.getName());
			session.setAttribute("admin", vo.getAdmin());
			session.setMaxInactiveInterval(60*360);
			int time = session.getMaxInactiveInterval()/60;
			System.out.println("세션 유효 시간 : "+time+"분");
		}
		request.setAttribute("result", result);
		return "../user/login_ok.jsp";
	
	}
	
	@RequestMapping("user/logout.do")
	public String user_logout(HttpServletRequest request, HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:../main/main.do";
	}
}
