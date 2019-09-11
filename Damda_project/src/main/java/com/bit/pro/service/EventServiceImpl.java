package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.pro.dao.EventDao;
import com.bit.pro.vo.EventVo;

@Service("eventService")
public class EventServiceImpl implements EventService{
	private static final Logger logger = LoggerFactory.getLogger(EventServiceImpl.class);
	
	@Inject
	private EventDao eventDao;

	@Override
	public List<EventVo> selectEventAll(Model model) throws SQLException {
		logger.debug("조회>>>>>>>>>>:"+eventDao.selectEventAll());
		return eventDao.selectEventAll();
	}

	@Override
	public void insertEvent(EventVo eventVo) throws SQLException {
		// TODO Auto-generated method stub
		eventDao.insertEvent(eventVo);
	}

	@Override
	public void selectEventOne(Model model,int eventnum) {
		logger.debug("상세>>>>>>>>>:"+eventDao.selectEventOne(eventnum));
		model.addAttribute("eventone",eventDao.selectEventOne(eventnum));		
	}

	@Override
	public void updateEvent(EventVo eventVo) {
		// TODO Auto-generated method stub
		eventDao.updateEvent(eventVo);
	}
	@Override
	public void deleteEvent(int eventnum) {
		eventDao.deleteEvent(eventnum);
	}
}
