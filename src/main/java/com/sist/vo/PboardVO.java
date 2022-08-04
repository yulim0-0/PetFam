package com.sist.vo;

import java.util.*;

/* pbo_4

Name       Null?    Type          
---------- -------- ------------- 
P_NO       NOT NULL NUMBER        
SUBJECT    NOT NULL VARCHAR2(100) 
CONTENT    NOT NULL CLOB          
PWD        NOT NULL VARCHAR2(20)  
REGDATE    NOT NULL DATE          
HIT                 NUMBER        
GOOD_COUNT          NUMBER        
ID         NOT NULL VARCHAR2(20)  
NAME       NOT NULL VARCHAR2(20)  
RCOUNT              NUMBER      

 */
public class PboardVO {
	private int p_no,hit,good_count,rcount;
	private String id,name,subject,content,pwd,dbday;
	private Date regdate;
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
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
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
