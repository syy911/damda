package com.bit.pro.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.pro.vo.AllItemVo;
import com.bit.pro.vo.PhotoVo;

@Transactional
public interface AdminService {
	// these settings have precedence for this method

//	int insertItem(AllitemVo allitemVo) throws Exception; 
//	int insertPhoto(PhotoVo photoVo) throws Exception; 
	

	int insertAllitem(AllItemVo allitemVo,PhotoVo photoVo,MultipartHttpServletRequest multi) throws Exception;
	

}
