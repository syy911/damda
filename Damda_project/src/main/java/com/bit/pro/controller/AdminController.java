package com.bit.pro.controller;

import java.sql.SQLException;
import javax.annotation.Resource;
import javax.inject.Inject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.bit.pro.service.AdminService;
import com.bit.pro.service.MateService;
import com.bit.pro.util.pagination;
import com.bit.pro.vo.AllItemVo;
import com.bit.pro.vo.MateVo;
import com.bit.pro.vo.PhotoVo;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Resource
	private MateService mateService;
	
	String dir = "admin";
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	/////////////////////////////////////////////////////////////////////////���
	@Inject
	AdminService adminService;

	//--------------------����Ʈ��ȸ(����Ʈ:��ǰ����Ʈ)----------------------����
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String itemList(Model model
			,@RequestParam(required=false,defaultValue="1")int page
			,@RequestParam(required=false,defaultValue="1")int range) {
		//��ü�Խñۼ�
		int listCnt = mateService.selectMateAllCnt();
		
		//Paginaion��ü
		pagination pagination = new pagination();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination",pagination);
		
		//Ŀ���� ��� ������
		//List<MateVo> matelist = mateService.selectMateAll(model);
		model.addAttribute("matelist",mateService.selectMateAll(pagination));
		System.out.println("��Ʈ��>>>>>>>"+mateService.selectMateAll(pagination));
		return dir+"/itemlist";
	}
	
	//item ���������
	@RequestMapping(value = "/itemregi", method = RequestMethod.GET)
	public String itemRegi() {
		
		return dir+"/itemRegist";
	} 
	
	//��ǰ����ϴ� �ڵ�(������ ������ ������ �����)
	@RequestMapping(value = "/itemregi", method = RequestMethod.POST)
	public String itemRegiSave(MultipartHttpServletRequest multi,AllItemVo allitemVo,PhotoVo photoVo) throws Exception {

		int returnResult = adminService.insertAllitem(allitemVo,photoVo,multi); 
		//���ϰ��	
		if(returnResult==1) {
			//��ǰ��ϼ���
			return "redirect:/admin/";	
		}else {
			//��ǰ��Ͻ���
			return dir+"/itemRegist";
		}

	}
	//item ����������
	@RequestMapping(value = "/itemupdate", method = RequestMethod.GET)
	public String itemUpdate() {
		//����Ʈ���� �ּҷΰ����� ��������

		return dir+"/itemRegist";
	} 
	
	//--------------------Ŀ���� ���----------------------
	@RequestMapping(value = "/materegi", method = RequestMethod.GET)
	public String mateRegi() {
		return dir+"/mateRegi";
	}
	
	@RequestMapping(value="/",method=RequestMethod.POST)
	public String mateInsert(@ModelAttribute MateVo mateVo) throws SQLException {//�Է�������->����Ʈ
		mateService.insertMate(mateVo);
		return "redirect:/admin/";
	}
	
	@RequestMapping(value="/detail/{idx}",method=RequestMethod.GET)
	public String mateDetail(@PathVariable("idx") int matenum,Model model) {
		mateService.selectMateOne(matenum, model);
		return dir+"/mateDetail";
	}
	
	@RequestMapping(value="/detail/{idx}",method= {RequestMethod.PUT,RequestMethod.POST})
	public String mateUpdate(@PathVariable("idx") int matenum,@ModelAttribute MateVo mateVo) {
		mateService.updateMate(mateVo);
		logger.debug("����>>>>>"+mateVo.toString());
		return "redirect:/admin/detail/"+matenum;
	}
	@RequestMapping(value="/delete/{idx}",method= RequestMethod.GET)
	public String deleteMate(@PathVariable("idx") int matenum) {
		mateService.deleteMate(matenum);
		return "redirect:/admin/";
	}
	
	/************************************************************************************************/
	@RequestMapping(value = "/orderlist", method = RequestMethod.GET)
	public String orderList() {
 
		return dir+"/orderList";
	}
}