package com.sist.model;

import java.util.*;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.vo.BookingVO;
import com.sist.vo.JjimVO;
import com.sist.vo.OrderVO;
import com.sist.vo.ReviewVO;
import com.sist.vo.UserVO;
import com.sist.dao.BookingDAO;



@Controller
public class BookingModel {
	@RequestMapping("booking/hospital_list.do")
	public String booking_Hospital(HttpServletRequest request, HttpServletResponse response)
	{
		try
		   {
			   request.setCharacterEncoding("UTF-8");
		   }catch(Exception ex) {}
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		String store=request.getParameter("store");
		if(store==null) 
			store="";
		String[] chitem=request.getParameterValues("chitem");
		/*
		 * if(chitem==null) chitem=null; System.out.println(chitem+":");
		 */
		String strChitem = request.getParameter("strChitem");
		
		if(strChitem == null || strChitem.equals("")) {
			strChitem = "";
		}
		if(chitem!=null) {
			for (int i = 0; i < chitem.length; i++) { System.out.println(chitem[i]); }
			strChitem = String.join("|", chitem); 
		}
		 
		 
		
			/*
			 * if(chitem==null) chitem=null; System.out.println(chitem+":");
			 */
		 
		int curpage=Integer.parseInt(page);
		int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);//rownum=1
		int end=(curpage*rowSize);
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("s", 19);
		map.put("e", 515);
		map.put("store", store);
		map.put("chitem", strChitem);
		
		List<BookingVO> list=BookingDAO.bookingListData(map);
		
		Map map2=new HashMap();
		map2.put("store", store);
		map2.put("chitem", strChitem);
		
		/* int totalpage=BookingDAO.bookingTotalPage(store); */
		 
		 int totalpage2=BookingDAO.bookingTotalPage2(map2);
		 
