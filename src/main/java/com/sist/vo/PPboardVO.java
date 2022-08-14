package com.sist.vo;

import java.util.Date;

/* ppbo_4      
Name       Null?    Type           
---------- -------- -------------- 
PP_NO      NOT NULL NUMBER         
SUBJECT    NOT NULL VARCHAR2(100)  
CONTENT    NOT NULL CLOB           
REGDATE             DATE           
HIT                 NUMBER         
GOOD_COUNT          NUMBER         
ID         NOT NULL VARCHAR2(20)   
PP_ATTACH           VARCHAR2(2000) 
RCOUNT              NUMBER         
NAME       NOT NULL VARCHAR2(20)   
PWD        NOT NULL VARCHAR2(20)   
 */
public class PPboardVO {
 private int pp_no,hit,good_count,rcount;
 private String subject,id,content,pp_attach,name,dbday,pwd;
 private Date regdate;
 
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
public int getRcount() {
	return rcount;
}
public void setRcount(int rcount) {
	this.rcount = rcount;
}
public int getPp_no() {
	return pp_no;
}
public void setPp_no(int pp_no) {
	this.pp_no = pp_no;
}
public int getHit() {
	return hit;
}
public void setHit(int hit) {
	this.hit = hit;
}
public int getGood_count() {
	return good_count;
}
public void setGood_count(int good_count) {
	this.good_count = good_count;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public String getPp_attach() {
	return pp_attach;
}
public void setPp_attach(String pp_attach) {
	this.pp_attach = pp_attach;
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
