package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.BookingDAO;
import com.sist.dao.PetplaceDAO;
import com.sist.vo.BookingVO;
import com.sist.vo.PetplaceVO;

import java.util.*;

@Controller
public class PetplaceModel {
	@RequestMapping("petplace/cafe.do")
	public String petplace_cafe(HttpServletRequest request,HttpServletResponse response)
	{
		String page2=request.getParameter("page2");
		if(page2==null)
			page2="1";
		int curpage2=Integer.parseInt(page2);
		Map map=new HashMap();
		int rowSize2=9;
		int start=(rowSize2*curpage2)-(rowSize2-1);//rownum
		int end=(curpage2*rowSize2);
		
		map.put("start2", start); // #{start}
		map.put("end2", end);  //#{end}
		map.put("table_name2", "RCPG_4"); //${table_name}
		
		
		List<PetplaceVO> list2=PetplaceDAO.petplaceListData(map);
		int totalpage2=PetplaceDAO.petplaceTotalPage(map);
		  System.out.println("totalpage2="+totalpage2);
		final int BLOCK=5;
		int startPage2=((curpage2-1)/BLOCK*BLOCK)+1;   //6
		int endPage2=((curpage2-1)/BLOCK*BLOCK)+BLOCK;
		/*
		 * [1][2][3][4][5]
		 * start       end
		 * startpage=1, endpage=5
		 * [6][7][8][9][10]
		 * start        end
		 * srtartpage=6, endpage=10
		 *  
		 * */
		request.setAttribute("curpage2",curpage2);
		request.setAttribute("totalPage2",totalpage2);
		request.setAttribute("startPage2",startPage2);
		request.setAttribute("endPage2",endPage2);
		request.setAttribute("list2",list2);
		
		request.setAttribute("main_jsp", "../petplace/cafe.jsp");
		return"../main/main.jsp";
		
	
	
	}
}