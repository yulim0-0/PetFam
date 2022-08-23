package com.sist.model;

import java.util.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import com.sist.vo.JjimVO2;
import com.sist.vo.PetplaceVO;

import com.sist.dao.PetplaceDAO;



@Controller
public class PetplaceModel {
	@RequestMapping("petplace/cafe.do")
	public String petplace_cafe(HttpServletRequest request, HttpServletResponse response)
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
		
		map.put("s", 252);
		map.put("e", 304);
		List<PetplaceVO> list=PetplaceDAO.petplaceListData(map);
		
		 int totalpage=PetplaceDAO.petplaceTotalPage(map);
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
		
		request.setAttribute("main_jsp", "../petplace/cafe.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("petplace/park.do")
	public String petplace_salon(HttpServletRequest request, HttpServletResponse response)
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
	
		//map.put("s", 49);
		//map.put("e", 50);
		map.put("s", 250);
		map.put("e", 252);
		
		List<PetplaceVO> list=PetplaceDAO.petplaceListData(map);
		
		 int totalpage=PetplaceDAO.petplaceTotalPage(map);
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
		
		request.setAttribute("main_jsp", "../petplace/park.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("petplace/pension.do")
	public String petplace_training(HttpServletRequest request, HttpServletResponse response)
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
		
		//map.put("s", 137);
		//map.put("e", 138);
		map.put("s", 250);
		map.put("e", 252);
		List<PetplaceVO> list=PetplaceDAO.petplaceListData(map);
		
		 int totalpage=PetplaceDAO.petplaceTotalPage(map);
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
		
		request.setAttribute("main_jsp", "../petplace/pension.jsp");
		return "../main/main.jsp";
	}
	
	
	
	@RequestMapping("petplace/petplace_detail.do")
	   public String petplace_detail(HttpServletRequest request,HttpServletResponse response)
	   {
		   String c_no=request.getParameter("c_no");
		   String table_name="rcpg_4";
		  
		   Map map=new HashMap();
		   map.put("c_no",c_no);
		   map.put("table_name", table_name);
		   PetplaceVO vo=PetplaceDAO.petplaceDetailData(map);
		   request.setAttribute("vo", vo);
		   request.setAttribute("main_jsp", "../petplace/petplace_detail.jsp");
		   
		   //찜목록
		   JjimVO2 jvo=new JjimVO2();
		   jvo.setC_no(Integer.parseInt(c_no));
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   
		   
		   jvo.setId(id);
		   int jcount=PetplaceDAO.petplaceJjimCount(jvo);
		   
		   request.setAttribute("jcount",jcount);
		  
		   return "../main/main.jsp";
	   }
	
	@RequestMapping("petplace/jjim.do")
	   public String petplace_jjim(HttpServletRequest request,HttpServletResponse response)
	   {
		   String c_no=request.getParameter("c_no");
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   JjimVO2 vo=new JjimVO2();
		   vo.setC_no(Integer.parseInt(c_no));
		   vo.setId(id);
		   PetplaceDAO.petplaceJjimInsert(vo);
		   return "redirect:../petplace/petplace_detail.do?c_no="+c_no;
	   }
	
	
	
	 // 마이페이지에서 찜 목록 출력 
	   @RequestMapping("mypage/jjim_list.do")
	   public String petplace_jjim_list(HttpServletRequest request,HttpServletResponse response)
	   {
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   
		   List<Integer> list=PetplaceDAO.petplaceJjimGetC_no(id);
		   
		   List<PetplaceVO> plist=new ArrayList<PetplaceVO>();
		   for(int c_no:list)
		   {
			
			   PetplaceVO vo=PetplaceDAO.petplaceJjimListData(c_no);
			   
			   plist.add(vo);
		
		   }
		   
		   request.setAttribute("plist", plist);
		
		 
		   request.setAttribute("main_jsp", "../mypage/jjim_list.jsp");
		   
		   return "../main/main.jsp";
		   

	   }
	   
	   // 찜 취소 
	   @RequestMapping("petplace/jjim_cancel.do")
	   public String petplace_jjim_cancel(HttpServletRequest request,HttpServletResponse response)
	   {
		   String c_no=request.getParameter("c_no");
		   HttpSession session=request.getSession();
		   String id=(String)session.getAttribute("id");
		   JjimVO2 vo=new JjimVO2();
		   vo.setId(id);
		   vo.setC_no(Integer.parseInt(c_no));
		   // DAO연동
		   PetplaceDAO.petplaceJjimDelete(vo);
		   return "redirect:../mypage/jjim_list.do";
	   }
	
}