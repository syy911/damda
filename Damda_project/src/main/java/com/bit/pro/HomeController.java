package com.bit.pro;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.pro.service.ItemService;
import com.bit.pro.vo.AllItemVo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private ItemService itemService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception {
		itemService.selectBest(0, 6, model);
		itemService.selectHome(model);
		return "home";
	}
	
	@RequestMapping(value = "/itemList", method = RequestMethod.GET)
	public String itemList() {
		
		return "itemList";
	}
	
}
