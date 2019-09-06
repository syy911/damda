package com.bit.pro.service;

import java.util.List;

import com.bit.pro.vo.QnaVo;

public interface QnaService {
	
	List<QnaVo> selectQna() throws Exception;
	int insertQna(QnaVo qnaVo) throws Exception;
}
