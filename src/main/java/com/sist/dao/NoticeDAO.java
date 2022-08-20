package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import com.sist.vo.*;
public class NoticeDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   try
	   {
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   ssf=new SqlSessionFactoryBuilder().build(reader);
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   public static List<NoticeVO> noticeListData(Map map)
   {
	   List<NoticeVO> list=null;
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   list=session.selectList("noticeListData",map);
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // 반환 ==> POOLED(DBCP) => Connection생성(8개)
	   }
	   return list;
   }
   public static int noticeTotalPage()
   {
	   int total=0;
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   total=session.selectOne("noticeTotalPage");
	   }catch(Exception ex)
	   {
		   System.out.println("noticeTotalPage : error");
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // POOL => 반환 
	   }
	   return total;
   }
   public static void noticeInsert(NoticeVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);//openSession(true);
		   session.insert("pboardInsert",vo); // commit(X)
		   //session.commit();
	   }catch(Exception ex)
	   {
		   System.out.println("noticeInsertPage : error");
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // POOL => 반환 
	   }
   }
  
   public static NoticeVO noticeDetailData(int n_no)
   {
	   NoticeVO vo=new NoticeVO();
	   SqlSession session=null;
	   
	   try
	   {
		   session=ssf.openSession(true);
		   session.update("n_hitIncrement",n_no);//commit수행을 하지 않는다 
		   vo=session.selectOne("noticeDetailData",n_no);
	   }catch(Exception ex)
	   {
		   System.out.println("noticeDetailData : error");
		   ex.printStackTrace();
		   //session.rollback();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // POOL => 반환 
	   }
	   return vo;
   }
   
   public static NoticeVO noticeUpdateData(int n_no)
   {
	   NoticeVO vo=new NoticeVO();
	   SqlSession session=null;
	   
	   try
	   {
		   // openSession() => setAutoCommit(false)
		   // openSession(true) => setAutoCommit(true)
		   session=ssf.openSession();
		   vo=session.selectOne("noticeDetailData",n_no);
	   }catch(Exception ex)
	   {
		   System.out.println("noticeDetailData : error");
		   ex.printStackTrace();
		   //session.rollback();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // POOL => 반환 
	   }
	   return vo;
   }
  
   
   public static void noticeUpdate(NoticeVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);//openSession(true);
		   session.update("noticeUpdate",vo); // commit(X)
		   //session.commit();
	   }catch(Exception ex)
	   {
		   System.out.println("noticeupdate : error");
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // POOL => 반환 
	   }
   }
   
   public static String noticeDelete(int n_no)
   {
	   String result="";
	   // 오라클 연결 
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(); 
		  session.delete("noticeDelete", n_no);
		  session.commit();
		   
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
	   return result;
   }
   
   
}