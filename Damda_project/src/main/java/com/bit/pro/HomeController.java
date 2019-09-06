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
	
	//private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Resource
	private ItemService itemService;
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) throws Exception {
		//best 
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startpoint", 0);
		map.put("row", 6);
		List<AllItemVo> list = itemService.selectBest(map);
		model.addAttribute("List", list);
		
		//1=salad, 2=dessert, 3=drink
		homeItem(model, 1);
		homeItem(model, 2);
		homeItem(model, 3);
		
		return "home";
	}
	
	public void homeItem(Model model, int num) throws Exception {
		//1=salad, 2=dessert, 3=drink
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		List<AllItemVo> list = itemService.selectHome(map);
		model.addAttribute("List"+num, list);
	}
	
	@RequestMapping(value = "/itemList", method = RequestMethod.GET)
	public String itemList() {
		
		return "itemList";
	}
	
}
