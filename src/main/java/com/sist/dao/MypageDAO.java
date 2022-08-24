package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.JjimVO;
import com.sist.vo.PboardVO;
import com.sist.vo.PetplaceVO;
import com.sist.vo.QnaVO;
import com.sist.vo.UserVO;

public class MypageDAO {
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
	
	// 확인용 정보 불러오기 전용
	public static UserVO myInfoData(String id)
	{
		UserVO vo=new UserVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("myInfoData",id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	// 수정용 정보 불러오기 전용
	public static UserVO myInfoDataforEdit(String id)
	{
		UserVO vo=new UserVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			vo=session.selectOne("myInfoDataforEdit",id);
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
			UserVO uvo=session.selectOne("myInfoEidtCheck", vo.getId());
			System.out.println("test");
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
	
	// 예약 좋아요 목록
	public static int userLiikeCount(JjimVO vo)
	{
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("userLiikeCount",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	
	// 추천 좋아요 목록
	public static int userRecLikeCount(PetplaceVO vo)
	{
		int count=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			count=session.selectOne("userRecLikeCount",vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return count;
	}
	
	// 나의 좋아요 목록 - 예약
	public static List<JjimVO> userBookingLikeData(String id)
	{
		List<JjimVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("userBookingLikeData",id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;
	}

	// 나의 좋아요 목록 - 추천
	public static List<PetplaceVO> userRecLikeData(String id)
	   {
		   List<PetplaceVO> plist=null;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   plist=session.selectList("userRecLikeData",id);
			   
		   }catch(Exception ex)
		   {
			   ex.printStackTrace();
		   }
		   finally
		   {
			   if(session!=null)
				   session.close();
		   }
		   return plist;
	   }
	// 커뮤니티 작성 글 목록
	public static List<PboardVO> userWriteData(Map map)
	{
		List<PboardVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("userWriteData",map);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	// 커뮤니티 작성 글 페이징
	public static int userWriteTotalPage(String id)
	{
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("userWriteTotalPage",id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
	
	public static List<QnaVO> userQnaData(Map map)
	{
		List<QnaVO> list=null;
		SqlSession session=null;
		
		try {
			session=ssf.openSession();
			list=session.selectList("userQnaData",map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static int userQnaTotalPage()
	{
		int total=0;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			total=session.selectOne("userQnaTotalPage");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return total;
	}
}
