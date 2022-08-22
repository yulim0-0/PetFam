package com.sist.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.BookingVO;
import com.sist.vo.PboardVO;
import com.sist.vo.PetplaceVO;

public class MainDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 커뮤니티 검색
	public static List<PboardVO> totalComFindData(String search) {
		List<PboardVO> comList = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			comList = session.selectList("totalComFindData", search);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return comList;
	}

	// 추천 검색
	public static List<PetplaceVO> totalRecFindData(String search) {
		List<PetplaceVO> recList = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			recList = session.selectList("totalRecFindData", search);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return recList;
	}

	// 예약 검색
	public static List<BookingVO> totalBookFindData(String search) {
		List<BookingVO> bookList = null;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			bookList = session.selectList("totalBookFindData", search);
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		}
		return bookList;
	}
}
