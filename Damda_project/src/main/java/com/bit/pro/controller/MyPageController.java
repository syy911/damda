package com.bit.pro.controller;

import java.sql.SQLException;

import javax.annotation.Resource;
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
		int userNum = (int) session.getAttribute("userNum");
		cartService.selectCart(model, userNum);
		
		return dir+"/cart"; 
	}

}
