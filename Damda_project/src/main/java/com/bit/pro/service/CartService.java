package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.pro.vo.CartVo;

public interface CartService {
	
	//detail.jsp���� ��ٱ��� �߰�
	void insertItem(int userNum, int itemNum, int ea) throws SQLException;

	//��ٱ��� ���
	Model selectCart(Model model, int userNum) throws SQLException;
}
