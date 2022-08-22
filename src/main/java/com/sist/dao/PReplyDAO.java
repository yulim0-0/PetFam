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
	   /*
	    *  // 일괄 처리 (동시에 처리 : 성공 , 한개 실패=> 전부 취소)
		    public void replyToReplyInsert(int root,ReplyVO vo)
		    {
			   	 // 1. 상위 정보 
			   	 ReplyVO pvo=getSqlSession().selectOne("replyParentInfoData",root);
			   	 // parent => group_id , group_step , group_tab
			   	 getSqlSession().update("replyGroupStepIncrement",pvo);
			   	 // 실제 추가 
			   	 vo.setGroup_id(pvo.getGroup_id());
			   	 vo.setGroup_step(pvo.getGroup_step()+1);
			   	 vo.setGroup_tab(pvo.getGroup_tab()+1);
			   	 vo.setRoot(root);
			   	 getSqlSession().insert("replyToReplyInsert",vo);
			   	 // depth증가
			   	 getSqlSession().update("replyDepthIncrement",root);
		    }
	    */
	   public void preplyToReplyInsert(int root,PReplyVO vo)// 대댓글용!
	   {
		   SqlSession session=null;
		  PReplyVO pvo=null;
		   try {
			session=ssf.openSession(true);
			pvo=session.selectOne("replyParentInfoData",root);
			session.update("preplyGroupStepIncrement",pvo);
			session.update("preplyDepthIncrement",root);//depth증가 
			session.insert("preplyToReplyInsert",vo);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println("preplyToReplyInsert:error");
			e.printStackTrace();
		}
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   
	   /*
	    *   <delete id="replyDelete" parameterType="int">
			   DELETE FROM project_reply
			   WHERE no=#{no}
			  </delete>
	    */
	   public static void preplyDelete(int pre_no,Map map)
	   {
		   PReplyVO vo=null;
		   SqlSession session=null;
		   try {
		   
		   session=ssf.openSession();
		   if(vo.getDepth()==0)
		   {
		   session.update("countDecrement",map);// 댓글 삭제 
		   session.delete("preplyDelete",pre_no);
		   }
		   else//댓글이 있는 경우 
		   {
			   session.update("preplyDelete",pre_no);
		   }
		   session.update("depthDecrement",vo.getRoot());
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
	   /*
	    *  <update id="replyUpdate" parameterType="ReplyVO">
			   UPDATE project_reply SET
			   msg=#{msg}
			   WHERE no=#{no}
			  </update>
	    */
	   public static void preplyUpdate(PReplyVO vo)
	   {
		   SqlSession session=ssf.openSession(true);
		   session.update("preplyUpdate",vo);
		   session.close();
	   }
}
