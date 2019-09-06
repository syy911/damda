package com.bit.pro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
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
	public String cart() {

		return dir+"/cart"; 
	}

}
