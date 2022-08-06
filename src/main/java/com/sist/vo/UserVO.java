package com.sist.vo;

public class UserVO {
/*
ID       NOT NULL VARCHAR2(20)  
PWD               VARCHAR2(20)  
NAME              VARCHAR2(10)  
BIRTHDAY          VARCHAR2(8)   
PHONE             VARCHAR2(13)  
EMAIL             VARCHAR2(30)  
ZIPCODE           NUMBER(5)     
ADDR1             VARCHAR2(100) 
ADDR2             VARCHAR2(100) 
GENDER            VARCHAR2(10)  

*/
	private String id, pwd, name, birthday, phone, email, addr1, addr2, gender, zipcode, admin;
	private String msg;

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
}
