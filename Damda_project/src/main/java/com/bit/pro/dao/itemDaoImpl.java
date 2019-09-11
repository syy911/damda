package com.bit.pro.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.AllItemVo;

@Repository("itemDao")
public class itemDaoImpl implements ItemDao {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.itemMapper";
	
	//home
	@Override
	public List<AllItemVo> selectHome(AllItemVo bean) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectHome", bean);
	}
	
	//main
	@Override
	public List<AllItemVo> selectItem(AllItemVo bean) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectItem", bean);
	}

	@Override
	public int totalItem(AllItemVo bean) {
		return sqlSession.selectOne(NAMESPACE +".totalItem",bean);
	}

	//best
	@Override
	public List<AllItemVo> selectBest(AllItemVo bean) throws Exception {
		return sqlSession.selectList(NAMESPACE +".selectBest",bean);
	}
	
	//detail
	@Override
	public AllItemVo selectOne(AllItemVo bean) throws Exception {
		return sqlSession.selectOne(NAMESPACE +".itemDetail", bean);
	}

	@Override
	public List<AllItemVo> selectOne_detailImg(AllItemVo bean) throws Exception {
		return sqlSession.selectList(NAMESPACE +".detailImg", bean);
	}
	
	//item-insert
	@Override 
	public int insertItem(AllItemVo allitemVo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertAllitem",allitemVo);
	}



}
