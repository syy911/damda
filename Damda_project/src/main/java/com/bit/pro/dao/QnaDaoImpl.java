package com.bit.pro.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.QnaVo;

@Repository("qnaDao")
public class QnaDaoImpl implements QnaDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.qnaMapper";
	
	@Override
	public List<QnaVo> selectQnaList() throws Exception {
		return sqlSession.selectList(NAMESPACE + ".selectQnaList");
	}

	@Override
	public int insertQna(QnaVo qnaVo) throws Exception {
		return sqlSession.insert(NAMESPACE + ".insertQna", qnaVo);
	}

}
