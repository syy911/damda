package com.bit.pro.dao;

import java.util.List;

import com.bit.pro.util.pagination;
import com.bit.pro.vo.MateVo;

public interface MateDao {
	
	List<MateVo> selectMateAll(pagination pagination);
	
	void insertMate(MateVo mateVo);
	
	MateVo selectMateOne(int matenum);
	
	void updateMate(MateVo mateVo);
	
	int deleteMate(int matenum);
	
	int selectMateAllCnt();
}
