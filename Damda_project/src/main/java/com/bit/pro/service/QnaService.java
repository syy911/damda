package com.bit.pro.service;

import java.util.List;

import com.bit.pro.vo.QnaVo;

public interface QnaService {
	
	List<QnaVo> selectQnaList() throws Exception;
	int insertQna(QnaVo qnaVo) throws Exception;
}
