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

	
	private static final Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);
	
	@Resource(name="cartDao")
	private CartDao cartDao;
	
	@Override
	public void insertItem(int c_userNum, int c_itemNum, int ea) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(c_userNum);
		bean.setC_itemNum(c_itemNum);
		bean.setEa(ea);
		
		cartDao.insertCart(bean);
	}

	@Override
	public Model selectCart(Model model, int userNum) throws SQLException {
		CartVo bean = new CartVo();
		bean.setC_userNum(userNum);
		
		List<CartVo> list = cartDao.selectCart(bean);
		model.addAttribute("List", list);
		return model;
	}
	

}
