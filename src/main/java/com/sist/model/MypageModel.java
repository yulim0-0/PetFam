package com.sist.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.RequestMapping;

public class MypageModel {
	@RequestMapping("mypage/mypage.do")
	public String user_logout(HttpServletRequest request, HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../mypage/myinfo");
		return "redirect:../main/main.do";
	}
}