		   System.out.println("totalpage="+totalpage2);
		   final int BLOCK=5;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1;
		   /*
		    *   [1][2][3][4][5]  => startPage =1 
		    *                       endPage   =5
		    *   [6][7][8][9][10] => startPage=6
		    *                       endPage=10
		    */
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   
		   if(endPage>totalpage2)
			    endPage=totalpage2;
		   
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage2);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   request.setAttribute("list", list);
		   request.setAttribute("store", store);
		   request.setAttribute("chitem", strChitem);
		   request.setAttribute("strChitem", strChitem);
		
		request.setAttribute("main_jsp", "../booking/hospital_list.jsp");
		return "../main/main.jsp";
	}
	
	
	
	@RequestMapping("booking/salon_list.do")
	public String booking_salon(HttpServletRequest request, HttpServletResponse response)
	{
		/*String page=request.getParameter("page");
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
		   request.setAttribute("list", list);*/
		
		
		request.setAttribute("main_jsp", "../booking/salon_list.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("booking/training_list.do")
	public String booking_training(HttpServletRequest request, HttpServletResponse response)
	{
		/*String page=request.getParameter("page");
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
		   request.setAttribute("list", list);*/
		
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
	 
	 @RequestMapping("booking/new_detail.do")
	   public String review(HttpServletRequest request,HttpServletResponse response)
	   {
		   String o_no=request.getParameter("o_no");
		   String oi_no=request.getParameter("oi_no");
		   
		   BookingVO vo=BookingDAO.hospitalDetailData(Integer.parseInt(o_no));
		   
		   request.setAttribute("vo", vo);
		   request.setAttribute("main_jsp", "../booking/new_detail.jsp");
		   
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
		   
		   request.setAttribute("o_no", o_no);
		   request.setAttribute("oi_no", oi_no);
		   List<ReviewVO> list=BookingDAO.reviewListData(Integer.parseInt(oi_no));
		   request.setAttribute("list", list);
		   
		   
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
		  HttpSession session=request.getSession();
		  String id=(String)session.getAttribute("id");
		  String name=(String)session.getAttribute("name");
		  String phone=(String)session.getAttribute("phone");
		  String email=(String)session.getAttribute("email");
		  
		  List<UserVO> list=BookingDAO.bookingUserInfo(id);
		  
		  request.setAttribute("list", list);
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
	 
	 @RequestMapping("booking/booking_ok.do")
	    public String booking_ok(HttpServletRequest request,HttpServletResponse response)
	    {
	    	try
	    	{
	    		request.setCharacterEncoding("UTF-8");
	    	}catch(Exception ex){}
	    	/*
			 * OI_NO NUMBER No 1 예약정보 
			 * ORDER_DATE VARCHAR2(2000 BYTE) No 2 
			 * 예약일 ORDER_TIME VARCHAR2(2000 BYTE) No 3
			 * 예약시간 REGDATE DATE No SYSDATE 4 예약등록날짜
			 * MSG VARCHAR2(1000 BYTE) No 5 기타요구사항 
			 * O_NO NUMBER No 6 상품번호 
			 * ID VARCHAR2(20 BYTE) No 7 회원ID 
			 * STATE VARCHAR2(20 BYTE) No 'n' 8 예약상태
			 */
	    	String o_no=request.getParameter("o_no");
	    	String order_date=request.getParameter("order_date");
	    	String order_time=request.getParameter("order_time");
	    	String msg=request.getParameter("msg");
	    	
	    	
	    	
	    	System.out.println(o_no);
	    	System.out.println(order_date);
	    	System.out.println(order_time);
	    	System.out.println(msg);
	    	HttpSession session=request.getSession();
	    	String id=(String)session.getAttribute("id");
			
	    	OrderVO vo=new OrderVO();
	    	vo.setO_no(Integer.parseInt(o_no));
	    	vo.setId(id);
	    	vo.setOrder_date(order_date);
	    	vo.setOrder_time(order_time);
	    	vo.setMsg(msg);
	    	
	    	System.out.println(id+"."+o_no+"예약완료");
	    	BookingDAO.bookingInsert(vo);
	    	return "redirect:../main/main.do";
	    }
	 
	 @RequestMapping("booking/review_ok.do")
	    public String review_ok(HttpServletRequest request,HttpServletResponse response)
	    {
		   //System.out.println("1111111111111111111");
		   String o_no="",oi_no="";
	    	try
	    	{
	    		request.setCharacterEncoding("UTF-8");
	    	
	    	/*
			 * RV_NO   NOT NULL NUMBER          리뷰번호(pk)
				CONTENT NOT NULL VARCHAR2(2000) 리뷰내용
				ID      NOT NULL VARCHAR2(20)   아이디 (fk)
				OI_NO   NOT NULL NUMBER         예약번호 (fk)
				OPTIONS NOT NULL VARCHAR2(10)   옵션
			 */
	    	//String rv_no=request.getParameter("rv_no");
	    	o_no=request.getParameter("o_no");
	        oi_no=request.getParameter("oi_no");
	    	String content=request.getParameter("content");
	    	String options=request.getParameter("options");
	    	
	    	
	    	System.out.println(content);
	    	System.out.println(options);
	    	System.out.println("o_no="+o_no);
	    	System.out.println("oi_no="+oi_no);
	    	HttpSession session=request.getSession();
	    	String id=(String)session.getAttribute("id");
	    	
	    
			System.out.println(id);
			
	    	
	    	ReviewVO vo=new ReviewVO();
	    	
	    	//vo.setRv_no(Integer.parseInt(rv_no));
	    	vo.setContent(content);
	    	vo.setId(id);
	    	vo.setOptions(options);
	    	vo.setOi_no(Integer.parseInt(oi_no));
	    	
	    	BookingDAO.reviewInsert(vo);
			System.out.println(id + "." +"리뷰 쓰기 완료");
	    	}catch(Exception ex){ex.printStackTrace();}
	    	return "redirect:../booking/new_detail.do?o_no="+o_no+"&oi_no="+oi_no;
	    	
	    	
	    }
}
