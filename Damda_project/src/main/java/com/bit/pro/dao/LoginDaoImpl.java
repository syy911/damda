package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

@Repository("loginDao")
public class LoginDaoImpl implements LoginDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginDaoImpl.class);
	private static final String NAMESPACE = "com.bit.pro.mappers.loginMapper";
	
	//로그인체크
	@Override
	public HashMap<String, Object> login(Map<String, Object> map) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".login",map);
		
	}
	//아이디찾기
	@Override
	public HashMap<String, Object> fnid(HashMap<String, Object> map) throws SQLException {
		if(map.get("userphone")==null) {
			return sqlSession.selectOne(NAMESPACE + ".fnidnoph",map);
		}else if(map.get("useremail")==null){
			return sqlSession.selectOne(NAMESPACE + ".fnidnoem",map);
		}else {
			return null;
		}
	}
	//비밀번호찾기
	@Override
	public HashMap<String, Object> fnpw(HashMap<String, Object> map) throws SQLException {
		if(map.get("userphone")==null) {
			return sqlSession.selectOne(NAMESPACE + ".fnpwnoph",map);
		}else if(map.get("useremail")==null){
			return sqlSession.selectOne(NAMESPACE + ".fnpwnoem",map);
		}else {
			return null;
		}
	}
}
