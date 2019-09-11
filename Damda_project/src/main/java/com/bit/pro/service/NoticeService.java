package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.NoticeVo;

public interface NoticeService {
	//notice list
	List<NoticeVo> selectNotice(int nowPage, int scale) throws SQLException;
	//notice ���ڵ� ����
	int countArticle() throws SQLException;
	/***********************************************************************/
	//notice detail
	NoticeVo detailNotice(Integer bbsnum) throws SQLException;
	//notice detailŬ�� �� ��ȸ�� ����
	int viewCount(Integer bbsseq)throws SQLException;
	//prev ����
	NoticeVo detailPrevNotice(int prevbbsseq) throws SQLException;
	//next ����
	NoticeVo detailNextNotice(int nextbbsseq) throws SQLException;
	/***********************************************************************/
	//notice add
	int addNotice(NoticeVo noticeVo) throws SQLException;
	//notice delete
	void deleteNotice(int bbsseq) throws SQLException;
	//notice update
	int updateNotice(NoticeVo noticeVo) throws SQLException;
}
