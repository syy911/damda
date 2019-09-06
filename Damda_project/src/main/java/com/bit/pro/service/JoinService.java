package com.bit.pro.service;

import org.springframework.ui.Model;

import com.bit.pro.vo.JoinVo;

public interface JoinService {
	//회원가입시 입력+정보 화면에 전달
	JoinVo insertUser(JoinVo bean) throws Exception;
	
	//아이디 중복확인
	int checkId(JoinVo bean) throws Exception;
	
	//마이페이지에 들어갔을 시 개인 정보 출력
	JoinVo userInfo(String userid) throws Exception;
	
	//개인정보 수정(업데이트)
	int updateUser(JoinVo bean) throws Exception;

}
