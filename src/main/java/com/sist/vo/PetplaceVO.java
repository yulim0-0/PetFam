package com.sist.vo;
	//park, cafe, pension
public class PetplaceVO { 
	/*
	 C_NO     NOT NULL NUMBER         
	TITLE    NOT NULL VARCHAR2(100)  
	CATEGORY          NUMBER         
	POSTER            VARCHAR2(500)  
	ADDR              VARCHAR2(200)  
	TEL               VARCHAR2(100)  
	SUBTITLE          VARCHAR2(3000) 
	MAP               VARCHAR2(500)  
	GOOD              NUMBER         
	 */
	
	private int c_no, category;
	private String title,poster,addr, tel, subtitle, map, good;
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public String getGood() {
		return good;
	}
	public void setGood(String good) {
		this.good = good;
	}

}