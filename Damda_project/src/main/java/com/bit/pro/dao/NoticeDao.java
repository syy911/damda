package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.NoticeVo;

public interface NoticeDao {
	//notice list
	List<NoticeVo> selectNotice(int nowPage, int scale) throws SQLException;
	//notice 레코드 개수
	int countArticle() throws SQLException;
	/***********************************************************************/
	//notice detail
	NoticeVo detailNotice(Integer bbsnum) throws SQLException;
	//조회수증가
	int updateViewCnt(Integer bbsseq) throws SQLException;
	//notice prev detail
	NoticeVo prevDetailNotice(int prevbbsseq) throws SQLException;
	//notice next detail
	NoticeVo nextDetailNotice(int nextbbsseq) throws SQLException;
	/***********************************************************************/
	//notice add
	int addNotice(NoticeVo noticeVo) throws SQLException;
	//notice delete
	void deleteNotice(int bbsseq) throws SQLException;
	//notice update
	int updateNotice(NoticeVo noticeVo) throws SQLException;
}
