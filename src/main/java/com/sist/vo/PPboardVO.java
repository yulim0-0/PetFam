package com.sist.vo;

import java.util.Date;

/*
 * Name       Null?    Type           
---------- -------- -------------- 
PP_NO      NOT NULL NUMBER         
SUBJECT    NOT NULL VARCHAR2(100)  
CONTENT    NOT NULL CLOB           
REGDATE             DATE           
HIT                 NUMBER         
GOOD_COUNT          NUMBER         
ID         NOT NULL VARCHAR2(20)   
PP_ATTACH           VARCHAR2(2000) 파일 사진 

 */
public class PPboardVO {
 private int pp_no,hit,good_count;
 private String subject,id,content,pp_attach,dbday;
 private Date regdate;
}
