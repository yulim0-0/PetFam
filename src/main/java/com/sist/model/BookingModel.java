package com.sist.model;

import java.util.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.vo.BookingVO;
import com.sist.vo.JjimVO;
import com.sist.dao.BookingDAO;



@Controller
public class BookingModel {
	@RequestMapping("booking/hospital_list.do")
	public String booking_Hospital(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);//rownum=1
		int end=(curpage*rowSize);
		
		map.put("start", start);
		map.put("end", end);
		
		map.put("s", 19);
		map.put("e", 515);
		List<BookingVO> list=BookingDAO.bookingListData(map);
		
		 int totalpage=BookingDAO.bookingTotalPage(map);
		   //System.out.println("totalpage="+totalpage);
		   final int BLOCK=5;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   /*
		    *   [1][2][3][4][5]  => startPage =1 
		    *                       endPage   =5
		    *   [6][7][8][9][10] => startPage=6
		    *                       endPage=10
		    */
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage)
			    endPage=totalpage;
		   
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   request.setAttribute("list", list);
		
		request.setAttribute("main_jsp", "../booking/hospital_list.jsp");
		return "../main/main.jsp";
	}
	
	
	
	@RequestMapping("booking/salon_list.do")
	public String booking_salon(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		final int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);//rownum=1
		int end=(curpage*rowSize);
		
		map.put("start", start);
		map.put("end", end);
	
		map.put("s", 8);
		map.put("e", 18);
		List<BookingVO> list=BookingDAO.bookingListData(map);
		
		 int totalpage=BookingDAO.bookingTotalPage(map);
		   //System.out.println("totalpage="+totalpage);
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
		
		request.setAttribute("main_jsp", "../booking/salon_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("booking/training_list.do")
	public String booking_training(HttpServletRequest request, HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		final int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);//rownum=1
		int end=(curpage*rowSize);
		
		map.put("start", start);
		map.put("end", end);
		
		map.put("s", 1);
		map.put("e", 7);
		List<BookingVO> list=BookingDAO.bookingListData(map);
		
		 int totalpage=BookingDAO.bookingTotalPage(map);
		   //System.out.println("totalpage="+totalpage);
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
		
		request.setAttribute("main_jsp", "../booking/training_list.jsp");
		return "../main/main.jsp";
	}
	
	 @RequestMapping("booking/hos_detail.do")
	   public String hos_detail(HttpServletRequest request,HttpServletResponse response)
	   {
		   String o_no=request.getParameter("o_no");
		  
		   BookingVO vo=BookingDAO.hospitalDetailData(Integer.parseInt(o_no));
		   
		   request.setAttribute("vo", vo);
		   request.setAttribute("main_jsp", "../booking/hos_detail.jsp");
		   
		   JjimVO jvo=new JjimVO();
		   jvo.setO_no(Integer.parseInt(o_no));
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   
		   jvo.setId(id);
		   int jcount=0;
		   if(id!=null) // 로그인이 된 상태라면
		   {
		     jcount=BookingDAO.bookingJjimCount(jvo);
		   }
		   request.setAttribute("jcount", jcount);
		   
		   return "../main/main.jsp";
	   }
	
	 @RequestMapping("booking/jjim.do")
	 public String booking_jjim(HttpServletRequest request,HttpServletResponse response)
	 {
		 String o_no=request.getParameter("o_no");
		 HttpSession session=request.getSession();
		 String id=(String)session.getAttribute("id");
		 JjimVO vo=new JjimVO();
		 vo.setO_no(Integer.parseInt(o_no));
		 vo.setId(id);
		 BookingDAO.bookingJjimInsert(vo);
		 return "redirect:../booking/hos_detail.do?o_no="+o_no;
	 }
	 

	 @RequestMapping("booking/booking.do")
	 public String booking(HttpServletRequest request, HttpServletResponse response)
	 {
		  String o_no=request.getParameter("o_no");
		  
		   BookingVO vo=BookingDAO.bookingDetailData(Integer.parseInt(o_no));
		   
		   request.setAttribute("vo", vo);
		 
	 	request.setAttribute("main_jsp", "../booking/booking.jsp");
	 	return "../main/main.jsp";
	 }
	 
	 @RequestMapping("booking/jjim_cancel.do")
	 public String booking_jjim_cancel(HttpServletRequest request, HttpServletResponse response)
	 {
		 String o_no=request.getParameter("o_no");
		 HttpSession session=request.getSession();
		 String id=(String)session.getAttribute("id");
		 JjimVO vo=new JjimVO();
		 vo.setO_no(Integer.parseInt(o_no));
		 vo.setId(id);
		 BookingDAO.bookingJjimDelete(vo);
		 return "redirect:../mypage/mylike.do";
	 }
}
