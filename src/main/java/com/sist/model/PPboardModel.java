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
public class PPboardModel {
   @RequestMapping("ppboard/list.do")
   public String ppboard_list(HttpServletRequest request,HttpServletResponse response)
   {
	   String page=request.getParameter("page");
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   Map map=new HashMap();
	   int rowSize=4;
	   int start=(curpage*rowSize)-(rowSize-1);
	   int end=curpage*rowSize;
	   map.put("start", start);
	   map.put("end",end);
	   List<PPboardVO> list=PPboardDAO.ppboardListData(map);
	   
	   int totalpage=PPboardDAO.ppboardTotalPage();
	  
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
	   request.setAttribute("main_jsp", "../ppboard/list.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("ppboard/insert.do")
   public String ppboard_insert(HttpServletRequest request,HttpServletResponse response)
   {
//	   HttpSession session=request.getSession();
//	   String id=(String)session.getAttribute("id");
//	   String name=(String)session.getAttribute("name");
	   request.setAttribute("main_jsp", "../ppboard/insert.jsp");
	   return "../main/main.jsp";
   }
   
   @RequestMapping("ppboard/insert_ok.do")
   public String ppboard_insert_ok(HttpServletRequest request,HttpServletResponse response)
   {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
	   HttpSession session=request.getSession();//id 세션 받아오기 
	   String id=(String)session.getAttribute("id");
	   String name=(String)session.getAttribute("name");
//	  / String id=request.getParameter("id");
//	   String name=request.getParameter("name");
	   System.out.println("id="+id);
	   String subject=request.getParameter("subject");
	   String content=request.getParameter("content");
	   String pwd=request.getParameter("pwd");
	   
	   PPboardVO vo=new PPboardVO();
	   vo.setId(id);
	   vo.setName(name);
	   vo.setSubject(subject);
	   vo.setContent(content);
	   vo.setPwd(pwd);
	   
	   PPboardDAO.ppboardInsert(vo);
	   return "redirect:../ppboard/list.do";
   }
   @RequestMapping("ppboard/detail.do")
   public String pboard_detail(HttpServletRequest request,HttpServletResponse response)
   {
	   // 출력할 데이터를 보낸다 
	   String pp_no=request.getParameter("pp_no");
	   PPboardVO vo=PPboardDAO.ppboardDetailData(Integer.parseInt(pp_no));
	   request.setAttribute("vo", vo);
	   
//	   //댓글 
//	   PReplyVO rvo=new PReplyVO();
//	   rvo.setPp_no(vo.getPp_no());
//	   rvo.setType(2);// ppbo_4 자랑게시판  
//	   List<PReplyVO> list=PReplyDAO.ppreplyListData(rvo);
//	   request.setAttribute("list", list);
	   request.setAttribute("main_jsp", "../ppboard/detail.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("ppboard/update.do")
   public String ppboard_update(HttpServletRequest request,HttpServletResponse response)
   {
	   String pp_no=request.getParameter("pp_no");
	   PPboardVO vo=PPboardDAO.ppboardUpdateData(Integer.parseInt(pp_no));
	   request.setAttribute("vo", vo);
	   request.setAttribute("main_jsp", "../ppboard/update.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("ppboard/pwd_check.do")
   public String ppboard_pwd_check(HttpServletRequest request,HttpServletResponse response)
   {
	   String pp_no=request.getParameter("pp_no");
	   String pwd=request.getParameter("pwd");
	   String res=PPboardDAO.ppboardPwdCheck(Integer.parseInt(pp_no), pwd);
	   request.setAttribute("res", res);
	   return "../ppboard/update_ok.jsp";
   }
   
   @RequestMapping("ppboard/update_ok.do")
   public String ppboard_update_ok(HttpServletRequest request,HttpServletResponse response)
   {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
	   String id=request.getParameter("id");
	   System.out.println("id="+id);
	   String name=request.getParameter("name");
	   String subject=request.getParameter("subject");
	   String content=request.getParameter("content");
	   String pwd=request.getParameter("pwd");
	   String pp_no=request.getParameter("pp_no");
	   PPboardVO vo=new PPboardVO();
	   vo.setName(name);
	   vo.setId(id);
	   vo.setSubject(subject);
	   vo.setContent(content);
	   vo.setPwd(pwd);
	   vo.setPp_no(Integer.parseInt(pp_no));
	   PPboardDAO.ppboardUpdate(vo);
	   return "redirect:../ppboard/detail.do?pp_no="+pp_no;// sendRedirect
//	   insert_ok, update_ok, delete_ok 데이터 전송은 없고 처리후 바로 (이전에 실행된 화면)페이지 이동(list,detail)
//	   => 따로 jsp파일을 만들지 않아도 됨 
   }
   
   @RequestMapping("ppboard/delete.do")
   public String pboard_delete(HttpServletRequest request,HttpServletResponse response)
   {
	   String pp_no=request.getParameter("pp_no");
	   String pwd=request.getParameter("pwd");
	   String result=PPboardDAO.ppboardDelete(Integer.parseInt(pp_no), pwd);
	   request.setAttribute("result", result);
	   return "../ppboard/delete.jsp";
   }
}






