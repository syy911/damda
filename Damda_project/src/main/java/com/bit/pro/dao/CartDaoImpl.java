package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.CartVo;

@Repository("cartDao")
public class CartDaoImpl implements CartDao{

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.cartMapper";
	
	//detail.jsp에서 장바구니 추가
	@Override
	public void insertCart(CartVo bean) throws SQLException {
		sqlSession.insert(NAMESPACE+".insertCart", bean);
	}

	@Override
	public List<CartVo> selectCart(CartVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE+".selectCart", bean);
	}

}
