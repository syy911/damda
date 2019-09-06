package com.bit.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/intro")
public class IntroController {
	
	String dir = "intro";
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String intro() {
		
		return dir+"/Intro";
	}
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map() {
		
		return dir+"/map";
	}
}
