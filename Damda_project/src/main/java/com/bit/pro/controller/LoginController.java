package com.bit.pro.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.pro.service.CartService;
import com.bit.pro.service.JoinService;
import com.bit.pro.service.LoginService;
import com.bit.pro.vo.JoinVo;
import com.bit.pro.vo.LoginVo;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	String dir = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Resource
	private LoginService loginService;
	
	@Resource
	private CartService cartService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String loginGet() {
		return dir+"/login";
	}
	
	//로그인
	@RequestMapping(value = "/loginErr", method = RequestMethod.POST)
	public ModelAndView loginPost(@ModelAttribute LoginVo loginVo,String id,String password,HttpServletRequest req,HttpSession session,Model model, HttpServletResponse response) throws SQLException, IOException {
		ModelAndView mav=new ModelAndView();
		session = req.getSession();
		
		//map에 담기
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userid", id);
		map.put("userpw", password);
		
		map = loginService.selectOne(map);
		
		if(map!=null) {	//로그인성공시 메인페이지로 이동
			model.addAttribute("loginBean",map);
			//유저아이디 세션 저장
			session.setAttribute("userid", id);
			session.setAttribute("username", map.get("username"));
			session.setAttribute("user_ctg", (int)map.get("category"));
			session.setAttribute("userNum", (int)map.get("usernum"));
			System.out.println("user_ctg: " + map.get("category"));
			System.out.println("userNum: " + map.get("usernum"));
			
			mav.setViewName("redirect:/");
		}else{				//로그인실패시 로그인페이지로 이동
			mav.setViewName("login/login");
			mav.addObject("loginErr","loginErr");
		}
		return mav;
	}
	
	//로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.POST)
	public String logOut(HttpServletRequest req,HttpSession session) {
		session = req.getSession();
		session.removeAttribute("userid");
		session.removeAttribute("username");
		session.removeAttribute("user_ctg");
		session.removeAttribute("userNum");
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/orderhistory", method = RequestMethod.GET)
	public String orderHistory() {
		
		return dir+"/login";
	}
	
	@RequestMapping(value = "/nomember", method = RequestMethod.GET)
	public String noMember() {
		
		return dir+"/login";
	}
	
	//아이디찾기 view
	@RequestMapping(value = "fgid", method = RequestMethod.GET)
	public String fgId() {
		return dir+"/fgIdPw";
	}
	
	//아이디 찾기 결과값
	@RequestMapping(value = "/fnid", method = RequestMethod.POST)
	public ModelAndView fnId(@ModelAttribute LoginVo loginVo,String name,String email,String phone,HttpServletRequest req,Model model) throws SQLException, UnsupportedEncodingException {
		ModelAndView mav=new ModelAndView();
		//파라미터값 map에 담기
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(phone!=null) {
			phone = phone.replace("-", "");
		}
		map.put("username",name);
		map.put("useremail",email);
		map.put("userphone",phone);
		map = loginService.selectFnId(map);
		if(map!=null) {
			mav.setViewName(dir+"/fnIdPw");
			model.addAttribute("loginBean",map);
		}else {
			mav.setViewName("redirect:/login/fgid");
			mav.addObject("fnIdErr","fnIdErr");
		}
		return mav;
	}
	
	//비밀번호 찾기 view
	@RequestMapping(value = "/fgpw", method = RequestMethod.GET)
	public String fgPW() {
		return dir+"/fgIdPw";
	}
	
	//비밀번호 찾기 결과값
	@RequestMapping(value = "/fnpw", method = RequestMethod.POST)
	public ModelAndView fnPw(@ModelAttribute LoginVo loginVo,String id,String name,String email,String phone,HttpServletRequest req,Model model) throws SQLException {
		ModelAndView mav = new ModelAndView();
		//파라미터값 map에 담기
		HashMap<String,Object> map = new HashMap<String,Object>();
		if(phone!=null) {
			phone = phone.replace("-", "");
		}
		map.put("userid", id);
		map.put("username", name);
		map.put("useremail", email);
		map.put("userphone", phone);
		map = loginService.selectFnPw(map);
		
		if(map!=null) {
			mav.setViewName(dir+"/fnIdPw");
			model.addAttribute("loginBean",map);
			return mav;
		}else {
			mav.setViewName("redirect:/login/fgpw");
			mav.addObject("fnPwErr","fnPwErr");
			return mav;
		}
	}
	
	//=================================================================
	
			@Resource
			private JoinService joinService;
			
			//회원가입
			@RequestMapping(value = "/join", method = RequestMethod.GET)
			public String join() {

				return dir+"/join";
			}
			
			//ID중복확인
			@RequestMapping(value = "checkId", method = { RequestMethod.GET, RequestMethod.POST})
			public @ResponseBody int idChk(JoinVo bean) throws Exception {
				return joinService.checkId(bean);
			}
			
			//회원가입 완료시 보이는 화면
			@RequestMapping(value = "/complite", method = RequestMethod.GET)
			public String joinComplite() {
				
				return dir+"/joinComplite";
			}
				
				
			//주소찾기 팝업
			@RequestMapping(value = "/popup")
			public String popup(Locale locale, Model model) {
			
				return dir+"/findJuso";
			}
			
			//회원가입 등록(DB넣음) 및 완료
			@RequestMapping(value = "insertUser", method = RequestMethod.POST)
			public ModelAndView joinComplite(@ModelAttribute JoinVo bean) throws Exception {
				
				System.out.println("view에서 넘어온 para"+bean.toString());
				System.out.println(bean.getUseraddr1() + " "+bean.getUseraddr2());
				JoinVo userInfo =joinService.insertUser(bean);
				
				if(userInfo!=null) {
					
					//완료된 페이지로 간다
					ModelAndView mav = new ModelAndView(dir+"/joinComplite");
					mav.addObject("userInfo",userInfo);
					
					return mav;
				}else {
					ModelAndView mav = new ModelAndView(dir+"/join");
					return mav;
							
				}
			}
			
			
			//로그인한 유저의 정보를 받아서 출력한다
			@RequestMapping(value = "/edituser", method = RequestMethod.GET)
			public ModelAndView edituser(HttpServletRequest req,HttpSession session) throws Exception {
				session=req.getSession();
				String userid = (String) session.getAttribute("userid");
				JoinVo userInfo = joinService.userInfo(userid);
				ModelAndView mav = new ModelAndView(dir+"/edituser");
				mav.addObject("userInfo",userInfo);

				return mav; 
			}
			
			
			//유저 정보 수정
			@RequestMapping(value = "updateUser", method = RequestMethod.POST)
			public ModelAndView updateUser(@ModelAttribute JoinVo bean, HttpServletRequest req,HttpSession session) throws Exception {
				ModelAndView mav = new ModelAndView();
				int result = joinService.updateUser(bean);
				
				session=req.getSession();
				String userid = (String) session.getAttribute("userid");
				JoinVo userInfo = joinService.userInfo(userid);
				mav.addObject("userInfo",userInfo);
				
				
				mav.setViewName("/login/edituser");
				if(result>0) {
					System.out.println("올바른 비밀번호 입력");
					mav.addObject("incorrect", "맞음");
					
				}else {
					System.out.println("잘못된 비밀번호 입력");
					mav.addObject("incorrect", "incorrect");
					
				}
				return mav;
			}
}
