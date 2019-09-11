package com.bit.pro.controller;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.pro.service.NoticeService;
import com.bit.pro.vo.NoticePager;
import com.bit.pro.vo.NoticeVo;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	String dir = "notice";
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Resource
	private NoticeService noticeService;
	
	//notice list + paging
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView notice(@RequestParam(defaultValue = "1") int curPage, Model model) throws SQLException {
		//���ڵ��� ���� ���
		int count = noticeService.countArticle();
		
		//������ ������ ���� ó��
		NoticePager noticePager = new NoticePager(count, curPage);
		
		int nowPage = (curPage-1) * 10;
		int scale = 10;
	
		List<NoticeVo> noticeList = noticeService.selectNotice(nowPage,scale);
		
		//�����͸� �ʿ� ����
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeList",noticeList);	//list
		map.put("count", count);	//���ڵ� ����
		map.put("noticePager", noticePager);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("map", map);	//�ʿ� ����� �����͸� mav�� ����
		mav.setViewName(dir+"/notice_list"); //view�� notice_list�� ����
		
		return mav;
	}
	
	//notice detail
	@RequestMapping(value = "/detail/{idx}", method = RequestMethod.GET)
	public String noticeDetail(@PathVariable("idx") int bbsnum,Model model) throws SQLException {
		//����� 
		NoticeVo noticeDetail = noticeService.detailNotice(bbsnum);
		System.out.println("noticeDetail����:"+noticeDetail);
		//view update
		int bbsseq = noticeDetail.getBbsseq();
		noticeService.viewCount(bbsseq);
		//prev ����
		int prevbbsseq = noticeDetail.getBbsnum() - 1; 
		NoticeVo noticePrevDetail = noticeService.detailPrevNotice(prevbbsseq); 
		//���� �� ���� 
		int nextbbsseq = noticeDetail.getBbsnum() + 1; 
		NoticeVo noticeNextDetail = noticeService.detailNextNotice(nextbbsseq); 
		
		//model ���
		model.addAttribute("noticeDetail",noticeDetail);
		model.addAttribute("noticePrevDetail",noticePrevDetail);
		model.addAttribute("noticeNextDetail",noticeNextDetail);
		
		return dir+"/notice_detail"; 
	}
	
	//�� ���&�� ���� ���� jsp
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String noticeInsert() {
		return dir+"/notice_insert";
	}
	
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String noticeAdd(@ModelAttribute NoticeVo noticeVo) throws SQLException {
		int nullcheck = noticeService.addNotice(noticeVo);
		System.out.println(nullcheck);
		if(nullcheck==0) {
		}
		return "redirect:/notice/";
	}
	
	//ajax delete
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public  String noticeDeleteAjax(@RequestParam(value="delSeqNo") List<String> delSeqNo) throws SQLException {
		int bbsseq=0;
		for(String i : delSeqNo) {
			bbsseq = Integer.parseInt(i);
			noticeService.deleteNotice(bbsseq);
		}
		String result="OK";
		return result;
	}
	//delete
	@RequestMapping(value = "/delete/{idx}", method = RequestMethod.GET)
	public String noticeDelete(@PathVariable("idx") int bbsseq) throws SQLException {
		noticeService.deleteNotice(bbsseq);
		return "redirect:/notice/";
	}
	
	@RequestMapping(value = "/update/{idx}", method = RequestMethod.GET)
	public String noticeUpdateGet(@PathVariable("idx") int bbsnum,Model model) throws SQLException {
		NoticeVo noticeUpdate = noticeService.detailNotice(bbsnum);
		model.addAttribute("noticeUpdate",noticeUpdate);
		
		return dir+"/notice_insert";
	}
	
	@RequestMapping(value = "/update/{idx}", method = RequestMethod.POST)
	public String noticeUpdatePost(@PathVariable("idx") int bbsseq,@ModelAttribute NoticeVo noticeVo) throws SQLException {
		noticeService.updateNotice(noticeVo);
		return "redirect:/notice/";
	}
	
	//faq
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public String faq() {
		return dir+"/faq";
	}
}
