package com.bit.pro.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bit.pro.dao.LoginDao;

@Service("loginService")
public class LoginServiceImpl implements LoginService {

	private static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
	
	@Resource(name="loginDao")
	private LoginDao loginDao;
	//�α���üũ
	@Override
	public HashMap<String, Object> selectOne(Map<String, Object> map) throws SQLException {
		return loginDao.login(map);
	}
	//���̵�ã��
	@Override
	public HashMap<String, Object> selectFnId(HashMap<String, Object> map) throws SQLException {
		return loginDao.fnid(map);
	}
	//��й�ȣã��
	@Override
	public HashMap<String, Object> selectFnPw(HashMap<String, Object> map) throws SQLException {
		return loginDao.fnpw(map);
	}
}
