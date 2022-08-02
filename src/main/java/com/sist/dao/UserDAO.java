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
	
}
