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
	public List<AllItemVo> selectHome(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectHome", map);
	}
	
	//main
	@Override
	public List<AllItemVo> selectItem(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectItem", map);
	}

	@Override
	public int totalItem(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE +".totalItem",map);
	}

	//best
	@Override
	public List<AllItemVo> selectBest(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE +".selectBest",map);
	}
	
	//detail
	@Override
	public AllItemVo selectOne(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE +".itemDetail", map);
	}

	@Override
	public String selectOne_detailImg(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectOne(NAMESPACE +".detailImg", map);
	}

	//align
	@Override
	public List<AllItemVo> alignNew(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE +".alignNew", map);
	}

	@Override
	public List<AllItemVo> alignBest(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE +".alignBest", map);
	}

	@Override
	public List<AllItemVo> alignCheap(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE +".alignCheap", map);
	}

	@Override
	public List<AllItemVo> alignExpen(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE +".alignExpen", map);
	}


}
