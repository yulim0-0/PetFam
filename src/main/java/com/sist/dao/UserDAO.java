package com.sist.dao;

import java.io.Reader;
import java.util.List;

import javax.annotation.Resources;

import org.apache.ibatis.io.*;
import org.apache.ibatis.session.*;

import com.sist.vo.UserVO;

public class UserDAO {
	private static SqlSessionFactory ssf;
	static
	{
		try {
			Reader reader=org.apache.ibatis.io.Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static int userIdCheck(String id)
	{
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("userIdCheck",id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	public static int userEmailCheck(String email)
	{
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("userEmailCheck",email);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	public static int userPhoneCheck(String phone)
	{
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("userPhoneCheck",phone);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
}
