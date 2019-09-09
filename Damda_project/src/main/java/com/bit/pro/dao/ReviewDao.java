package com.bit.pro.dao;

import java.util.HashMap;
import java.util.List;

import com.bit.pro.vo.ReviewVo;

public interface ReviewDao {
	
	List<ReviewVo> selectList(ReviewVo bean) throws Exception;
	int reviewCount(ReviewVo bean);

}
