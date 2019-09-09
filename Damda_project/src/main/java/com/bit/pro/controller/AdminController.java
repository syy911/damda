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
	
	/////////////////////////////////////////////////////////////////////////경민
	@Inject
	AdminService adminService;

	//--------------------리스트조회(디폴트:상품리스트)----------------------승은
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String itemList(Model model
			,@RequestParam(required=false,defaultValue="1")int page
			,@RequestParam(required=false,defaultValue="1")int range) {
		//전체게시글수
		int listCnt = mateService.selectMateAllCnt();
		
		//Paginaion객체
		pagination pagination = new pagination();
		pagination.pageInfo(page, range, listCnt);
		model.addAttribute("pagination",pagination);
		
		//커스텀 목록 페이지
		//List<MateVo> matelist = mateService.selectMateAll(model);
		model.addAttribute("matelist",mateService.selectMateAll(pagination));
		System.out.println("컨트롤>>>>>>>"+mateService.selectMateAll(pagination));
		return dir+"/itemlist";
	}
	
	//item 등록페이지
	@RequestMapping(value = "/itemregi", method = RequestMethod.GET)
	public String itemRegi() {
		
		return dir+"/itemRegist";
	} 
	
	//상품등록하는 코드(지정한 폴더에 사진이 저장됨)
	@RequestMapping(value = "/itemregi", method = RequestMethod.POST)
	public String itemRegiSave(MultipartHttpServletRequest multi,AllItemVo allitemVo,PhotoVo photoVo) throws Exception {

		int returnResult = adminService.insertAllitem(allitemVo,photoVo,multi); 
		//리턴결과	
		if(returnResult==1) {
			//상품등록성공
			return "redirect:/admin/";	
		}else {
			//상품등록실패
			return dir+"/itemRegist";
		}

	}
	//item 수정페이지
	@RequestMapping(value = "/itemupdate", method = RequestMethod.GET)
	public String itemUpdate() {
		//프론트부터 주소로가르기 원페이지

		return dir+"/itemRegist";
	} 
	
	//--------------------커스텀 등록----------------------
	@RequestMapping(value = "/materegi", method = RequestMethod.GET)
	public String mateRegi() {
		return dir+"/mateRegi";
	}
	
	@RequestMapping(value="/",method=RequestMethod.POST)
	public String mateInsert(@ModelAttribute MateVo mateVo) throws SQLException {//입력페이지->리스트
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
		logger.debug("수정>>>>>"+mateVo.toString());
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