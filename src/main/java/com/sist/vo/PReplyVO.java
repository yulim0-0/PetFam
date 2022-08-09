package com.sist.vo;
import java.util.*;
/*
 * p_repl_4
 * Name       Null?    Type          
---------- -------- ------------- 
PRE_NO     NOT NULL NUMBER        
MSG        NOT NULL VARCHAR2(200) 
REGDATE             DATE          
GROUP_ID            VARCHAR2(20)  
GROUP_STEP          VARCHAR2(20)  
GROUP_TAB           NUMBER        
PP_NO      NOT NULL NUMBER    보류     
P_NO       NOT NULL NUMBER    보류    
DEPTH               NUMBER        
ID         NOT NULL VARCHAR2(20)  
TYPE                NUMBER        
ROOT                NUMBER        
 */
public class PReplyVO {
	private int pre_no, group_tab,depth,type,root,bno;
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	private String group_id,group_step,id,dbday,table_name,name,msg;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	private Date regdate;
	public int getPre_no() {
		return pre_no;
	}
	public void setPre_no(int pre_no) {
		this.pre_no = pre_no;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public int getGroup_tab() {
		return group_tab;
	}
	public void setGroup_tab(int group_tab) {
		this.group_tab = group_tab;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public String getGroup_id() {
		return group_id;
	}
	public void setGroup_id(String group_id) {
		this.group_id = group_id;
	}
	public String getGroup_step() {
		return group_step;
	}
	public void setGroup_step(String group_step) {
		this.group_step = group_step;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
