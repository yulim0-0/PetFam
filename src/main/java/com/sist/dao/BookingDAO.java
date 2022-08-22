package com.sist.dao;

import java.io.*;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.BookingVO;
import com.sist.vo.JjimVO;


public class BookingDAO {
	//1.XML파일 읽기
	private static SqlSessionFactory ssf;
	static
	{
		try
		{
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex)
		{
			System.out.println("====BookingDAO static error====");
			ex.printStackTrace();
		}
	}
	//<select id="bookingListData" resultType="BookingVO" parameterType="hashmap">
	public static List<BookingVO> bookingListData(Map map)
	{
		SqlSession session=null;
		List<BookingVO> list=null;
		try
		{
			session=ssf.openSession();
			list=session.selectList("bookingListData",map);
		}catch(Exception ex)
		{
			System.out.println("====BookingDAO.bookingListData() error====");
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
	
	 public static int bookingTotalPage(Map map)
	   {
		   int total=0;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   total=session.selectOne("bookingTotalPage", map);
		   }catch(Exception ex)
		   {
			   System.out.println("bookingTotalPage : error");
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close(); // POOL => 반환 
		   }
		   return total;
	   }
	 
	 public static BookingVO hospitalDetailData(int o_no)
	   {
		    BookingVO vo=new BookingVO();
		    SqlSession session=null;
		    try
		    {
		    	session=ssf.openSession();
		    	vo=session.selectOne("hospitalDetailData", o_no);//row
		    }catch(Exception ex)
		    {
		    	System.out.println("hospitalDetailData: error");
		    	ex.printStackTrace();
		    }
		    finally
		    {
		    	if(session!=null)
		    		session.close();
		    }
		    return vo;
	   }
	 
	 public static BookingVO bookingDetailData(int o_no)
	   {
		    BookingVO vo=new BookingVO();
		    SqlSession session=null;
		    try
		    {
		    	session=ssf.openSession();
		    	vo=session.selectOne("bookingDetailData", o_no);//row
		    }catch(Exception ex)
		    {
		    	System.out.println("bookingDetailData: error");
		    	ex.printStackTrace();
		    }
		    finally
		    {
		    	if(session!=null)
		    		session.close();
		    }
		    return vo;
	   }
	 
	 public static void bookingJjimInsert(JjimVO vo)
	 {
		 SqlSession session=null;
		 try
		 {
			 session=ssf.openSession(true);
			 session.insert("bookingJjimInsert", vo);
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
	 
	 public static int bookingJjimCount(JjimVO vo)
	 {
		 int count=0;
		 SqlSession session=null;
		 try
		 {
			 session=ssf.openSession();
			 count=session.selectOne("bookingJjimCount", vo);
		 }catch(Exception ex)
		 {
			 ex.printStackTrace();
		 }
		 finally
		 {
			 if(session!=null)
				 session.close();
		 }
		 return count;
	 }
	 /*
	  *  <delete id="bookingJjimDelete" parameterType="JjimVO">
		 	DELETE FROM ord_jjim_4
		 	WHERE o_no=#{o_no} AND id=#{id}
		 </delete>
	  */
	 public static void bookingJjimDelete(JjimVO vo)
	 {
		 SqlSession session=null;
		 try
		 {
			 session=ssf.openSession(true);
			 session.delete("bookingJjimDelete", vo);
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
}
