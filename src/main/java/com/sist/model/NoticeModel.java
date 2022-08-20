package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class NoticeModel {
   @RequestMapping("notice/list.do")
   public String notice_list(HttpServletRequest request,HttpServletResponse response)
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
	   List<NoticeVO> list=NoticeDAO.noticeListData(map);
	   
	   int totalpage=NoticeDAO.noticeTotalPage();
	  
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
	   request.setAttribute("main_jsp", "../notice/list.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("notice/insert.do")
   public String notice_insert(HttpServletRequest request,HttpServletResponse response)
   {
//	   HttpSession session=request.getSession();
//	   String id=(String)session.getAttribute("id");
//	   String name=(String)session.getAttribute("name");
	   request.setAttribute("main_jsp", "../notice/insert.jsp");
	   return "../main/main.jsp";
   }
   
   @RequestMapping("notice/insert_ok.do")
   public String notice_insert_ok(HttpServletRequest request,HttpServletResponse response)
   {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
	   HttpSession session=request.getSession();//id 세션 받아오기 
	   String id=(String)session.getAttribute("id");
	 
	   System.out.println("id="+id);
	   String subject=request.getParameter("subject");
	   String content=request.getParameter("content");
	  
	   
	  NoticeVO vo=new  NoticeVO();
	   vo.setId(id);
	
	   vo.setSubject(subject);
	   vo.setContent(content);
	  
	   
	   NoticeDAO.noticeInsert(vo);
	   return "redirect:../notice/list.do";
   }
   @RequestMapping("notice/detail.do")
   public String notice_detail(HttpServletRequest request,HttpServletResponse response)
   {
	   // 출력할 데이터를 보낸다 
	   String n_no=request.getParameter("n_no");
	   NoticeVO vo=NoticeDAO.noticeDetailData(Integer.parseInt(n_no));
	   request.setAttribute("vo", vo);
	  
	   request.setAttribute("main_jsp", "../notice/detail.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("notice/update.do")
   public String notice_update(HttpServletRequest request,HttpServletResponse response)
   {
	   String n_no=request.getParameter("n_no");
	   NoticeVO vo=NoticeDAO.noticeUpdateData(Integer.parseInt(n_no));
	   request.setAttribute("vo", vo);
	   request.setAttribute("main_jsp", "../notice/update.jsp");
	   return "../main/main.jsp";
   }
  
   
   @RequestMapping("notice/update_ok.do")
   public String notice_update_ok(HttpServletRequest request,HttpServletResponse response)
   {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
	   String id=request.getParameter("id");
	   System.out.println("id="+id);
	 
	   String subject=request.getParameter("subject");
	   String content=request.getParameter("content");
	   String n_no=request.getParameter("n_no");
	   NoticeVO vo=new NoticeVO();
	  
	   vo.setId(id);
	   vo.setSubject(subject);
	   vo.setContent(content);
	  
	   vo.setN_no(Integer.parseInt(n_no));
	   NoticeDAO.noticeUpdate(vo);
	   return "redirect:../notice/detail.do?n_no="+n_no;// sendRedirect
//	   insert_ok, update_ok, delete_ok 데이터 전송은 없고 처리후 바로 (이전에 실행된 화면)페이지 이동(list,detail)
//	   => 따로 jsp파일을 만들지 않아도 됨 
   }
   
   @RequestMapping("notice/delete.do")
   public String notice_delete(HttpServletRequest request,HttpServletResponse response)
   {
	   String n_no=request.getParameter("n_no");
	 
	   String result=NoticeDAO.noticeDelete(Integer.parseInt(n_no));
	   request.setAttribute("result", result);
	   return "../notice/delete.jsp";
   }
}






