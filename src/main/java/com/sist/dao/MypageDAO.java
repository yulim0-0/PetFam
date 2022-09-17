package com.sist.dao;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.JjimVO;
import com.sist.vo.OrderVO;
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
	
	// 정보 확인용 전용
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
	
	// 수정용 정보 전용
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
		try
		{
			session=ssf.openSession();
			UserVO pvo=session.selectOne("userInfoEditPwd", vo.getId());
			System.out.println(vo.getId());
			if(pvo.getPwd().equals(vo.getPwd()))
			{
				bCheck=true;
				session.update("userEdit",vo);
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
	public static List<PetplaceVO> userRecLikeData(String id) {
		List<PetplaceVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("userRecLikeData",id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;
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
	
	// 내가 쓴 자유게시판 글 페이징
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
	
	public static List<QnaVO> userQnaListData(Map map)
	{
		List<QnaVO> list=null;
		SqlSession session=null;
		
		try {
			session=ssf.openSession();
			list=session.selectList("userQnaListData",map);
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
	//예약내역 출력
	public static List<OrderVO> bookingMypageData(String id)
	   {
		   List<OrderVO> list=null;
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession();
			   list=session.selectList("bookingMypageData", id);
			   System.out.println(list);
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
	 /* 예약취소 */
	 public static void booking_Cancel(int oi_no)
	   {
		   SqlSession session=null;
		   try
		   {
			   session=ssf.openSession(true);
			   session.delete("booking_Cancel",oi_no);
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
