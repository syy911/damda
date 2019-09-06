package com.bit.pro.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bit.pro.dao.ItemDao;
import com.bit.pro.dao.ReviewDao;
import com.bit.pro.vo.ReviewVo;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	private static final Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);
	
	@Resource(name="reviewDao")
	private ReviewDao reviewDao;
	
	
	@Override
	public List<ReviewVo> selectList(HashMap<String, Object> map) throws Exception {
//		logger.debug("출력: "+reviewDao.selectList(map));
		return reviewDao.selectList(map);
	}


	@Override
	public int reviewCount(HashMap<String, Object> map) {
		logger.debug("출력: "+reviewDao.reviewCount(map));
		return reviewDao.reviewCount(map);
	}

}
