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
	
	private int row = 30;

	@RequestMapping(value = "/salad", method = RequestMethod.GET)
	public String salad(Model model, @RequestParam(value="p", defaultValue = "0") int p, HttpServletRequest req) throws Exception {
		item_ctg(1, p, model);
		return dir+"/main";
	}
	
	@RequestMapping(value = "/dessert", method = RequestMethod.GET)
	public String dessert(Locale locale, Model model, @RequestParam(value="p", defaultValue = "0") int p) throws Exception {
		item_ctg(2, p, model);
		return dir+"/main";
	}
	
	@RequestMapping(value = "/drink", method = RequestMethod.GET)
	public String drink(Locale locale, Model model, @RequestParam(value="p", defaultValue = "0") int p) throws Exception {
		item_ctg(3, p, model);
		return dir+"/main";
	}
	
	public void item_ctg(int num, int p, Model model) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num",num);
		int totalList = itemService.totalCount(map);
//	    logger.info("totalCount : {}", totalList);
	    
        int totalpage = totalList / row - 1;
        if((totalList % row) > 0) totalpage++;
//        logger.info("totalpage: {}", totalpage);
        
        int startpoint = p * row;
        map.put("startpoint", startpoint);
        map.put("row", row);
//////////////////////////////////////////////////////////////////////////////////////경민    
        List<AllItemVo> list = itemService.selectItem(map);
        String photoPart = "";
        AllItemVo newallitemVo =null;
        List<AllItemVo> newList = new ArrayList<AllItemVo>();    
        	for(AllItemVo allitemVo : list) {
        		newallitemVo  = allitemVo;  
        		int photoCtg = newallitemVo.getPhotoCtg();
        		if(photoCtg==1) {
        			photoPart = "salad";
                }else if(photoCtg==2) {
                	photoPart = "dessert";
                }else if(photoCtg==3) {
                	photoPart = "beverage"; 
                }
        		allitemVo.setCtgToadd(photoPart);
        		newList.add(allitemVo);
          }
//////////////////////////////////////////////////////////////////////////////////////경민          
		model.addAttribute("p", p);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("List", newList);
	}
	
	
//select box start////////////////////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value = "/salad", method = RequestMethod.POST)
	public String salad(Model model, @RequestParam("select") String select, @RequestParam(value="p", defaultValue = "0") int p) throws Exception {
		System.out.println("select: "+select);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num",1);
		int totalList = itemService.totalCount(map);
		
	    int totalpage = totalList / row - 1;
	    
	    int startpoint = p * row;
        map.put("startpoint", startpoint);
        map.put("row", row);
        
        List<AllItemVo> list = null;
        
        if((totalList % row) > 0) totalpage++;
		
		if(select.equals("new")) {
			list = itemService.alignNew(map);	
		} else if(select.equals("best")) {
			list = itemService.alignBest(map);	
		} else if(select.equals("cheap")) {
			list = itemService.alignCheap(map);	
		} else if(select.equals("expen")) {
			list = itemService.alignExpen(map);	
		}
		
		model.addAttribute("p", p);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("List", list);
		
		return dir+"/salad";	
	}
	//select box end////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	@RequestMapping(value = "/best", method = RequestMethod.GET)
	public String best(Model model) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("startpoint", 0);
		map.put("row", 30);
		
		List<AllItemVo> list = itemService.selectBest(map);
		model.addAttribute("List", list);
		return dir+"/main";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String itemDetail(Model model, HttpServletRequest request, @RequestParam(value="p", defaultValue = "0") int p) throws Exception {
		int num = Integer.parseInt(request.getParameter("no"));
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		//아이템 정보
		AllItemVo list = itemService.selectOne(map);
		model.addAttribute("List", list);
		
		//사진 (수정해야함 : 사진개수만큼 사진이 출력되게)
		String photoPath = itemService.selectOne_detailImg(map);
		model.addAttribute("photoPath", photoPath);
		
		//리뷰 paging
		int totalList = reviewService.reviewCount(map);
		
		row = 15;//15개씩보이기
        int totalpage = totalList / row - 1;
        if((totalList % row) > 0) totalpage++;
        
        int startpoint = p * row;
        map.put("startpoint", startpoint);
        map.put("row", row);		
		
        List<ReviewVo> reviewList = reviewService.selectList(map);
        model.addAttribute("URL", "/item/detail?no="+num);
		model.addAttribute("p", p);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("reviewCount",totalList);
		model.addAttribute("reviewList", reviewList);
		
		return dir+"/detail";
	}
	
	
}