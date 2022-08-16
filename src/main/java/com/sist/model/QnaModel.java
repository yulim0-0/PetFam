package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

/*
 *   1. VO :데이터를 모아서 전송 
 *   2. mapper : SQL문장 
 *   3. DAO : 실제 오라클 연결 ==> SQL문장 전송 , 결과값 읽기 
 *   4. Model : JSP로 요청 결과값 전송 
 *   5. JSP : Model에서 보내준 데이터 출력 
 *   ----------------------------------------------- Spring MVC , Spring-BOOT(MVC)
 */
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.dao.*;
import com.sist.vo.*;
@Controller
public class QnaModel {
   @RequestMapping("qna/list.do") // URL주소 (클라이언트 == 서버) ==> 주소창 
   public String qna_list(HttpServletRequest request,HttpServletResponse response)
   {
	   String page=request.getParameter("page");
	   // 사용자가 전송한 데이터는 => request에 첨부되어 있다 
	   if(page==null)
		   page="1";
	   int curpage=Integer.parseInt(page);
	   Map map=new HashMap();
	   int rowSize=9;
	   int start=(rowSize*curpage)-(rowSize-1);
	   int end=rowSize*curpage;
	   
	   map.put("start", start);
	   map.put("end", end);
	   List<QnaVO> list=QnaDAO.qnaListData(map);
	   int totalpage=QnaDAO.qnaTotalPage();
//	   
//	   final int BLOCK=5;
//	   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
//	   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
//	   
//	   if(endPage>totalpage)
//		    endPage=totalpage;
	   
	   request.setAttribute("totalpage", totalpage);
	   request.setAttribute("list", list);
	   request.setAttribute("curpage", curpage);
	   request.setAttribute("main_jsp", "../qna/list.jsp");
	   return "../main/main.jsp";// 화면 출력 관리 
   }
   @RequestMapping("qna/insert.do")
   public String qna_insert(HttpServletRequest request,HttpServletResponse response)
   {
	   request.setAttribute("main_jsp", "../qna/insert.jsp");
	   return "../main/main.jsp";
   }
   @RequestMapping("qna/insert_ok.do")
   public String qna_insert_ok(HttpServletRequest request,HttpServletResponse response)
   {
	   // 데이터베이스 처리 
	   try
	   { 
            request.setCharacterEncoding("UTF-8"); // 한글 처리 		   
	   }catch(Exception ex) {}
	   
	   HttpSession session=request.getSession();//id 세션 받아오기 
	   String id=(String)session.getAttribute("id");
	   String name=(String)session.getAttribute("name");
	   System.out.println("id="+id);
	   String subject=request.getParameter("subject");
	   String content=request.getParameter("content");
	   String pwd=request.getParameter("pwd");
	   String pno=request.getParameter("pno");
	   QnaVO vo=new QnaVO();
	   vo.setId(id);
	   vo.setName(name);
	   vo.setSubject(subject);
	   vo.setContent(content);
	   vo.setPwd(pwd);
	   
	   QnaDAO.qnaInsertOk(Integer.parseInt(pno),vo);
	   return "redirect:../qna/list.do"; // insert_ok , update_ok , delete_ok
	   // 데이터 전송은 없고 처리후 이전에 실행된 화면으로 이동 (list,detail) => jsp파일을 따로 만들지 않아도 된다 
   }
   
   
   // board_reply/detail.do
   @RequestMapping("qna/detail.do")
   public String qna_detail(HttpServletRequest request,HttpServletResponse response)
   {
	   // board_reply/detail.do?no=${vo.no }
	   // C/S ==> 주고 받기 
	   // Client (요청 => 데이터 전송) => ?
	   // Server (요청 처리 => 결과값 => request,session => setAttribute())
	   // primary key , 검색어 , id(보안유지 => session) , page
	   // 장바구니 => 번호 
	   String q_no=request.getParameter("q_no");
	  QnaVO vo=QnaDAO.qnaDetailData(Integer.parseInt(q_no));
	   request.setAttribute("vo", vo);
	   request.setAttribute("main_jsp", "../qna/detail.jsp");
	   return "../main/main.jsp";
   }
   // .do ==> 처리 (Model)  board_reply/update.do?no=${vo.no } 
   @RequestMapping("qna/update.do")
   public String qna_update(HttpServletRequest request,HttpServletResponse response)
   {
	   // 출력할 데이터 전송 
	   String q_no=request.getParameter("q_no");
	   QnaVO vo=QnaDAO.qnaUpdateData(Integer.parseInt(q_no));
	   request.setAttribute("vo", vo);
	   request.setAttribute("main_jsp", "../qna/update.jsp");
	   return "../main/main.jsp";
   }
   // _ok : 화면 출력이 아니고 => 요청 처리 => 이동할 페이지를 재호출 (redirect)
   // board_reply/update_ok.do
   @RequestMapping("qna/update_ok.do")
   public String qna_update_ok(HttpServletRequest request,HttpServletResponse response)
   {
	   try
	   {
            request.setCharacterEncoding("UTF-8"); // 한글 처리 		   
	   }catch(Exception ex) {}
	   String id=request.getParameter("id");
	   String subject=request.getParameter("subject");
	   String content=request.getParameter("content");
	   String pwd=request.getParameter("pwd");
	   String q_no=request.getParameter("q_no");
	   QnaVO vo=new QnaVO();
	   vo.setName(id);
	   vo.setSubject(subject);
	   vo.setContent(content);
	   vo.setPwd(pwd);
	   vo.setQ_no(Integer.parseInt(q_no));
	   // DAO연동 ==> 처리 
	   QnaDAO.qnaUpdate(vo);
	   return "redirect:../qna/detail.do?q_no="+vo.getQ_no();
   }
   // board_reply/delete.do?no=${vo.no }
   @RequestMapping("qna/delete.do")
   public String qna_delete(HttpServletRequest request,HttpServletResponse response)
   {
	   String q_no=request.getParameter("q_no");
	   //DAO 연동 
	      QnaDAO.qnaDelete(Integer.parseInt(q_no));
	   return "redirect:../qna/list.do";
   }
   
}













