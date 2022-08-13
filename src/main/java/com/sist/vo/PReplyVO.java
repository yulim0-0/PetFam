package com.sist.vo;
import java.util.*;
/*
 * p_repl_4
 Name       Null?    Type          
---------- -------- ------------- 
PRE_NO     NOT NULL NUMBER        
MSG        NOT NULL VARCHAR2(200) 
REGDATE             DATE          
GROUP_ID            NUMBER        
GROUP_STEP          NUMBER        
GROUP_TAB           NUMBER        
PP_NO      NOT NULL NUMBER        
P_NO       NOT NULL NUMBER        
DEPTH               NUMBER        
ID         NOT NULL VARCHAR2(20)  
TYPE                NUMBER        
ROOT                NUMBER        

 */
public class PReplyVO {
	private int pre_no,p_no,pp_no,group_id,group_tab,group_step,depth,root,type;
	private String dbday,msg,id,table_name;
	private Date regdate;
	
	public String getTable_name() {
		return table_name;
	}
	public void setTable_name(String table_name) {
		this.table_name = table_name;
	}
	public int getPre_no() {
		return pre_no;
	}
	public void setPre_no(int pre_no) {
		this.pre_no = pre_no;
	}
	public int getP_no() {
		return p_no;
	}
	public void setP_no(int p_no) {
		this.p_no = p_no;
	}
	public int getPp_no() {
		return pp_no;
	}
	public void setPp_no(int pp_no) {
		this.pp_no = pp_no;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getGroup_tab() {
		return group_tab;
	}
	public void setGroup_tab(int group_tab) {
		this.group_tab = group_tab;
	}
	public int getGroup_step() {
		return group_step;
	}
	public void setGroup_step(int group_step) {
		this.group_step = group_step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getRoot() {
		return root;
	}
	public void setRoot(int root) {
		this.root = root;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getDbday() {
		return dbday;
	}
	public void setDbday(String dbday) {
		this.dbday = dbday;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
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
