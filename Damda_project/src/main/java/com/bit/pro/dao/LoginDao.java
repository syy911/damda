package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public interface LoginDao {
	//로그인체크
	HashMap<String, Object> login(Map<String, Object> map) throws SQLException;
	//아이디찾기
	HashMap<String,Object> fnid(HashMap<String, Object> map) throws SQLException;
	//비밀번호찾기
	HashMap<String, Object> fnpw(HashMap<String, Object> map) throws SQLException;
}
