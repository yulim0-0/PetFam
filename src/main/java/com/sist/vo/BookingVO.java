package com.sist.vo;
/*
 * O_NO    NOT NULL NUMBER         
NAME    NOT NULL VARCHAR2(100)  
PRICE   NOT NULL VARCHAR2(34)   
STORE   NOT NULL VARCHAR2(100)  
S_INFO           VARCHAR2(500)  
POSTER  NOT NULL VARCHAR2(1000) 
IMG     NOT NULL VARCHAR2(1000) 
ADDRESS NOT NULL VARCHAR2(500)  
 */
public class BookingVO {
	private int o_no,price;
	private String name,store,s_info,poster,img,address,strPrice;
	
	public String getStrPrice() {
		return strPrice;
	}
	public void setStrPrice(String strPrice) {
		this.strPrice = strPrice;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public String getS_info() {
		return s_info;
	}
	public void setS_info(String s_info) {
		this.s_info = s_info;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
}
