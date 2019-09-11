package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.pro.dao.CartDao;
import com.bit.pro.vo.CartVo;

@Service("cartService")
public class CartServiceImpl implements CartService{

	
	private static final Logger logger = LoggerFactory.getLogger(CartServiceImpl.class);
	
	@Resource(name="cartDao")
	private CartDao cartDao;
	
	//detail 에서 장바구니 담기 
	@Override
	public void insertItem(int c_userNum, int c_itemNum, int ea) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(c_userNum);
		bean.setC_itemNum(c_itemNum);
		bean.setEa(ea);
		
		cartDao.insertCart(bean);
	}
	
	@Override
	public void insertItem_noUser(String noUser, int c_itemNum, int ea) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_nouserNum(noUser);
		bean.setC_itemNum(c_itemNum);
		bean.setEa(ea);
		
		cartDao.insertCart_noUser(bean);
	}

	
	//장바구니 출력
	@Override
	public Model selectCart(Model model, int userNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(userNum);
		
		List<CartVo> list = cartDao.selectCart(bean);
		List<CartVo> list2 = cartDao.selectCart2(bean);
		System.out.println("list : "+list);
		System.out.println("list2 : "+list2);
		model.addAttribute("List", list);
		model.addAttribute("List2", list2);
		return model;
	}

	@Override
	public Model selectCart_noUser(Model model, String noUser) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_nouserNum(noUser);
		
		List<CartVo> list = cartDao.selectCart_noUser(bean);
		model.addAttribute("List", list);
		return model;
	}

	
	//비회원장바구니 -> 회원장바구니
	@Override
	public void noUser_updateCart(int c_userNum, String c_nouserNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(c_userNum);
		bean.setC_nouserNum(c_nouserNum);
		
		cartDao.noUser_updateCart(bean);
	}

	@Override
	public void User_updateCart(int c_userNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(c_userNum);
		
		cartDao.user_updateCart(bean);	
	}
	

}
