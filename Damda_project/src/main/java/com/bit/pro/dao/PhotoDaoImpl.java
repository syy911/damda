package com.bit.pro.dao;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.bit.pro.vo.PhotoVo;

@Repository("photoDao")
public class PhotoDaoImpl implements PhotoDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.photoMapper";
	
	@Override 
	public int insertPhoto(PhotoVo photoVo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertPhoto",photoVo);
	}

}
