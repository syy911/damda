package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.pro.vo.EventVo;

public interface EventDao {

	List<EventVo> selectEventAll() throws SQLException;

	void insertEvent(EventVo eventVo) throws SQLException;
	
	EventVo selectEventOne(int eventnum);

	void updateEvent(EventVo eventVo);
	
	int deleteEvent(int eventnum);

}
