package com.bit.pro.dao;

import java.sql.SQLException;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.JoinVo;

@Repository("joinDao")
public class JoinDaoImpl implements JoinDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(JoinDaoImpl.class);
	private static final String NAMESPACE = "com.bit.pro.mappers.joinMapper";
	
	
	@Override
	public JoinVo selectUser(String userid) throws Exception{
		
		JoinVo userInfo= sqlSession.selectOne(NAMESPACE+".selectUser", userid);
		return userInfo;
	}

	@Override
	public int insertUser(JoinVo bean) throws Exception{
		System.out.println("service: "+bean.toString());
		int result = sqlSession.insert(NAMESPACE+".insertUser",bean);
		return result;
	}

	@Override
	public int checkId(JoinVo bean) throws Exception {
		int result = sqlSession.selectOne(NAMESPACE+".checkId",bean);
		System.out.println("dao idcheck : "+bean.toString()+"result: "+result);
		return result;
	}

	@Override
	public void updateUser(JoinVo bean) throws Exception {
		int result = sqlSession.update(NAMESPACE+".updateUser", bean);
		System.out.println("dao idcheck : "+bean.toString()+"result: "+result);
	}

	@Override
	public int checkPw(JoinVo bean) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+".checkPw",bean);
	}

	

}
