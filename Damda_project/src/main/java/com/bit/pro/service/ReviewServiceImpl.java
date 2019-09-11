package com.bit.pro.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.pro.dao.ItemDao;
import com.bit.pro.dao.ReviewDao;
import com.bit.pro.vo.ReviewVo;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	private static final Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);
	
	@Resource(name="reviewDao")
	private ReviewDao reviewDao;
	
	
	@Override
	public Model selectList(int no, int p, String align, Model model) throws Exception {
		ReviewVo bean = new ReviewVo();
		//아이템별 리뷰 불러오기
		bean.setR_itemNum(no);
		
		//리뷰 paging
		int totalCnt = reviewDao.reviewCount(bean);
		
		//리뷰 정렬
		String msg="";
		if(align.equals("reviewnew")) {
			msg="reviewnum desc";
		}else if(align.equals("reviewbest")) {
			msg="recommend desc";
		}
		bean.setItemalign(msg);
		
		
		int row = 10;//10개씩보이기
		int totalpage = 0;
		if(totalCnt == 0) {
			totalpage = 0;
		}else {			
	        totalpage = totalCnt / row - 1;
	        if((totalCnt % row) > 0) totalpage++;
		}
        
        int startpoint = p * row;
        bean.setStartpoint(startpoint);
        bean.setRow(row);
        
        List<ReviewVo> reviewList = reviewDao.selectList(bean);
        model.addAttribute("URL", "/item/detail?no="+no);
		model.addAttribute("p", p);
		model.addAttribute("totalpage",totalpage);
		model.addAttribute("reviewalign", align);
		model.addAttribute("reviewList", reviewList);
		
		return model;
	}


	@Override
	public Model reviewCount(int no, Model model) {
		ReviewVo bean = new ReviewVo();
		bean.setR_itemNum(no);
		model.addAttribute("reviewCount", reviewDao.reviewCount(bean));
		return model;
	}

}
