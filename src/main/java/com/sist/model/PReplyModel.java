package com.sist.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.PboardDAO;
import com.sist.dao.PReplyDAO;
import com.sist.vo.PReplyVO;
/*
 *      PRE_NO      NOT NULL NUMBER    ==> 자동 증가    
		P_NO              NUMBER       
		TYPE             NUMBER     
		--------------------------------  
		ID      NOT NULL VARCHAR2(20) 
		-------------------------------- session
		MSG     NOT NULL CLOB         
		REGDATE          DATE  --- SYSDATE   
 */
@Controller
public class PReplyModel {
   @RequestMapping("preply/preply_insert.do")
   public String preply_insert(HttpServletRequest request,HttpServletResponse response)
   {
	   // bno , type ,  msg  ==> id, name  
	   try
	   { 
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
 	   String p_no=request.getParameter("p_no");// 게시물 번호 
	   String type=request.getParameter("type"); // 카테고리 
	   String msg=request.getParameter("msg");
	   String root=request.getParameter("root");
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   
	   PReplyVO vo=new PReplyVO();
	   vo.setP_no(Integer.parseInt(p_no));
	   vo.setId(id);
	   vo.setMsg(msg);
	   
	   PReplyVO pvo=new PReplyVO();
	     vo.setType(Integer.parseInt(type));
		 vo.setGroup_id(pvo.getGroup_id());
	   	 vo.setGroup_step(pvo.getGroup_step()+1);
	   	 vo.setGroup_tab(pvo.getGroup_tab()+1);
	   	 vo.setRoot(Integer.parseInt(root));
	   	 
	   String[] temp={"","pbo_4","ppbo_4"};//p_bo_4 가 1번(자유게시판) ,ppbo_4가 2번(자랑게시판) 
	   
	   String table=temp[Integer.parseInt(type)];
	   vo.setTable_name(table);
	   //DAO => 오라클 전송 
	   PReplyDAO.preplyInsert(vo);
	   return "redirect:../pboard/detail.do?p_no="+p_no;// detail로 넘어가지 않고 있음 방법을 생각해야함 
   }
   @RequestMapping("preply/preply_delete.do")
   public String reply_delete(HttpServletRequest request,HttpServletResponse response)
   {
	   String p_no=request.getParameter("p_no");// 게시물번호 => detail로 이동
	   String pre_no=request.getParameter("pre_no"); // 댓글 번호 => 삭제
	   // 삭제 ==> DAO
	   //PReplyVO vo=new PReplyVO();
	   //vo.setPre_no(Integer.parseInt(p_no)); 
	   //vo.setTable_name("pbo_4");
	   Map map=new HashMap();
	   map.put("p_no", Integer.parseInt(p_no));
	   map.put("table_name","pbo_4");
	   PReplyDAO.preplyDelete(Integer.parseInt(pre_no),map);
	 
	   return "redirect:../pboard/detail.do?p_no="+p_no;
   }
   @RequestMapping("preply/preply_update.do")
   public String reply_update(HttpServletRequest request,HttpServletResponse response)
   {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   String p_no=request.getParameter("p_no");// 게시물번호 => detail로 이동
	   String pre_no=request.getParameter("pre_no"); // 댓글 번호 => 삭제
	   String msg=request.getParameter("msg");
	   
	   PReplyVO vo=new PReplyVO();
	   vo.setPre_no(Integer.parseInt(pre_no));
	   vo.setMsg(msg);
	   PReplyDAO.preplyUpdate(vo);
	   //DAO연동 
	   return "redirect:../pboard/detail.do?p_no="+p_no;
	   
   }
   
//   ----------------------------------------------------------------ppbo_4
   @RequestMapping("ppreply/ppreply_insert.do")
   public String ppreply_insert(HttpServletRequest request,HttpServletResponse response)
   {
	   // bno , type ,  msg  ==> id, name  
	   try
	   { 
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   
 	   String pp_no=request.getParameter("pp_no");// 게시물 번호 
	   String type=request.getParameter("type"); // 카테고리 
	   String msg=request.getParameter("msg");
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
//	   String p_no=(String)session.getAttribute("p_no");
//	   String name=(String)session.getAttribute("name");
	   
	   PReplyVO vo=new PReplyVO();
	   vo.setPp_no(Integer.parseInt(pp_no));
	   vo.setId(id);
//	   vo.setName(name);
	   vo.setMsg(msg);
	   vo.setType(Integer.parseInt(type));
	   
	   String[] temp={"","pbo_4","ppbo_4"};//p_bo_4 가 1번(자유게시판) ,ppbo_4가 2번(자랑게시판) 
	   
	   String table=temp[Integer.parseInt(type)];
	   vo.setTable_name(table);
	   //DAO => 오라클 전송 
	   PReplyDAO.preplyInsert(vo);
	   return "redirect:../ppboard/detail.do?pp_no="+pp_no;// detail로 넘어가지 않고 있음 방법을 생각해야함 
   }
   @RequestMapping("ppreply/ppreply_delete.do")
   public String ppreply_delete(HttpServletRequest request,HttpServletResponse response)
   {
	   String pp_no=request.getParameter("pp_no");// 게시물번호 => detail로 이동
	   String pre_no=request.getParameter("pre_no"); // 댓글 번호 => 삭제
	   // 삭제 ==> DAO
//	   PReplyVO vo=new PReplyVO();
//	   vo.setPre_no(Integer.parseInt(pre_no));
//	   vo.setTable_name("pbo_4");
//	   PReplyDAO.preplyDelete(Integer.parseInt(pre_no),vo);
//	   
	   Map map=new HashMap();
	   map.put("p_no", Integer.parseInt(pre_no));
	   map.put("table_name","pbo_4");
	   return "redirect:../pboard/detail.do?pp_no="+pp_no;
   }
   @RequestMapping("ppreply/ppreply_update.do")
   public String ppreply_update(HttpServletRequest request,HttpServletResponse response)
   {
	   try
	   {
		   request.setCharacterEncoding("UTF-8");
	   }catch(Exception ex) {}
	   String pp_no=request.getParameter("pp_no");// 게시물번호 => detail로 이동
	   String pre_no=request.getParameter("pre_no"); // 댓글 번호 => 삭제
	   String msg=request.getParameter("msg");
	   
	   PReplyVO vo=new PReplyVO();
	   vo.setPre_no(Integer.parseInt(pre_no));
	   vo.setMsg(msg);
	   PReplyDAO.preplyUpdate(vo);
	   //DAO연동 
	   return "redirect:../pboard/detail.do?pp_no="+pp_no;
	   
   }
}
