package com.bit.pro.service;

import java.sql.SQLException;
import java.util.List;

import com.bit.pro.vo.NoticeVo;

public interface NoticeService {
	//notice list
	List<NoticeVo> selectNotice(int nowPage, int scale) throws SQLException;
	//notice 레코드 갯수
	int countArticle() throws SQLException;
	/***********************************************************************/
	//notice detail
	NoticeVo detailNotice(Integer bbsnum) throws SQLException;
	//notice detail클릭 시 조회수 증가
	int viewCount(Integer bbsseq)throws SQLException;
	//prev 제목
	NoticeVo detailPrevNotice(int prevbbsseq) throws SQLException;
	//next 제목
	NoticeVo detailNextNotice(int nextbbsseq) throws SQLException;
	/***********************************************************************/
	//notice add
	int addNotice(NoticeVo noticeVo) throws SQLException;
	//notice delete
	void deleteNotice(int bbsseq) throws SQLException;
	//notice update
	int updateNotice(NoticeVo noticeVo) throws SQLException;
}
