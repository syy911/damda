package com.bit.pro.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.bit.pro.dao.ItemDao;
import com.bit.pro.vo.AllItemVo;

@Service("itemService")
public class ItemServiceImpl implements ItemService {
	
	private static final Logger logger = LoggerFactory.getLogger(ItemServiceImpl.class);
	
	@Resource(name="itemDao")
	private ItemDao itemDao;


	//Home
	@Override
	public List<AllItemVo> selectHome(HashMap<String, Object> map) throws Exception {
//		logger.debug("출력: "+itemDao.selectHome(map));
		return itemDao.selectHome(map);
	}
	
	//Main
	@Override
	public List<AllItemVo> selectItem(HashMap<String, Object> map) throws Exception {
	//	logger.debug("출력: "+itemDao.selectHome(map));
		return itemDao.selectItem(map);
	}

	@Override
	public int totalCount(HashMap<String, Object> map) {
		return itemDao.totalItem(map);
	}
	
	//best
	@Override
	public List<AllItemVo> selectBest(HashMap<String, Object> map) throws Exception {
		return itemDao.selectBest(map);
	}	

	//detail
	@Override
	public AllItemVo selectOne(HashMap<String, Object> map) throws Exception {
		return itemDao.selectOne(map);
	}

	@Override
	public String selectOne_detailImg(HashMap<String, Object> map) throws Exception {
		return itemDao.selectOne_detailImg(map);
	}

	
	//align
	@Override
	public List<AllItemVo> alignNew(HashMap<String, Object> map) throws Exception {
		return itemDao.alignNew(map);
	}

	@Override
	public List<AllItemVo> alignBest(HashMap<String, Object> map) throws Exception {
		return itemDao.alignBest(map);
	}

	@Override
	public List<AllItemVo> alignCheap(HashMap<String, Object> map) throws Exception {
		return itemDao.alignCheap(map);
	}

	@Override
	public List<AllItemVo> alignExpen(HashMap<String, Object> map) throws Exception {
		return itemDao.alignExpen(map);
	}


}
