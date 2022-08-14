package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import com.sist.vo.*;
public class PPboardDAO {
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
   public static List<PPboardVO> ppboardListData(Map map)
   {
	   List<PPboardVO> list=null;
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   list=session.selectList("ppboardListData",map);
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
   public static int ppboardTotalPage()
   {
	   int total=0;
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   total=session.selectOne("ppboardTotalPage");
	   }catch(Exception ex)
	   {
		   System.out.println("ppboardTotalPage : error");
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // POOL => 반환 
	   }
	   return total;
   }
   public static void ppboardInsert(PPboardVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);//openSession(true);
		   session.insert("ppboardInsert",vo); // commit(X)
		   //session.commit();
	   }catch(Exception ex)
	   {
		   System.out.println("ppboardInsertPage : error");
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // POOL => 반환 
	   }
   }
   // <select id="pboardDetailData" resultType="PboardVO" parameterType="int">
   public static PPboardVO ppboardDetailData(int pp_no)
   {
	   PPboardVO vo=new PPboardVO();
	   SqlSession session=null;
	   
	   try
	   {
		   // openSession() => setAutoCommit(false)
		   // openSession(true) => setAutoCommit(true)
		   session=ssf.openSession(true);
		   session.update("phitIncrement",pp_no);//commit수행을 하지 않는다 
		   /*
		    * <update id="hitIncrement" parameterType="int">// 조회수 증가 
			    UPDATE pbo_4 SET
			    hit=hit+1
			    WHERE p_no=#{p_no}
			  </update>
		    */
//		   session.commit();//commit을 수행 요청 
		   vo=session.selectOne("ppboardDetailData",pp_no);
	   }catch(Exception ex)
	   {
		   System.out.println("ppboardDetailData : error");
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
   
   public static PPboardVO ppboardUpdateData(int pp_no)
   {
	   PPboardVO vo=new PPboardVO();
	   SqlSession session=null;
	   
	   try
	   {
		   // openSession() => setAutoCommit(false)
		   // openSession(true) => setAutoCommit(true)
		   session=ssf.openSession();
		   vo=session.selectOne("ppboardDetailData",pp_no);
	   }catch(Exception ex)
	   {
		   System.out.println("ppboardDetailData : error");
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
   public static String ppboardPwdCheck(int pp_no,String pwd)
   {
	   String result="";
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   String db_pwd=session.selectOne("ppboardGetPassword",pp_no);
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
   
   public static void ppboardUpdate(PPboardVO vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);//openSession(true);
		   session.update("ppboardUpdate",vo); // commit(X)
		   //session.commit();
	   }catch(Exception ex)
	   {
		   System.out.println("ppboardupdate : error");
		   ex.printStackTrace();
	   }
	   finally
	   {
		   if(session!=null)
			   session.close(); // POOL => 반환 
	   }
   }
   
   public static String ppboardDelete(int pp_no,String pwd)
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
		   String db_pwd=session.selectOne("ppboardGetPassword", pp_no);
		   if(db_pwd.equals(pwd))
		   {
			   result="yes";
			   /*
			    *  <delete id="boardDelete" parameterType="int">
				    DELETE FROM project_freeboard
				    WHERE no=#{no}
				   </delete>
			    */
			   session.delete("ppboardDelete",pp_no);
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



