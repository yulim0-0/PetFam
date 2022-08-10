package com.sist.dao;

import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.UserVO;

public class AdminDAO {
	private static SqlSessionFactory ssf;
	static
	{
		try {
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 전체 회원 정보 나열
	public static List<UserVO> userInfoList()
	{
		List<UserVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("userInfoList");
			System.out.println(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static List<UserVO> userInfoDetailData()
	{
		List<UserVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("userInfoDetailData");
			System.out.println(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
}
