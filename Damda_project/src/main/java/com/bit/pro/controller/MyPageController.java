package com.bit.pro.controller;

import java.sql.SQLException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.pro.service.CartService;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	@Resource
	private CartService cartService ;
	
	String dir = "mypage";
	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String myPage() {
		
		return dir+"/mypage"; 
	}
	
	@RequestMapping(value = "/jjim", method = RequestMethod.GET)
	public String jjim() {

		return dir+"/jjim"; 
	}
	
	@RequestMapping(value = "/myrecipe", method = RequestMethod.GET)
	public String myRecipe() {

		return dir+"/myrecipe"; 
	}

	@RequestMapping(value = "/userinfo", method = RequestMethod.GET)
	public String editUser() {

		return dir+"/edituser"; 
	}
	
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String myPageQna() {

		return dir+"/mypage_qna"; 
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model, HttpSession session) throws SQLException {
		int userNum = 0;
		String noUser = session.getId();
		
		if(session.getAttribute("userNum")!=null) {
			userNum = (int) session.getAttribute("userNum");
			System.out.println("userNum : "+userNum);
				
			//로그인시 비회원장바구니 -> 회원장바구니에 넣어주기
			cartService.noUser_updateCart(userNum, noUser);
			cartService.User_updateCart(userNum);
		}
		
		if(session.getAttribute("userNum") != null) {
			cartService.selectCart(model, userNum);			
		}else {
			System.out.println("noUser: "+noUser);
			cartService.selectCart_noUser(model, noUser);		
		}
		
		return dir+"/cart"; 
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String cart_eaEdit(Model model, HttpSession session, HttpServletRequest request) throws SQLException {
		int ea = Integer.parseInt(request.getParameter("ea"));
		int itemNum = Integer.parseInt(request.getParameter("itemnum"));
		int userNum = 0;
		String noUser = session.getId();
		
		if(session.getAttribute("userNum")!=null) {
			userNum = (int) session.getAttribute("userNum");
			System.out.println("userNum : "+userNum);
			
		}

		
		
		return dir+"/cart"; 
	}

}
