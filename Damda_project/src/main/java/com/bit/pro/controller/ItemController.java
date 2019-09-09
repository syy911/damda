package com.bit.pro.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.pro.service.CartService;
import com.bit.pro.service.ItemService;
import com.bit.pro.service.ReviewService;
import com.bit.pro.vo.AllItemVo;
import com.bit.pro.vo.ReviewVo;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	String dir = "item";
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@Resource
	private ItemService itemService;
	
	@Resource
	private ReviewService reviewService ;
	
	@Resource
	private CartService cartService ;
	
	private int row = 30;

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Locale locale, Model model,@RequestParam(value="item", defaultValue = "salad") String item) throws Exception {
		model.addAttribute("item", item);
		return dir+"/main";
	}
	
	@RequestMapping(value = "/salad", method = RequestMethod.GET)
	public String salad(Locale locale, Model model, @RequestParam(value="select", defaultValue = "new") String select, @RequestParam(value="p", defaultValue = "0") int p) throws Exception {
		itemService.selectItem(1, p, select, model);
		return dir+"/list";
	}
	
	@RequestMapping(value = "/dessert", method = RequestMethod.GET)
	public String dessert(Locale locale, Model model, @RequestParam(value="select", defaultValue = "new") String select, @RequestParam(value="p", defaultValue = "0") int p) throws Exception {
		itemService.selectItem(2, p, select, model);
		return dir+"/list";
	}
	
	@RequestMapping(value = "/drink", method = RequestMethod.GET)
	public String drink(Locale locale, Model model, @RequestParam(value="select", defaultValue = "new") String select, @RequestParam(value="p", defaultValue = "0") int p) throws Exception {
		itemService.selectItem(3, p, select, model);
		return dir+"/list";
	}
	
	@RequestMapping(value = "/best", method = RequestMethod.GET)
	public String best(Model model) throws Exception {
		itemService.selectBest(0, 30, model);
		return dir+"/list";
	}
	

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String itemDetail(Model model, HttpServletRequest request, @RequestParam(value="p", defaultValue = "0") int p) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		itemService.selectOne(no, model);
		itemService.selectOne_detailImg(no, model);
		reviewService.reviewCount(no, model);
		reviewService.selectList(no, p, "reviewnew", model);
		model.addAttribute("no", no);
		return dir+"/detail";
	}
	
	@RequestMapping(value = "/review", method = RequestMethod.GET)
	public String reviewNew(Model model, HttpServletRequest request, @RequestParam(value="align", defaultValue = "reviewnew") String align, @RequestParam(value="p", defaultValue = "0") int p) throws Exception {
		int no = Integer.parseInt(request.getParameter("no"));
		reviewService.selectList(no, p, align, model);
		return dir+"/d_list";
	}	
	
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public String itemCart(HttpServletRequest request) throws Exception {
		int userNum =Integer.parseInt(request.getParameter("usernum"));
		int itemNum =Integer.parseInt(request.getParameter("no"));
		int ea =Integer.parseInt(request.getParameter("ea"));
		System.out.println("userNum, itemNum, ea : "+userNum+","+itemNum+","+ea);
		
		cartService.insertItem(userNum, itemNum, ea);
		return dir+"/detail";
	}
}














