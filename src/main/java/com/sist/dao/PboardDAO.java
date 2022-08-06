package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import com.sist.vo.*;
public class PboardDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   try
	   {
		   // XML 읽기 
		   // src/main/java => Config.xml  (classpath영역=>마이바티스 자동인식)
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   ssf=new SqlSessionFactoryBuilder().build(reader);
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   public static List<PboardVO> pboardListData(Map map)
   {
	   List<PboardVO> list=null;
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   list=session.selectList("pboardListData",map);
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
   public static int pboardTotalPage()
   {
	   int total=0;
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   total=session.selectOne("pboardTotalPage");
	   }catch(Exception ex)
	   {
		   System.out.println("pboardTotalPage : error");
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // POOL => 반환 
	   }
	   return total;
   }
   public static void pboardInsert(PboardVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);//openSession(true);
		   session.insert("pboardInsert",vo); // commit(X)
		   //session.commit();
	   }catch(Exception ex)
	   {
		   System.out.println("pboardTotalPage : error");
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // POOL => 반환 
	   }
   }
   // <select id="boardDetailData" resultType="FreeBoardVO" parameterType="int">
   public static PboardVO pboardDetailData(int p_no)
   {
	   PboardVO vo=new PboardVO();
	   SqlSession session=null;
	   
	   try
	   {
		   // openSession() => setAutoCommit(false)
		   // openSession(true) => setAutoCommit(true)
		   session=ssf.openSession();
		   session.update("hitIncrement",p_no);//commit수행을 하지 않는다 
		   session.commit();//commit을 수행 요청 
		   vo=session.selectOne("pboardDetailData",p_no);
	   }catch(Exception ex)
	   {
		   System.out.println("pboardDetailData : error");
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
   
   public static PboardVO pboardUpdateData(int p_no)
   {
	   PboardVO vo=new PboardVO();
	   SqlSession session=null;
	   
	   try
	   {
		   // openSession() => setAutoCommit(false)
		   // openSession(true) => setAutoCommit(true)
		   session=ssf.openSession();
		   vo=session.selectOne("pboardDetailData",p_no);
	   }catch(Exception ex)
	   {
		   System.out.println("pboardDetailData : error");
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
   public static String pboardPwdCheck(int p_no,String pwd)
   {
	   String result="";
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   String db_pwd=session.selectOne("pboardGetPassword",p_no);
		   if(db_pwd.equals(pwd))
		   {
			   result="yes";
		   }
		   else
		   {
			   result="no";
		   }
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
   
   public static void pboardUpdate(PboardVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);//openSession(true);
		   session.update("pboardUpdate",vo); // commit(X)
		   //session.commit();
	   }catch(Exception ex)
	   {
		   System.out.println("pboardupdate : error");
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // POOL => 반환 
	   }
   }
   
   public static String pboardDelete(int p_no,String pwd)
   {
	   String result="";
	   // 오라클 연결 
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(); 
		   //<select id="boardGetPassword" resultType="string" parameterType="int">
		   /*
		    *  SELECT pwd FROM project_freeboard
               WHERE no=#{no}
               
               map.put("boardGetPassword","SELECT pwd FROM project_freeboard
               WHERE no=#{no}")
		    */
		   String db_pwd=session.selectOne("pboardGetPassword", p_no);
		   if(db_pwd.equals(pwd))
		   {
			   result="yes";
			   /*
			    *  <delete id="boardDelete" parameterType="int">
				    DELETE FROM project_freeboard
				    WHERE no=#{no}
				   </delete>
			    */
			   session.delete("pboardDelete",p_no);
			   session.commit();
		   }
		   else
		   {
			   result="no";
		   }
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



