package com.bit.pro.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.bit.pro.util.pagination;
import com.bit.pro.vo.MateVo;

@Repository("mateDao")
public class MateDaoImpl implements MateDao{

	@Inject
	private SqlSession sqlMate;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.customRegiMapper";

	@Override
	public List<MateVo> selectMateAll(pagination pagination) {
		return sqlMate.selectList(NAMESPACE+".selectMateAll",pagination);
	}

	@Override
	public void insertMate(MateVo mateVo) {
		sqlMate.insert(NAMESPACE+".insertMate",mateVo);		
	}

	@Override
	public MateVo selectMateOne(int matenum) {
		System.out.println("matenum>>>>>>>>>>>>>>"+matenum);
		return sqlMate.selectOne(NAMESPACE+".selectMateOne",matenum);
	}

	@Override
	public void updateMate(MateVo mateVo) {
		sqlMate.update(NAMESPACE+".updateMate",mateVo);
	}

	@Override
	public int deleteMate(int matenum) {
		return sqlMate.delete(NAMESPACE+".deleteMate",matenum);
	}

	@Override
	public int selectMateAllCnt() {
		return sqlMate.selectOne(NAMESPACE+".selectMateAllCnt");
	}

	
	
}
