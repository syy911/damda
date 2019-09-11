package com.bit.pro.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.pro.vo.AllItemVo;

public interface ItemService {
	
	//Home
	Model selectHome(Model model) throws Exception;
		
	//main
	Model selectItem(int num, int p, String select, Model model) throws Exception;
	
	//best
	Model selectBest(int startPoint, int row, Model model) throws Exception;

	//detail
	Model selectOne(int no, Model model) throws Exception;
	Model selectOne_detailImg(int no, Model model) throws Exception;

	
	
}
