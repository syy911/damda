package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public interface LoginDao {
	//�α���üũ
	HashMap<String, Object> login(Map<String, Object> map) throws SQLException;
	//���̵�ã��
	HashMap<String,Object> fnid(HashMap<String, Object> map) throws SQLException;
	//��й�ȣã��
	HashMap<String, Object> fnpw(HashMap<String, Object> map) throws SQLException;
}
