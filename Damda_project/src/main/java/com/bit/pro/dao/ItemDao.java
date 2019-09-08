package com.bit.pro.dao;

import java.util.HashMap;
import java.util.List;

import com.bit.pro.vo.AllItemVo;

public interface ItemDao {
	
	//home
	List<AllItemVo> selectHome(HashMap<String, Object> map) throws Exception;
	
	//main
	List<AllItemVo> selectItem(HashMap<String, Object> map) throws Exception;
	int totalItem(HashMap<String, Object> map);
	
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
	
	//item-insert
	int insertItem(AllItemVo allitemVo) throws Exception; 
	
}
