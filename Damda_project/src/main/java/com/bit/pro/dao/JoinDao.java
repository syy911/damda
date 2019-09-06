package com.bit.pro.dao;


import com.bit.pro.vo.JoinVo;


public interface JoinDao {
	//성공적으로 가입이 되었을 때 출력을 위해 DB에서 아이디를 이용해 유저정보를 보내준다
	JoinVo selectUser(String userid) throws Exception;
	
	//입력된 정보를 DB에 저장
	int insertUser(JoinVo bean) throws Exception;

	//아이디 중복체크
	int checkId(JoinVo bean) throws Exception;

	//유저 정보 수정
	void updateUser(JoinVo bean) throws Exception;

	int checkPw(JoinVo bean) throws Exception;

	
}
