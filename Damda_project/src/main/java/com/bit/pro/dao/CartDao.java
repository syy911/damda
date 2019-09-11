package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.CartVo;

public interface CartDao {
	
	//detail.jsp에서 장바구니 추가
	void insertCart(CartVo bean) throws SQLException;
	void insertCart_noUser(CartVo bean) throws SQLException;

	//장바구니 출력 회원 (allitem/custom)
	List<CartVo> selectCart(CartVo bean) throws SQLException;
	List<CartVo> selectCart2(CartVo bean) throws SQLException;

	//장바구니 출력 비회원 (allitem/custom)
	List<CartVo> selectCart_noUser(CartVo bean) throws SQLException;
	List<CartVo> selectCart_noUser2(CartVo bean) throws SQLException;
	
	//비회원장바구니 -> 회원장바구니
	int noUser_updateCart(CartVo bean) throws SQLException;
	int user_updateCart(CartVo bean) throws SQLException;
	
	//회원 장바구니 수량변경
	int userUpdate_item(CartVo bean) throws SQLException;
}
