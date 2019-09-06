package com.bit.pro.service;

import java.util.HashMap;
import java.util.List;

import com.bit.pro.vo.ReviewVo;

public interface ReviewService {
	
	List<ReviewVo> selectList(HashMap<String, Object> map) throws Exception;
	int reviewCount(HashMap<String, Object> map);
}
