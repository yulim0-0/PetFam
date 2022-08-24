package com.sist.dao;

import java.io.Reader;
import java.util.List;

import javax.annotation.Resources;
import javax.lang.model.element.Element;

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
	
	public int userIdCheck(String id)
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
	
	public static void userInsert(UserVO vo)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("userInsert",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
	}
	public static UserVO isLogin(String id, String pwd)
	{
		UserVO vo=new UserVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			int count=session.selectOne("userIdCount",id);
			
			if(count==0)
			{
				vo.setMsg("NOID");
			}
			else {
				vo=session.selectOne("userIdPwdData",id);
				if(pwd.equals(vo.getPwd()))
				{
					vo.setMsg("OK");
				}
				else
				{
					vo.setMsg("NOPWD");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	public static boolean userEdit(UserVO vo)
	{
		boolean bCheck=false;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			UserVO uvo=session.selectOne("userInfoData", vo.getId());
			if(uvo.getPwd().equals(vo.getPwd()))
			{
				bCheck=true;
				session.update("userUpdate",vo);
				session.commit();
			}
			else 
			{
				bCheck=false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			if(session!=null)
				session.close();
		}
		return bCheck;
	}
	public static boolean userDelete(String id, String pwd)
	{
		boolean bCheck=false;
		SqlSession session=null;
		try
		   {
			   session=ssf.openSession();
			   UserVO pvo=session.selectOne("userInfoData", id);
			   if(pvo.getPwd().equals(pwd))
			   {
				   bCheck=true;
				   session.delete("userDelete",id);
				   session.commit();
			   }
			   else
			   {
				  bCheck=false; 
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
		   return bCheck;
	}

	
}
