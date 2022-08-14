package com.sist.model;

import java.util.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.vo.BookingVO;

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
		   return "../main/main.jsp";
	   }
	}

