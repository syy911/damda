package com.bit.pro.dao;

import java.util.HashMap;
import java.util.List;

import com.bit.pro.vo.ReviewVo;

public interface ReviewDao {
	
	List<ReviewVo> selectList(HashMap<String, Object> map) throws Exception;
	int reviewCount(HashMap<String, Object> map);

}
