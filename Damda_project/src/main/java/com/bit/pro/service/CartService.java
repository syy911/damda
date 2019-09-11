package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.pro.vo.CartVo;

public interface CartService {
	
	//detail.jsp에서 장바구니 추가
	void insertItem(int userNum, int itemNum, int ea) throws SQLException;
	void insertItem_noUser(String noUser, int itemNum, int ea) throws SQLException;

	//장바구니 출력
	Model selectCart(Model model, int userNum) throws SQLException;
	Model selectCart_noUser(Model model, String noUser) throws SQLException;
	
	//비회원장바구니 -> 회원장바구니
	void noUser_updateCart(int c_userNum, String c_nouserNum) throws SQLException;
	void User_updateCart(int c_userNum) throws SQLException;
}
