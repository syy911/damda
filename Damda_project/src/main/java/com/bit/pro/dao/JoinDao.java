package com.bit.pro.dao;


import com.bit.pro.vo.JoinVo;


public interface JoinDao {
	//���������� ������ �Ǿ��� �� ����� ���� DB���� ���̵� �̿��� ���������� �����ش�
	JoinVo selectUser(String userid) throws Exception;
	
	//�Էµ� ������ DB�� ����
	int insertUser(JoinVo bean) throws Exception;

	//���̵� �ߺ�üũ
	int checkId(JoinVo bean) throws Exception;

	//���� ���� ����
	void updateUser(JoinVo bean) throws Exception;

	int checkPw(JoinVo bean) throws Exception;

	
}
