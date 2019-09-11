package com.bit.pro.dao;

import java.util.HashMap;
import java.util.List;

import com.bit.pro.vo.AllItemVo;

public interface ItemDao {
	
	//home
	List<AllItemVo> selectHome(AllItemVo bean) throws Exception;
	
	//main
	List<AllItemVo> selectItem(AllItemVo bean) throws Exception;
	int totalItem(AllItemVo bean);
	
	//best
	List<AllItemVo> selectBest(AllItemVo bean) throws Exception;
	
	//detail
	AllItemVo selectOne(AllItemVo bean) throws Exception;
	List<AllItemVo> selectOne_detailImg(AllItemVo bean) throws Exception;

	//item-insert
	int insertItem(AllItemVo allitemVo) throws Exception; 
	
}
