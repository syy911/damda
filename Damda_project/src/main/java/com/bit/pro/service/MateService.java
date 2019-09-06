package com.bit.pro.service;

import java.util.List;

import org.springframework.ui.Model;

import com.bit.pro.util.pagination;
import com.bit.pro.vo.MateVo;

public interface MateService {
	
	List<MateVo> selectMateAll(pagination pagination);
	void insertMate(MateVo mateVo);
	void selectMateOne(int matenum, Model model);
	void updateMate(MateVo mateVo);
	void deleteMate(int matenum);
	int selectMateAllCnt();
}
