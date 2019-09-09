package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.CartVo;

public interface CartDao {
	
	//detail.jsp에서 장바구니 추가
	void insertCart(CartVo bean) throws SQLException;

	List<CartVo> selectCart(CartVo bean) throws SQLException;
}
