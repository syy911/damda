package com.bit.pro.controller;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bit.pro.service.EventService;
import com.bit.pro.vo.EventVo;

@Controller
@RequestMapping("/event")
public class EventController {
	
	String dir = "event";
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	@Resource
	private EventService eventService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String eventList(Model model) throws SQLException{
		
	    
		List<EventVo> eventlist = eventService.selectEventAll(model);
		
		model.addAttribute("eventlist",eventlist);
		
		return dir+"/EventList";
	}
	
	@RequestMapping(value = "/input", method = RequestMethod.GET)
	public String eventInput() {//리스트->입력페이지
		return dir+"/EventInput";
	}
	
	@RequestMapping(value="/",method=RequestMethod.POST)
	public String eventInsert(@ModelAttribute EventVo eventVo) throws SQLException {//입력페이지->리스트
		eventService.insertEvent(eventVo);
		return "redirect:/event/";
	}
	
	@RequestMapping(value="/detail/{idx}",method=RequestMethod.GET)
	public String eventDetail(@PathVariable("idx") int eventnum,Model model) {
		eventService.selectEventOne(model, eventnum);
		return dir+"/EventDetail";
	}
	
	@RequestMapping(value="/detail/{idx}",method= {RequestMethod.PUT,RequestMethod.POST})
	public String eventUpdate(@PathVariable("idx") int eventnum,@ModelAttribute EventVo eventVo) {
		eventService.updateEvent(eventVo);
		logger.debug("수정>>>>>"+eventVo.toString());
		return "redirect:/event/detail/"+eventnum;
	}
	
	@RequestMapping(value="/delete/{idx}",method= RequestMethod.GET)
	public String eventDelete(@PathVariable("idx") int eventnum) {
		eventService.deleteEvent(eventnum);
		return "redirect:/event/";
	}
}