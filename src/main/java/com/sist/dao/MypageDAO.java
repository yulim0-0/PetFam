package com.sist.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.PboardVO;
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
	// 정보 불러오기 전용
	public static List<UserVO> userInfoData(String id)
	{
		List<UserVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("userInfoData",id);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	// 커뮤니티 작성 글 목록
	public static List<PboardVO> userWriteData(String id)
	{
		List<PboardVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("userWriteData",id);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	// 커뮤니티 작성 글 상세보기
	public static List<PboardVO> userWriteDetailData(int p_no)
	{
		List<PboardVO> list=null;
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("userWriteDetailData",p_no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;
	}
}
