package com.bit.pro.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public interface LoginService {
	//�α��� üũ
	HashMap<String, Object> selectOne(Map<String, Object> map) throws SQLException;
	//���̵�ã��
	HashMap<String, Object> selectFnId(HashMap<String, Object> map) throws SQLException;
	//��й�ȣ ã��
	HashMap<String, Object> selectFnPw(HashMap<String, Object> map) throws SQLException;
}
