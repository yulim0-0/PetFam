package com.sist.vo;

import java.util.*;

/*
 * Name    Null?    Type           
------- -------- -------------- 
N_NO    NOT NULL NUMBER         
SUBJECT NOT NULL VARCHAR2(100)  
REGDATE          DATE           
CONTENT NOT NULL CLOB           
TYPE             VARCHAR2(20)   
HIT              NUMBER         
FAQ              VARCHAR2(1000) 
ID      NOT NULL VARCHAR2(20)   

 */
public class NoticeVO {
 private int hit,n_no;
 private String subject,content,type,faq,id,dbday;
 private Date regdate;
public int getHit() {
	return hit;
}
public void setHit(int hit) {
	this.hit = hit;
}
public int getN_no() {
	return n_no;
}
public void setN_no(int n_no) {
	this.n_no = n_no;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getType() {
	return type;
}
public void setType(String type) {
	this.type = type;
}
public String getFaq() {
	return faq;
}
public void setFaq(String faq) {
	this.faq = faq;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getDbday() {
	return dbday;
}
public void setDbday(String dbday) {
	this.dbday = dbday;
}
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
}
