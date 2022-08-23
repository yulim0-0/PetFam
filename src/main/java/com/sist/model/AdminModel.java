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
import com.sist.dao.QnaDAO;
import com.sist.vo.PboardVO;
import com.sist.vo.QnaVO;
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
		request.setAttribute("main_jsp", "../admin/admin_user.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("admin/admin_user_detail.do")
	public String admin_user_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String id=request.getParameter("id");
		List<UserVO> list=MypageDAO.myInfoData(id);
		
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../admin/admin_user_detail.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("admin/admin_user_del.do")
	public String user_join_del(HttpServletRequest request, HttpServletResponse response)
	{
		String id=request.getParameter("id");
		HttpSession session=request.getSession();
		String pwd=(String)session.getAttribute("pwd");
		System.out.println(pwd);
		
		
		String db_pwd=request.getParameter("pwd");
		String result=AdminDAO.UserInfoDelete(id, pwd, db_pwd);
		request.setAttribute("result", result);
		return "../admin/admin_user_del.jsp";
	}
	
	@RequestMapping("admin/admin_qna_detail.do")
	public String admin_qna_detail(HttpServletRequest request, HttpServletResponse response)
	{
		String q_no = request.getParameter("q_no");
		List<QnaVO> list=AdminDAO.adminQnaDetail(Integer.parseInt(q_no));
		request.setAttribute("list", list);
		request.setAttribute("main_jsp", "../admin/admin_qna_detail.jsp");
		return "../main/main.jsp";
	}
	
//	관리자 문의 답글달기
	@RequestMapping("admin/admin_qna.do")
	public String admin_qna(HttpServletRequest request, HttpServletResponse response)
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
		
		List<QnaVO> list=AdminDAO.adminQnaListData(map);
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
		request.setAttribute("main_jsp", "../admin/admin_qna.jsp");
		return "../main/main.jsp";
	}
	
//	답변 달고나서 admin_insert_ok
	@RequestMapping("admin/admin_qna_insert_ok.do")
	public String admin_qna_insert_ok(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception ex) {}
		HttpSession session=request.getSession();
		String id=(String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		System.out.println("name : " + name);
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String group_id = request.getParameter("group_id");
		String group_step = request.getParameter("group_step");
		String q_no = request.getParameter("q_no");
		String group_tab = request.getParameter("group_tab");
		
		QnaVO vo = new QnaVO();
		vo.setName(name);
		vo.setId(id);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setGroup_id(Integer.parseInt(group_id));
		vo.setGroup_step(Integer.parseInt(group_step));
		vo.setGroup_tab(Integer.parseInt(group_tab));
		AdminDAO.adminQnaIsreply(Integer.parseInt(q_no));
		
		AdminDAO.adminQnaInsert(vo);
		return "redirect:../admin/admin_qna.do";
	}
	
	@RequestMapping("admin/admin_qna_sidebar.do")
	public String admin_qna_sidebar(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("qna_sidebar", "../admin/admin_qna_sidebar.jsp");
		return "../admin/admin_qna.jsp";
	}
	
}
