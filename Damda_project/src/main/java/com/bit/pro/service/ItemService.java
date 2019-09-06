package com.bit.pro.service;

import java.util.HashMap;
import java.util.List;

import com.bit.pro.vo.AllItemVo;

public interface ItemService {
	
	//Home
	List<AllItemVo> selectHome(HashMap<String, Object> map) throws Exception;
		
	//main
	List<AllItemVo> selectItem(HashMap<String, Object> map) throws Exception;
	int totalCount(HashMap<String, Object> map);
	
	//best
	List<AllItemVo> selectBest(HashMap<String, Object> map) throws Exception;

	//detail
	AllItemVo selectOne(HashMap<String, Object> map) throws Exception;
	String selectOne_detailImg(HashMap<String, Object> map) throws Exception;

	//align
	List<AllItemVo> alignNew(HashMap<String, Object> map) throws Exception;

	List<AllItemVo> alignBest(HashMap<String, Object> map) throws Exception;

	List<AllItemVo> alignCheap(HashMap<String, Object> map) throws Exception;

	List<AllItemVo> alignExpen(HashMap<String, Object> map) throws Exception;
	
	
}
