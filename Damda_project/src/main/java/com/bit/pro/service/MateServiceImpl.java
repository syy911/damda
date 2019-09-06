package com.bit.pro.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.pro.dao.MateDao;
import com.bit.pro.util.pagination;
import com.bit.pro.vo.MateVo;

@Service("MateService")
public class MateServiceImpl implements MateService{
	private static final Logger logger= LoggerFactory.getLogger(MateServiceImpl.class);
	
	@Inject
	private MateDao mateDao;
	
	
	@Override
	public List<MateVo> selectMateAll(pagination pagination) {
		logger.debug("Á¶È¸>>>>>>>>>>:"+mateDao.selectMateAll(pagination));
		return mateDao.selectMateAll(pagination);
	}

	@Override
	public void insertMate(MateVo mateVo) {
		mateDao.insertMate(mateVo);
	}

	@Override
	public void selectMateOne(int matenum, Model model) {
		logger.debug("»ó¼â>>>>>>>>>>:"+mateDao.selectMateOne(matenum));
		model.addAttribute("mateone",mateDao.selectMateOne(matenum));
	}

	@Override
	public void updateMate(MateVo mateVo) {
		mateDao.updateMate(mateVo);
	}

	@Override
	public void deleteMate(int matenum) {
		mateDao.deleteMate(matenum);
	}

	@Override
	public int selectMateAllCnt() {
		return mateDao.selectMateAllCnt();
	}

}
