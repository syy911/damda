package com.bit.pro.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.AllItemVo;

@Repository("allitemDao")
public class AllitemDaoImpl implements AllitemDao {
 
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.allitemMapper";
	
	@Override 
	public int insertItem(AllItemVo allitemVo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertAllitem",allitemVo);
	}

}
