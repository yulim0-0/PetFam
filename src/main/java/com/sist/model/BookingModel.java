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
		map.put("table_name", "ord_4");
		List<BookingVO> list=BookingDAO.bookingListData(map);
		request.setAttribute("list", list);
		
		request.setAttribute("main_jsp", "../booking/hospital_list.jsp");
		return "../main/main.jsp";
	}
}
