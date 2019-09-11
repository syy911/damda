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
		sqlSession.insert(NAMESPACE + ".insertCart", bean);
	}

	@Override
	public void insertCart_noUser(CartVo bean) throws SQLException {
		sqlSession.insert(NAMESPACE + ".insertCart_noUser", bean);
	}
	
	
	//장바구니 출력 회원 (allitem/custom)
	@Override
	public List<CartVo> selectCart(CartVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE +".selectCart", bean);
	}

	@Override
	public List<CartVo> selectCart2(CartVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE +".selectCart2", bean);
	}
	
	
	//장바구니 출력 비회원 (allitem/custom)
	@Override
	public List<CartVo> selectCart_noUser(CartVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectCart_noUser", bean);
	}

	@Override
	public List<CartVo> selectCart_noUser2(CartVo bean) throws SQLException {
		return sqlSession.selectList(NAMESPACE + ".selectCart_noUser2", bean);
	}
	
	
	//비회원장바구니 -> 회원장바구니
	@Override
	public int noUser_updateCart(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".noUser_updateCart", bean);
	}

	@Override
	public int user_updateCart(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".User_updateCart", bean);
	}

	
	//회원 장바구니 수량변경
	@Override
	public int userUpdate_item(CartVo bean) throws SQLException {
		return sqlSession.update(NAMESPACE + ".userUpdate_item", bean);
	}



}
