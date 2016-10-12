package sist.co.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import sist.co.model.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private String ns = "notice.";

	@Override
	public List<NoticeDTO> getNoticeList(int member_seq) throws Exception {
		List<NoticeDTO> noticeList = new ArrayList<NoticeDTO>();
		noticeList = sqlSession.selectList(ns+"getNoticeList", member_seq);
		return noticeList;
	}
	
	
	@Override
	public boolean updateNoticeList(int member_seq) throws Exception {
		sqlSession.update(ns+"updateNoticeList", member_seq);
		return true;
	}
	
	@Override
	public boolean IntNotice0(NoticeDTO noticeDTO) throws Exception {
		sqlSession.insert(ns+"IntNotice0", noticeDTO);
		return true;
	}


	@Override
	public boolean IntNotice1(NoticeDTO noticeDTO) throws Exception {
		sqlSession.insert(ns+"IntNotice1", noticeDTO);
		return true;
	}


	@Override
	public boolean IntNotice2(NoticeDTO noticeDTO) throws Exception {
		sqlSession.insert(ns+"IntNotice2", noticeDTO);
		return true;
	}


	@Override
	public boolean IntNotice3(NoticeDTO noticeDTO) throws Exception {
		sqlSession.insert(ns+"IntNotice3", noticeDTO);
		return true;
	}


	@Override
	public boolean IntNotice4(NoticeDTO noticeDTO) throws Exception {
		sqlSession.insert(ns+"IntNotice4", noticeDTO);
		return true;
	}


	@Override
	public boolean IntNotice5(NoticeDTO noticeDTO) throws Exception {
		sqlSession.insert(ns+"IntNotice5", noticeDTO);
		return true;
	}
	
	

}
