package com.bit.pro.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.bit.pro.vo.NoticeVo;

@Repository("noticeDao")
public class NoticeDaoImpl implements NoticeDao {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDao.class);
	private static final String NAMESPACE = "com.bit.pro.mappers.noticeMapper";
	
	//notice list
	@Override
	public List<NoticeVo> selectNotice(int nowPage, int scale) throws SQLException {
		//맵에 저장
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("nowPage", nowPage);
		map.put("scale", scale);
		
		return sqlSession.selectList(NAMESPACE + ".selectNotice", map);
	}
	//notice 레코드 개수
	@Override
	public int countArticle() throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".countArticle");
	}
	/***********************************************************************/
	//notice detail
	@Override
	public NoticeVo detailNotice(Integer bbsnum) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".detailNotice", bbsnum);
	}
	//조회수 증가
	@Override
	public int updateViewCnt(Integer bbsseq) throws SQLException {
		return sqlSession.update(NAMESPACE + ".updateViewCnt" , bbsseq);
	}
	//notice prev detail
	@Override
	public NoticeVo prevDetailNotice(int prevbbsseq) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".prevDetailNotice", prevbbsseq);
	}
	//notice prev detail
	@Override
	public NoticeVo nextDetailNotice(int nextbbsseq) throws SQLException {
		return sqlSession.selectOne(NAMESPACE + ".prevDetailNotice", nextbbsseq);
	}
	/***********************************************************************/
	//notice add
	@Override
	public int addNotice(NoticeVo noticeVo) throws SQLException {
		return sqlSession.insert(NAMESPACE + ".addNotice", noticeVo);
	}
	//notice delete
	@Override
	public void deleteNotice(int bbsseq) throws SQLException {
		sqlSession.delete(NAMESPACE + ".deletephotoFK",bbsseq);
		sqlSession.delete(NAMESPACE + ".deleteNotice", bbsseq);
	}
	//notice update
	@Override
	public int updateNotice(NoticeVo noticeVo) throws SQLException {
		return sqlSession.update(NAMESPACE + ".updateNotice" , noticeVo);
	}
}
