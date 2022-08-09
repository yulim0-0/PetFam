package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.PetplaceDAO;
import com.sist.vo.PetplaceVO;

import java.util.*;

@Controller
public class PetplaceModel {
	@RequestMapping("petplace/cafe.do")
	public String petplace_cafe(HttpServletRequest request,HttpServletResponse response)
	{
		String page=request.getParameter("page");
		if(page==null)
			page="1";
		int curpage=Integer.parseInt(page);
		Map map=new HashMap();
		int rowSize=9;
		int start=(rowSize*curpage)-(rowSize-1);//rownum
		int end=curpage*rowSize;
		
		System.out.println("==================================================");
		System.out.println("page="+page);
		System.out.println("start="+start);
		System.out.println("end="+end);
		
		map.put("start", start); // #{start}
		map.put("end", end);  //#{end}
		map.put("table_name", "rcpg_4"); //${table_name}
		List<PetplaceVO> list=PetplaceDAO.petplaceListData(map);
		int totalpage=PetplaceDAO.petplaceTotalPage(map);
		
		
		/* System.out.println("totalpage="+totalpage); */
		final int BLOCK=5;
		int startPage=((curpage-1)/BLOCK*BLOCK)+1;   //6
		int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
				endPage=totalpage;
		/*
		 * [1][2][3][4][5]
		 * start       end
		 * startpage=1, endpage=5
		 * [6][7][8][9][10]
		 * start        end
		 * srtartpage=6, endpage=10
		 *  
		 * */
		request.setAttribute("curpage",curpage);
		request.setAttribute("totalPage",totalpage);
		request.setAttribute("startPage",startPage);
		request.setAttribute("endPage",endPage);
		request.setAttribute("list",list);
		
		System.out.println("curpage="+curpage);
		System.out.println("totalPage="+totalpage);
		System.out.println("startPage="+startPage);
		System.out.println("endPage="+endPage);
		
		request.setAttribute("main_jsp", "../petplace/cafe.jsp");
		return "../main/main.jsp";
		
	
	
	}
}