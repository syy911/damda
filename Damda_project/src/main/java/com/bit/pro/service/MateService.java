package com.bit.pro.service;

import java.io.IOException;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.pro.util.pagination;
import com.bit.pro.vo.MateVo;
import com.bit.pro.vo.PhotoVo;

public interface MateService {
	
	List<MateVo> selectMateAll(pagination pagination);
	int insertMate(MateVo mateVo,PhotoVo photoVo, MultipartHttpServletRequest multi) throws IOException, Exception;
	List<MateVo> selectMateOne(int matenum,PhotoVo photoVo, Model model);
	void updateMate(MateVo mateVo);
	void deleteMate(int matenum);
	int selectMateAllCnt();
}
