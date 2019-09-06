package com.bit.pro.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.ReviewVo;

@Repository("reviewDao")
public class ReviewDaoImpl implements ReviewDao {

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.reviewMapper";
	
	@Override
	public List<ReviewVo> selectList(HashMap<String, Object> map) throws Exception {
		return sqlSession.selectList(NAMESPACE +".selectList", map);
	}

	@Override
	public int reviewCount(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE +".reviewCount", map);
	}

}
