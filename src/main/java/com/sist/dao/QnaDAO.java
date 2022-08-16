package com.sist.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.util.*;
import com.sist.vo.*;

/*
 *    DAO => DAO+mapper+VO(데이터베이스 연결)
 *    Model => VO+DAO호출 (요청값을 전송) ==> JSP
 */
public class QnaDAO {
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
	   /*
	    *   <select id="boardReplyListData" resultType="BoardReplyVO" parameterType="hashmap">
			    SELECT no,subject,name,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,hit,isreply,group_id,group_tab,num
			    FROM (SELECT no,subject,name,regdate,hit,isreply,group_id,group_tab,rownum as num
			    FROM (SELECT no,subject,name,regdate,hit,isreply,group_id,group_tab
			    FROM project_replyBoard ORDER BY group_id DESC,group_step ASC))
			    WHERE num BETWEEN #{start} AND #{end}
			  </select>
	    */
	   public static List<QnaVO> qnaListData(Map map)
	   {
		   SqlSession session=null;
		   List<QnaVO> list=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("qnaListData",map);
		   }catch(Exception ex)
		   {
			   System.out.println("qnaListData : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return list;
	   }
	   /*
	    *   <insert id="boardReplyInsert" parameterType="BoardReplyVO">
			    <selectKey keyProperty="no" resultType="int" order="BEFORE">
			      SELECT NVL(MAX(no)+1,1) as no FROM project_replyBoard
			    </selectKey>
			    INSERT INTO project_replyBoard(no,name,subject,content,pwd,group_id)
			    VALUES(#{no},#{name},#{subject},#{content},#{pwd},
			     SELECT NVL(MAX(group_id)+1,1) as no FROM project_replyBoard
			    )
			  </insert>
	    */
	   public static void qnaInsert(QnaVO vo)
	   {
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true);// getConnection() : 미리 생성된 Connection주소 읽기 
			   // autocommit ==> 트랜잭션 
			   session.insert("qnaInsert",vo);
		   }catch(Exception ex)
		   {
			   System.out.println("qnaInsert : error");
			   	ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // disConnection() ps.close(),conn.close() : 반환 
		   }
	   }
	   
	   /*
	    *   <select id="boardReplyTotalPage" resultType="int">
			    SELECT CEIL(COUNT(*)/10.0) FROM project_replyBoard
			  </select>
	    */
	   public static int qnaTotalPage()
	   {
		   SqlSession session=null;
		   int total=0;
		   try
		   {
			   session=ssf.openSession(true);// getConnection() : 미리 생성된 Connection주소 읽기 
			   total=session.selectOne("qnaTotalPage");
		   }catch(Exception ex)
		   {
			   System.out.println("qnaTotalPage : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // disConnection() ps.close(),conn.close() : 반환 
		   }
		   return total;
	   }
	   /*
	       SqlSession session=null;
		  
		   try
		   {
			   session=ssf.openSession(true);// getConnection() : 미리 생성된 Connection주소 읽기 
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // disConnection() ps.close(),conn.close() : 반환 
		   }
		   
	    */
	   /*
	    *   <select id="boardReplyAdminData" resultType="BoardReplyVO">
			    SELECT * FROM project_replyBoard
			    WHERE isreply!=1 AND group_step!=1
			  </select>
	    */
	   public static List<QnaVO> qnaAdminData()
	   {
		   List<QnaVO> list=null;
		   SqlSession session=null;
			  
		   try
		   {
			   session=ssf.openSession(true);// getConnection() : 미리 생성된 Connection주소 읽기 
			   list=session.selectList("qnaAdminData");
		   }catch(Exception ex)
		   {
			   System.out.println("qnaAdminData : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // disConnection() ps.close(),conn.close() : 반환 
		   }
		   return list;
	   }
	   /*
	    *   <select id="boardReplyDetailData" resultType="BoardReplyVO" parameterType="int">
			    SELECT no,name,subject,content,hit,TO_CHAR(regdate,'YYYY-MM-DD') as dbday,group_id
			    FROM project_replyBoard
			    WHERE no=#{no}
			  </select>
	    */
	   public static QnaVO qnaDetailData(int q_no)
	   {
		   QnaVO vo=null;
		   SqlSession session=null;
			  
		   try
		   {
			   session=ssf.openSession();// getConnection() : 미리 생성된 Connection주소 읽기 
			   session.update("qnaHitIncrement",q_no);// 조회수 증가
			   session.commit();
			   vo=session.selectOne("qnaDetailData", q_no);
		   }catch(Exception ex)
		   {
			   System.out.println("qnaDetailData: error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // disConnection() ps.close(),conn.close() : 반환 
		   }
		   return vo;
	   }
	   /*
	    *   <!--  어드민에서 답변 달기 -->
		  <select id="boardReplyInfoData" resultType="int" parameterType="int">
		    SELECT group_id FROM project_replyBoard 
		    WHERE no=#{no}
		  </select>
		  <insert id="boardReplyInsertOk" parameterType="BoardReplyVO">
		    <selectKey keyProperty="no" resultType="int" order="BEFORE">
		      SELECT NVL(MAX(no)+1,1) as no FROM project_replyBoard
		    </selectKey>
		    INSERT INTO project_replyBoard(no,name,subject,content,pwd,group_id,group_step,group_tab)
		    VALUES(#{no},#{name},#{subject},#{content},#{pwd},
		     #{group_id},1,1
		    )
		  </insert>
		  <update id="boardReplyIsReply" parameterType="int">
		    UPDATE project_replyBoard SET
		    isreply=1
		    WHERE no=#{no}
		  </update>
	    */
	   public static void qnaInsertOk(int pno,QnaVO vo)
	   {
		   SqlSession session=null;
			  
		   try
		   {
			   session=ssf.openSession();// getConnection() : 미리 생성된 Connection주소 읽기 
			   int gi=session.selectOne("qnaInfoData", pno);
			   vo.setGroup_id(gi);
			   session.insert("qnaInsertOk",vo);
			   session.update("qnaIsReply",pno);
			   session.commit();
		   }catch(Exception ex)
		   {
			   System.out.println("qnaInsertOk: error");
			   session.rollback();
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // disConnection() ps.close(),conn.close() : 반환 
		   }
	   }
	   
	   public static QnaVO qnaUpdateData(int q_no)
	   {
		   QnaVO vo=null;
		   SqlSession session=null;
			  
		   try
		   {
			   session=ssf.openSession();// getConnection() : 미리 생성된 Connection주소 읽기 
			   vo=session.selectOne("qnaDetailData", q_no);
		   }catch(Exception ex)
		   {
			   System.out.println("qnaUpdateData: error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // disConnection() ps.close(),conn.close() : 반환 
		   }
		   return vo;
	   }
	   /*
	    *   <update id="boardReplyUpdate" parameterType="BoardReplyVO">
			    UPDATE project_replyBoard SET
			    name=#{name},subject=#{subject},content=#{content}
			    WHERE no=#{no}
			  </update>
	    */
	   public static void qnaUpdate(QnaVO vo)
	   {
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true);
			   session.update("qnaUpdate",vo);
		   }catch(Exception ex)
		   {
			   System.out.println("qnaUpdate: error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
	   
	   /*
	    *   <select id="boardGetGroupId" resultType="int" parameterType="int">
			    SELECT group_id FROM project_replyBoard
			    WHERE no=#{no}
			  </select>
			  <delete id="boardDelete" parameterType="int">
			   DELETE FROM project_replyBoard
			   WHERE group_id=#{group_id}
			  </delete>
	    */
	   public static void qnaDelete(int q_no)
	   {
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true);
			   int gi=session.selectOne("qnaGetGroupId", q_no);
			   session.delete("qnaDelete",gi);
		   }catch(Exception ex)
		   {
			   System.out.println("qnaDelete: error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
	   }
}





