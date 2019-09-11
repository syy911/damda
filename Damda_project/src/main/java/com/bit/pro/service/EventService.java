package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.bit.pro.vo.EventVo;

public interface EventService {
	List<EventVo> selectEventAll(Model model) throws SQLException;
	void insertEvent(EventVo eventVo) throws SQLException;
	void selectEventOne(Model model,int eventnum);
	void updateEvent(EventVo eventVo);
	void deleteEvent(int eventnum);
}

