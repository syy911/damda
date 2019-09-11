package com.bit.pro.service;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.pro.dao.JoinDao;
import com.bit.pro.vo.JoinVo;

@Service("joinService")
public class JoinServiceImpl implements JoinService{
	
	private static final Logger logger = LoggerFactory.getLogger(JoinServiceImpl.class);

	
	@Resource(name="joinDao")
	private JoinDao joinDao;
	
	@Override
	public JoinVo insertUser(JoinVo bean) throws Exception {
		System.out.println("controller : "+bean.toString());
		int result=joinDao.insertUser(bean);
		
		if(result>0) {
			
			//���ԿϷ� ������
			//selectOne���� id�� �̿��� ������ ������
			String userid=bean.getUserid();
			JoinVo user = joinDao.selectUser(userid);
			
			return user;
			
			
		}else {
			//�����ȳ�
		}
		
		return null;
	}

	@Override
	public int checkId(JoinVo bean) throws Exception {
		System.out.println("service idcheck : "+bean.toString());
		return joinDao.checkId(bean);
	}

	@Override
	public JoinVo userInfo(String userid) throws Exception {
		JoinVo user = joinDao.selectUser(userid);
		return user;
	}

	@Override
	public int updateUser(JoinVo bean) throws Exception {
		//��й�ȣ �´��� Ȯ��
		int result = joinDao.checkPw(bean);
		if(result>0) {
			joinDao.updateUser(bean);
			System.out.println("controller : "+bean.toString());
		}
		return result;
	}

}
