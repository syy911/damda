package com.bit.pro.controller;

import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bit.pro.service.QnaService;
import com.bit.pro.vo.QnaVo;

@Controller
@RequestMapping("/qna")
public class QnaController {
	
	String dir = "qna";
	private static final Logger logger = LoggerFactory.getLogger(QnaController.class);
	
	@Resource
	private QnaService qnaService;
	//QNA section
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String qnaList(Locale locale, Model model) throws Exception {
		logger.debug("get : /qna/qna.list");
		
		List<QnaVo> qnaList = qnaService.selectQna();
		 model.addAttribute("qnaList", qnaList);
		 
		return dir+"/qna_list";
	}
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String qnaDetail() {

		return dir+"/qna_detail";
	}
	@RequestMapping(value = "/qnaAnswer/insert", method = RequestMethod.GET)
	public String qnaAnswerInsert() {
		
		return dir+"/qna_detail";
	}
	@RequestMapping(value = "/qnaAnswer/update", method = RequestMethod.GET)
	public String qnaAnswerUpdate() {
		
		return dir+"/qna_detail";
	}
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String qnaInsert() {

		return dir+"/qna_insert";
	}
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String qnaUpdate() {

		return dir+"/qna_insert";
	}
}
