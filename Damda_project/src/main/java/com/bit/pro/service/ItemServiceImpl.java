package com.bit.pro.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.pro.dao.ItemDao;
import com.bit.pro.dao.ReviewDao;
import com.bit.pro.vo.AllItemVo;
import com.bit.pro.vo.ReviewVo;

@Service("itemService")
public class ItemServiceImpl implements ItemService {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);
	
	@Resource(name="itemDao")
	private ItemDao itemDao;
	@Resource(name="reviewDao")
	private ReviewDao reviewDao;

	//Home
	@Override
	public Model selectHome(Model model) throws Exception {
		AllItemVo bean = new AllItemVo();
		List<AllItemVo> list = new ArrayList<AllItemVo>();
		//1=salad, 2=dessert, 3=drink
		for(int i=1; i<=3; i++) {
			bean.setCategory(i);
			list = itemDao.selectHome(bean);
			model.addAttribute("List"+i, list);
		}
		
		return model;
	}
	
	//Main
	@Override
	public Model selectItem(int num, int p, String select, Model model) throws Exception {
		AllItemVo bean = new AllItemVo();
		int row =30;
		bean.setCategory(num);
		bean.setP(p);
		int totalList = itemDao.totalItem(bean);
		int totalpage = totalList / row - 1;
	    if((totalList % row) > 0) {
	    	totalpage++;
	    }
	    
	    int startpoint = p * row;
	    bean.setStartpoint(startpoint);
	    bean.setRow(row);
	    String descString = "";
		if(select.equals("new")) {
			descString ="itemnum desc";
		}else if(select.equals("best")) {
			descString="itemsales desc";
		}else if(select.equals("cheap")) {
			descString="itemprice asc";
		}else if(select.equals("expen")) {
			descString="itemprice desc";
		}
		bean.setItemalign(descString);
		List<AllItemVo> list = itemDao.selectItem(bean);
		
		model.addAttribute("p", p);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("List", list);
		model.addAttribute("itemalign", select);
		
		return model;
	}
	
	//best
	@Override
	public Model selectBest(int startPoint, int row, Model model) throws Exception {
		AllItemVo bean = new AllItemVo();
		bean.setStartpoint(startPoint);
		bean.setRow(row);
		
		List<AllItemVo> list = itemDao.selectBest(bean);
		model.addAttribute("List", list);
		return model;
	}	

	//detail
	@Override
	public Model selectOne(int no, Model model) throws Exception {
		AllItemVo bean = new AllItemVo();
		bean.setItemNum(no);
		//아이템 정보
		AllItemVo list = itemDao.selectOne(bean);
		model.addAttribute("List", list);
		return model;
	}

	@Override
	public Model selectOne_detailImg(int no, Model model) throws Exception {
		AllItemVo bean = new AllItemVo();
		bean.setItemNum(no);
		//디테일 이미지
		List<AllItemVo> imglist = itemDao.selectOne_detailImg(bean);
		model.addAttribute("imgList", imglist);
		return model;
	}



}
