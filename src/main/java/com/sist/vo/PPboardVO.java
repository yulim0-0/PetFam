package com.sist.vo;

import java.util.Date;

/* ppbo_4      
 * 
 Name       Null?    Type           
---------- -------- -------------- 
PP_NO      NOT NULL NUMBER         
SUBJECT    NOT NULL VARCHAR2(100)  
CONTENT    NOT NULL CLOB           
REGDATE             DATE           
HIT                 NUMBER         
GOOD_COUNT          NUMBER         
ID         NOT NULL VARCHAR2(20)   
FILENAME            VARCHAR2(1000) 
RCOUNT              NUMBER         
NAME       NOT NULL VARCHAR2(20)   
PWD        NOT NULL VARCHAR2(20)   
FILESIZE            VARCHAR2(2000) 
FILECOUNT           NUMBER         
 */
public class PPboardVO {
 private int pp_no,hit,good_count,rcount,filecount;
 private String subject,id,content,name,dbday,pwd,filesize,filename;
 private Date regdate;
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
public int getRcount() {
	return rcount;
}
public void setRcount(int rcount) {
	this.rcount = rcount;
}
public int getFilecount() {
	return filecount;
}
public void setFilecount(int filecount) {
	this.filecount = filecount;
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
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getDbday() {
	return dbday;
}
public void setDbday(String dbday) {
	this.dbday = dbday;
}
public String getPwd() {
	return pwd;
}
public void setPwd(String pwd) {
	this.pwd = pwd;
}
public String getFilesize() {
	return filesize;
}
public void setFilesize(String filesize) {
	this.filesize = filesize;
}
public String getFilename() {
	return filename;
}
public void setFilename(String filename) {
	this.filename = filename;
}
public Date getRegdate() {
	return regdate;
}
public void setRegdate(Date regdate) {
	this.regdate = regdate;
}
 
}
