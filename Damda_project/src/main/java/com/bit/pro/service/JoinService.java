package com.bit.pro.service;

import org.springframework.ui.Model;

import com.bit.pro.vo.JoinVo;

public interface JoinService {
	//ȸ�����Խ� �Է�+���� ȭ�鿡 ����
	JoinVo insertUser(JoinVo bean) throws Exception;
	
	//���̵� �ߺ�Ȯ��
	int checkId(JoinVo bean) throws Exception;
	
	//������������ ���� �� ���� ���� ���
	JoinVo userInfo(String userid) throws Exception;
	
	//�������� ����(������Ʈ)
	int updateUser(JoinVo bean) throws Exception;

}
