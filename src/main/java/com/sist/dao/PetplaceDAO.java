package com.sist.dao;

import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


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
	
		 public static PetplaceVO petplaceDetailData(Map map)
		   {
			    PetplaceVO vo=new PetplaceVO();
			    SqlSession session=null;
			    try
			    {
			    	session=ssf.openSession();
			    	vo=session.selectOne("petplaceDetailData", map);//row
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
	}