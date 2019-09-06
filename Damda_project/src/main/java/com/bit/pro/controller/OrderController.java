package com.bit.pro.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	String dir = "order";
	private static final Logger logger = LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String order() {

		return dir+"/order";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String orderList() {

		return dir+"/orderList";
	}
	
	@RequestMapping(value = "/findjuso", method = RequestMethod.GET)
	public String findJuso() {

		return dir+"/findJuso";
	}
}
