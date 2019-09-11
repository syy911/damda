package com.bit.pro.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public interface LoginService {
	//로그인 체크
	HashMap<String, Object> selectOne(Map<String, Object> map) throws SQLException;
	//아이디찾기
	HashMap<String, Object> selectFnId(HashMap<String, Object> map) throws SQLException;
	//비밀번호 찾기
	HashMap<String, Object> selectFnPw(HashMap<String, Object> map) throws SQLException;
}
