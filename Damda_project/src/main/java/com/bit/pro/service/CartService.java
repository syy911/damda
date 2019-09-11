package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.pro.vo.CartVo;

public interface CartService {
	
	//detail.jsp���� ��ٱ��� �߰�
	void insertItem(int userNum, int itemNum, int ea) throws SQLException;
	void insertItem_noUser(String noUser, int itemNum, int ea) throws SQLException;

	//��ٱ��� ���
	Model selectCart(Model model, int userNum) throws SQLException;
	Model selectCart_noUser(Model model, String noUser) throws SQLException;
	
	//��ȸ����ٱ��� -> ȸ����ٱ���
	void noUser_updateCart(int c_userNum, String c_nouserNum) throws SQLException;
	void User_updateCart(int c_userNum) throws SQLException;
}
