package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.bit.pro.vo.EventVo;

@Repository("eventDao")
public class EventDaoImpl implements EventDao{

	@Inject
	private SqlSession sqlSession;
	
	private static final String NAMESPACE = "com.bit.pro.mappers.eventMapper";

	@Override
	public List<EventVo> selectEventAll() throws SQLException {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+".selectEventAll");
	}

	@Override
	public void insertEvent(EventVo eventVo) throws SQLException {
		// TODO Auto-generated method stub
		sqlSession.insert(NAMESPACE + ".insertEvent", eventVo);
	}

	@Override
	public EventVo selectEventOne(int eventnum) {
		return sqlSession.selectOne(NAMESPACE+".selectEventOne",eventnum);
	}

	@Override
	public void updateEvent(EventVo eventVo) {
		// TODO Auto-generated method stub
		sqlSession.update(NAMESPACE+".updateEvent",eventVo);
	}

	@Override
	public int deleteEvent(int eventnum) {
		return sqlSession.delete(NAMESPACE+".deleteEvent", eventnum);
	}

	
}
