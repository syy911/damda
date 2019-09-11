package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.CartVo;

public interface CartDao {
	
	//detail.jsp���� ��ٱ��� �߰�
	void insertCart(CartVo bean) throws SQLException;
	void insertCart_noUser(CartVo bean) throws SQLException;

	//��ٱ��� ��� ȸ�� (allitem/custom)
	List<CartVo> selectCart(CartVo bean) throws SQLException;
	List<CartVo> selectCart2(CartVo bean) throws SQLException;

	//��ٱ��� ��� ��ȸ�� (allitem/custom)
	List<CartVo> selectCart_noUser(CartVo bean) throws SQLException;
	List<CartVo> selectCart_noUser2(CartVo bean) throws SQLException;
	
	//��ȸ����ٱ��� -> ȸ����ٱ���
	int noUser_updateCart(CartVo bean) throws SQLException;
	int user_updateCart(CartVo bean) throws SQLException;
	
	//ȸ�� ��ٱ��� ��������
	int userUpdate_item(CartVo bean) throws SQLException;
}
