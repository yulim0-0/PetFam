package com.sist.dao;

import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.OrderVO;
import com.sist.vo.PboardVO;
import com.sist.vo.QnaVO;
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
	
	// 예약 확인
	public static List<OrderVO> adminBookingCheck()
	{
		List<OrderVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("adminBookingCheck");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	// 예약승인
	public static void adminBookingUpdate(int oi_no)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("adminBookingUpdate",oi_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
	}
	
	// 예약 취소
	public static void adminCancel(int oi_no)
	{
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("adminCancel",oi_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
	}
	
	// 예약 페이징
	public static int adminBookingTotal()
	{
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("adminWriteTotalPage");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	
	
	// 전체 회원 정보 나열
	public static List<UserVO> userInfoList()
	{
		List<UserVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("userInfoList");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
//	삭제전 비밀번호 확인
	public static String userInfoDelPwd(String id, String pwd)
	{
		String result="";
		SqlSession session=null;
		try {
			session=ssf.openSession();
			String del_pwd=session.selectOne("userInfoDelPwd",id);
			if(del_pwd.equals(pwd))
			{
				result="yes";
			}
			else {
				result="no";
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return result;
	}
	
	public static String UserInfoDelete(String id, String pwd, String db_pwd)
	{
		String result="";
		SqlSession session=null;
		
		try {
			session=ssf.openSession(true);
			if(db_pwd.equals(pwd))
			{
				result="yes";
				session.delete("userInfoDelete",id);
				session.commit();
			} else {
				result="no";
			}
		} catch (Exception e) {
			System.out.println("userInfoDelete : error");
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return result;
	}
	
	public static List<UserVO> userInfoDetailData()
	{
		List<UserVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("userInfoDetailData");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static List<PboardVO> adminWriteList(Map map)
	{
		List<PboardVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("adminWriteList", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public static int adminWriteTotalPage()
	{
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("adminWriteTotalPage");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return total;
	}

	public static List<QnaVO> adminQnaListData(Map map) {
		SqlSession session = null;
		List<QnaVO> list = null;
		try {
			session = ssf.openSession();
			list = session.selectList("adminQnaListData", map);
		} catch (Exception ex) {
			System.out.println("adminQnaListData : error");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static int adminQnaTotalPage() {
		SqlSession session = null;
		int total = 0;
		try {
			session = ssf.openSession(true);// getConnection() : 미리 생성된 Connection주소 읽기
			total = session.selectOne("adminQnaTotalPage");
		} catch (Exception ex) {
			System.out.println("adminQnaTotalPage : error");
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close(); // disConnection() ps.close(),conn.close() : 반환
		}
		return total;
	}
	
	public static void adminQnaInsert(QnaVO vo){
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.insert("adminQnaInsert",vo);
		} catch (Exception e) {
			System.out.println("adminQnaInsert : error");
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			if(session != null)
				session.close();
		}
	}
//	답글 달고나면 isReply +1 하기
	public static int adminQnaIsreply(int q_no) {
		SqlSession session=null;
		try {
			session=ssf.openSession(true);
			session.update("adminQnaIsreply",q_no);
		} catch (Exception e) {
			System.out.println("adminQnaIsreply : error");
			e.printStackTrace();
		} finally {
			if(session != null)
				session.close();
		}
		return q_no;
	}
	
}
