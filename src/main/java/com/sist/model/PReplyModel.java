package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.PboardDAO;
import com.sist.dao.PReplyDAO;
import com.sist.vo.PReplyVO;
/*
 *      NO      NOT NULL NUMBER    ==> 자동 증가    
		BNO              NUMBER       
		TYPE             NUMBER     
		--------------------------------  
		ID      NOT NULL VARCHAR2(20) 
		NAME    NOT NULL VARCHAR2(34) 
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
	   HttpSession session=request.getSession();
	   String id=(String)session.getAttribute("id");
	   String name=(String)session.getAttribute("name");
	   
	   PReplyVO vo=new PReplyVO();
	   vo.setPre_no(Integer.parseInt(p_no));
	   vo.setId(id);
	   vo.setName(name);
	   vo.setMsg(msg);
	   vo.setType(Integer.parseInt(type));
	   
	   String[] temp={"","p_bo_4","pp_bo_4"};//p_bo_4 가 1번(자유게시판) ,pp_bo_4가 2번(자랑게시판) 
	   
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
	   PReplyDAO.preplyDelete(Integer.parseInt(pre_no));
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
}
