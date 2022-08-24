package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.PReplyVO;

public class PReplyDAO {
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
	   
	   // <select id="replyListData" resultType="ReplyVO" parameterType="ReplyVO">
	   public static List<PReplyVO> preplyListData(PReplyVO vo)
	   {
		   List<PReplyVO> list=null;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("preplyListData",vo);
		   }catch(Exception ex)
		   {
			   System.out.println("preplyListData : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); 
		   }
		   return list;
	   }
	   
	   public static void preplyInsert(PReplyVO vo)
	   {
		   
		   SqlSession session=null;
		   
		   try
		   {
			   session=ssf.openSession(true);
			   session.update("countIncrement",vo);
			   session.insert("preplyInsert",vo);
		   }catch(Exception ex)
		   {
			   System.out.println("preplyInsert : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // 반환 ==> POOLED(DBCP) => Connection생성(8개)
		   }
		   
	   }
	  
	   
	   public static void preplyDelete(int pre_no,Map map)
	   {
		   SqlSession session=null;
		   try {
		   
		   session=ssf.openSession();
		  
		   
		   session.update("countDecrement",map);// 댓글 삭제 
		   session.delete("preplyDelete",pre_no);
		   session.commit();
		   }
		   catch(Exception ex) {
			   System.out.println("preplyDelete: error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	 
	   public static void preplyUpdate(PReplyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("preplyUpdate",vo);
		   session.close();
	   }
}
