package com.bit.pro.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.ui.Model;

import com.bit.pro.vo.ReviewVo;

public interface ReviewService {
	
	Model selectList(int no, int p, String align, Model model) throws Exception;
	Model reviewCount(int no, Model model);
}
