package com.sist.dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.JjimVO2;
import com.sist.vo.PetplaceVO;

import java.io.*;

public class PetplaceDAO {
	//1.XML파일읽기
	private static SqlSessionFactory ssf;
	static 
	{
		try 
		{
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);//파싱
		}catch(Exception ex) {
			
			System.out.println("====PetplaceDAO static error====");
			ex.printStackTrace();
		}
	}
	//	<select id="petplaceListData" resultType="PetplaceVO" parameterType="hashmap">
	public static List<PetplaceVO> petplaceListData(Map map){
		SqlSession session=null;   //PreparedStatement
		//ssf=> Connection
		List<PetplaceVO> list=null;
		try {
			session=ssf.openSession();
			list=session.selectList("petplaceListData",map); 
		}catch(Exception ex) {
			System.out.println("petplaceListData(Map map) : error");
			ex.printStackTrace();
		}
		finally 
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return list;
		
	}
	
	public static int petplaceTotalPage(Map map)
	{
		int total=0;
		SqlSession session=null;
		
		try {
			session=ssf.openSession();
			total=session.selectOne("petplaceTotalPage",map); 
		}catch(Exception ex) {
			System.out.println("petplaceTotalPage(Map map) : error");
			ex.printStackTrace();
		}
		finally 
		{
			if(session!=null)
			{
				session.close();
			}
		}
		return total;
	}
	
		 public static PetplaceVO petplaceDetailData(int c_no)
		   {
			    PetplaceVO vo=new PetplaceVO();
			    SqlSession session=null;
			    try
			    {
			    	session=ssf.openSession();
			    	vo=session.selectOne("petplaceDetailData", c_no);//row
			    }catch(Exception ex)
			    {
			    	System.out.println("petplaceDetailData: error");
			    	ex.printStackTrace(); 
			    }
			    finally
			    {
			    	if(session!=null)
			    		session.close();
			    }
			    return vo;
		   }
		 
		 
		 
		 
		   
//		   <!-- 찜하기 -->
//		   <insert id="petplaceJjimInsert" parameterType="com.sist.vo.JjimVO2">
//		   	<selectKey keyProperty="no" resultType="int" order="BEFORE">
//		   	SELECT NVL(MAX(no)+1,1) as no FROM jjim_p_4
//		   	</selectKey>
//		   	INSERT INTO jjim_p_4 VALUES(#{no},#{id},#{c_no})		   
//		   </insert>
	   
		   public static void petplaceJjimInsert(JjimVO2 vo)
		   {
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession(true);
				   session.insert("petplaceJjimInsert",vo);
				  
			   }catch(Exception ex) {
				   ex.printStackTrace();
			   }finally
			   {
				   if(session!=null)
					   session.close();
			   }
		   }
		   
//		     <!-- 찜 여부 확인 -->
//		   <select id="petplaceJjimCount" resultType="int" parameterType="com.sist.vo.JjimVO2">
//		     SELECT COUNT(*) FROM jjim_p_4
//		     WHERE c_no=#{c_no} AND id=#{id}
//		   </select>		
		   
		   public static int petplaceJjimCount(JjimVO2 vo)
		   {
			   int count=0;
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession();
				   count=session.selectOne("petplaceJjimCount",vo);
				 
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally {
				   if(session!=null)
					   session.close();
			   }
			   
		   return count;
		   }
		   
		   public static PetplaceVO petplaceJjimListData(int c_no)
		   {
			   PetplaceVO vo=null;
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession();
				   vo=session.selectOne("petplaceJjimListData", c_no);
				  
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally
			   {
				   if(session!=null)
					   session.close();
			   }
			   return vo;
		   }

		   
//		   <select id="petplaceJjimGetC_no" resultType="int" parameterType="string">
//		    SELECT c_no FROM jjim_p_4
//		    WHERE id=#{id}
//		  </select>

		   public static List<Integer> petplaceJjimGetC_no(String id)
		   {
			   List<Integer> list=null;
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession();
				   list=session.selectList("petplaceJjimGetC_no",id);
				   
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally
			   {
				   if(session!=null)
					   session.close();
			   }
			   return list;
		   }
		   // 찜 취소
		   /*
		    *   <delete id="petplaceJjimDelete" parameterType="com.sist.vo.JjimVO2">
		   DELETE FROM Jjim
		   WHERE id=#{id} AND c_no=#{c_no}
		  </delete>
		    */
		   public static void petplaceJjimDelete(JjimVO2 vo)
		   {
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession(true);
				   session.delete("petplaceJjimDelete",vo);
				   
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally
			   {
				   if(session!=null)
					   session.close();
			   }
		   }
		   
		   public static List<PetplaceVO> placeLocationFindData(Map map)
		   {
			   List<PetplaceVO> list=null;
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession();
				   list=session.selectList("placeLocationFindData", map);
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally
			   {
				   if(session!=null)
					   session.close();
			   }
			   return list;
		   }
		   
		   public static int placeLocationFindTotalPage(String addr)
		   {
			   int total=0;
			   SqlSession session=null;
			   try
			   {
				   session=ssf.openSession();
				   total=session.selectOne("placeLocationFindTotalPage", addr);
			   }catch(Exception ex)
			   {
				   ex.printStackTrace();
			   }
			   finally
			   {
				   if(session!=null)
					   session.close();
			   }
			   return total;
		   }
		   
		   
	}